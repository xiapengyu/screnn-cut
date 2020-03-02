package com.yunjian.core.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yunjian.common.utils.*;
import com.yunjian.core.dto.ResponseDto;
import com.yunjian.core.dto.SecurityContext;
import com.yunjian.core.entity.*;
import com.yunjian.core.mapper.RedeemCodeMapper;
import com.yunjian.core.service.*;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 兑换码信息表 服务实现类
 * </p>
 *
 * @author laizhiwen
 * @since 2020-02-26
 */
@Service
public class RedeemCodeServiceImpl extends ServiceImpl<RedeemCodeMapper, RedeemCode> implements IRedeemCodeService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private IImageService imageService;
    @Autowired
    private IAccountService accountService;
    @Autowired
    private IRedeemRecordService redeemRecordService;
    @Autowired
    private IDeviceService deviceService;

    @Value("${tomcat.file.server}")
    private String fileUploadServer = "";

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String redeemNo = StringUtil.obj2String(params.get("redeemNo"));
        String status = StringUtil.obj2String(params.get("status"));
        QueryWrapper<RedeemCode> queryWrapper = new QueryWrapper<RedeemCode>();
        if (!StringUtils.isEmpty(redeemNo)) {
            queryWrapper.like("redeem_no", redeemNo);
        }
        if(!StringUtils.isEmpty(status)){
            queryWrapper.like("status", status);
        }

        String userId = StringUtil.obj2String(params.get("creatorId"));
        if(!StringUtils.isEmpty(userId)){
            queryWrapper.eq("creator_id", Integer.parseInt(userId));
        }
        queryWrapper.eq("delete_flag", 1).orderByDesc("create_time");
        IPage<RedeemCode> page = this.page(new Query<RedeemCode>().getPage(params), queryWrapper);
        return new PageUtils(page);
    }

    @Override
    public R saveRedeemCode(Map<String, Object> params) {
        try {
            SysUserEntity loginUser = (SysUserEntity) SecurityUtils.getSubject().getPrincipal();
            //一共新增兑换码的数量
            Integer count = Integer.parseInt(StringUtil.obj2String(params.get("count")));
            //每张兑换码的切割次数
            Integer times = Integer.parseInt(StringUtil.obj2String(params.get("times")));
            Integer batchNo = getLastBatchNo() + 1;
            logger.info("当前新增批次的批次号{}", batchNo);
            String content = "/api/redeemCode/swapCode?redeemNo={0}";
            List<RedeemCode> records = new ArrayList<>();
            for(int i=1;i<=count;i++){
                RedeemCode code = new RedeemCode();
                code.setBatchNo(batchNo);
                String redeemNo = createRedeemNo(i);
                code.setRedeemNo(redeemNo);
                code.setContent(MessageFormat.format(content, redeemNo));
                code.setStatus(0);
                code.setTimes(times);
                //生成二维码图片上传文件服务器返回二维码的服务器地址
                String url = this.createQrcodeImage(code.getContent(), code.getRedeemNo());
                code.setUrl(url);
                code.setCreatorId(loginUser.getUserId());
                code.setCreateTime(new Date());
                code.setUpdateTime(new Date());
                code.setDeleteFlag(1);
                records.add(code);
            }
            if(!records.isEmpty()){
                this.saveBatch(records);
            }
        } catch (NumberFormatException e) {
            logger.error("批量新增兑换码异常", e);
            return  R.error("批量新增兑换码异常");
        }
        return R.ok();
    }

    @Override
    public ResponseDto swapCode(String redeemNo) {
        ResponseDto response = new ResponseDto(Constant.SUCCESS_CODE, null, Constant.SUCCESS_MESSAGE);
        RedeemCode code = null;
        try {
            Account account = SecurityContext.getUserPrincipal();
            Account a = accountService.getOne(new QueryWrapper<Account>()
                    .eq("id", account.getId()));
            Device device = deviceService.getOne(new QueryWrapper<Device>()
                    .eq("serial_no", a.getSerialNo()));
            if(device.getType() == 1){
                return new ResponseDto(Constant.FAIL_CODE, null, "当前用户不限制切割次数，无法使用兑换码");
            }
            code = this.getOne(new QueryWrapper<RedeemCode>()
                    .eq("redeem_no", redeemNo));
            logger.info("扫描的兑换码信息{}", JsonUtil.toJsonString(code));
            if(code == null){
                return new ResponseDto(Constant.FAIL_CODE, null, "无法识别的兑换码，如有疑问，请联系经销商处理");
            }else if (code.getStatus() == 0){   //未启用
                return new ResponseDto(Constant.FAIL_CODE, null, "兑换码尚未启用，如有疑问，请联系经销商处理");
            }else if (code.getStatus() == 2){   //已兑换
                return new ResponseDto(Constant.FAIL_CODE, null, "兑换码已被使用，如有疑问，请联系经销商处理");
            }
            //更新兑换码状态为已兑换
            code.setStatus(2);
            this.saveOrUpdate(code);

            //插入兑换记录
            RedeemRecord record = new RedeemRecord();
            record.setAccountId(account.getId());
            record.setRedeemNo(redeemNo);
            record.setCreateTime(new Date());
            redeemRecordService.saveOrUpdate(record);

            device.setRemainTimes(device.getRemainTimes() + code.getTimes());
            deviceService.saveOrUpdate(device);
        } catch (Exception e) {
            logger.error("扫描兑换码异常", e);
            //回退操作
            if(code != null){
                //回退状态
                code.setStatus(1);
                this.saveOrUpdate(code);
                //删除兑换记录
                redeemRecordService.remove(new QueryWrapper<RedeemRecord>().eq("redeem_no", code.getRedeemNo()));
            }
            return new ResponseDto(Constant.FAIL_CODE, null, "扫描兑换码异常");
        }
        return response;
    }

    /**
     * 获取上一批次的批次号
     * @return
     */
    private Integer getLastBatchNo(){
        Integer batchNo = 0;
        List<RedeemCode> list = this.list(new QueryWrapper<RedeemCode>().orderByDesc("batch_no"));
        if(!list.isEmpty()){
            batchNo = list.get(0).getBatchNo();
        }
        return batchNo;
    }

    private String createRedeemNo(int index){
        String redeemNo = "";
        redeemNo = DateUtils.format(new Date(), "yyyyMMddHHmmss")
                + "I" + String.format("%0" + 5 + "d", index);
        return redeemNo;
    }

    private String createQrcodeImage(String content, String redeemNo) {
        String fileName = redeemNo + ".png";
        String qrCodeUrl = "";
        try {
            //生成二维码图片，上传到文件服务器，返回图片地址
            InputStream in = QRCodeUtil.createQRCode(content, 1500, fileName);
            byte[] bytes = this.inputStream2byte(in);
            ResponseDto response = imageService.uploadImage(bytes, fileUploadServer + "qrcode/", ".png");
            String imageUrl = response.getData().toString();
            qrCodeUrl = imageUrl;
        } catch (Exception e) {
            logger.error("生成二维码出错>>[{}]", e);
            return "";
        }
        return qrCodeUrl;
    }

    private byte[] inputStream2byte(InputStream inputStream) throws IOException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        byte[] buff = new byte[100];
        int rc = 0;
        while ((rc = inputStream.read(buff, 0, 100)) > 0) {
            byteArrayOutputStream.write(buff, 0, rc);
        }
        return byteArrayOutputStream.toByteArray();
    }
}
