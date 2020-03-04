<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    append-to-body>
    <!-- 自定义动态的弹窗标题 -->
    <div slot="title" v-if="dataForm.opt==1">{{$t('message.read')}}</div>
    <div slot="title" v-else-if="!dataForm.id">{{$t('message.add')}}</div>
    <div slot="title" v-else-if="dataForm.id">{{$t('message.edit')}}</div>
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="120px" size="mini">
      <el-input v-if="false" v-model="dataForm.id"></el-input>
      <el-row :gutter="20">
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <el-form-item :label="$t('message.orderNo')" prop="orderNo"  v-if="dataForm.id!=0" >
              <el-input v-model="dataForm.orderNo" :disabled="true"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.dealerName')" prop="dealerName" >
              <el-input v-model="dataForm.dealerName" :placeholder="$t('message.required')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.otherContact')" prop="otherContact">
              <el-input v-model="dataForm.otherContact" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.bladeNo')" prop="bladeNo" >
              <el-input v-model="dataForm.bladeNo" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.bladeExplain')" prop="bladeExplain" >
              <el-input type="textarea" v-model="dataForm.bladeExplain" :rows="3" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.deviceNo')" prop="deviceNo" >
              <el-input v-model="dataForm.deviceNo" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.deviceExplain')" prop="deviceExplain">
              <el-input type="textarea" v-model="dataForm.deviceExplain"  :rows="3" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <el-form-item :label="$t('message.company')" prop="company" >
              <el-input v-model="dataForm.company" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.dealerEmail')" prop="dealerEmail" >
              <el-input v-model="dataForm.dealerEmail" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.status')" prop="status" v-if="dataForm.id!=0" >
              <el-select v-model="dataForm.status" >
                <el-option :label="$t('message.noConfirm')" value="1"></el-option>
                <el-option :label="$t('message.confirmed')" value="2"></el-option>
                <el-option :label="$t('message.rejected')" value="3"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item :label="$t('message.filmNo')" prop="filmNo" >
              <el-input v-model="dataForm.filmNo" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.filmExplain')" prop="filmExplain" >
              <el-input type="textarea" v-model="dataForm.filmExplain" :rows="3" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.useTimes')" prop="useTimes" >
              <el-input v-model="dataForm.useTimes" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
            <el-form-item v-if="dataForm.id!=0" :label="$t('message.createTime')" prop="createTime">
              <el-input :disabled="true" v-model="dataForm.createTime" ></el-input>
            </el-form-item>
            <el-form-item :label="$t('message.comment')"  prop="comment">
              <el-input type="textarea" :rows="3" v-model="dataForm.comment" :placeholder="$t('message.optional')"></el-input>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">{{$t('message.close')}}</el-button>
      <el-button @click="saveOrderInfo()" type="primary" v-if="dataForm.opt!=1">{{$t('message.save')}}</el-button>
    </span>
  </el-dialog>
</template>

<script>
  import { isIngeger } from '@/utils/validate'
  export default {
    data () {
      var isvalidateInteger = (rule, value, callback) => {
        if (!isIngeger(value)) {
          callback(new Error('请输入正整数'))
        } else {
          callback()
        }
      }
      return {
        visible: false,
        dataForm: {
          opt: '',
          orderNo: '',
          company: '',
          dealerName: '',
          dealerEmail: '',
          otherContact: '',
          bladeNo: '',
          bladeExplain: '',
          filmNo: '',
          filmExplain: '',
          deviceNo: '',
          deviceExplain: '',
          useTimes: '',
          comment: '',
          createTime: '',
          status: ''
        },
        dataRule: {
          dealerName: [
            { required: true, message: '经销商名不能为空', trigger: 'blur' }
          ],
          dealerEmail: [
            { required: true, message: '经销商邮箱不能为空', trigger: 'blur' },
            {
              validator: function (rule, value, callback) {
                if (/^\w{1,64}@[a-z0-9]{1,256}(\.[a-z]{2,6}){1,2}$/i.test(value) === false) {
                  callback(new Error('邮箱格式错误'))
                } else {
                  callback()
                }
              },
              trigger: 'blur'
            }
          ],
          bladeNo: [
            { validator: isvalidateInteger, message: '请输入正整数', trigger: 'change' }
          ],
          filmNo: [
            { validator: isvalidateInteger, message: '请输入正整数', trigger: 'change' }
          ],
          deviceNo: [
            { validator: isvalidateInteger, message: '请输入正整数', trigger: 'change' }
          ],
          useTimes: [
            { validator: isvalidateInteger, message: '请输入正整数', trigger: 'change' }
          ]
        }
      }
    },
    methods: {
      init (id, opt) {
        this.visible = true
        this.dataForm.opt = opt
        this.dataForm.id = id || 0
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/dealerPurchase/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.order.id
              this.dataForm.orderNo = data.order.orderNo
              this.dataForm.company = data.order.company
              this.dataForm.dealerName = data.order.dealerName
              this.dataForm.dealerEmail = data.order.dealerEmail
              this.dataForm.otherContact = data.order.otherContact
              this.dataForm.bladeNo = data.order.bladeNo
              this.dataForm.bladeExplain = data.order.bladeExplain
              this.dataForm.filmNo = data.order.filmNo
              this.dataForm.filmExplain = data.order.filmExplain
              this.dataForm.deviceNo = data.order.deviceNo
              this.dataForm.deviceExplain = data.order.deviceExplain
              this.dataForm.useTimes = data.order.useTimes
              this.dataForm.comment = data.order.comment
              this.dataForm.createTime = data.order.createTime
              this.dataForm.status = data.order.status + ''
            } else {
              this.$message.error(data.msg)
            }
          })
        } else {
          this.$refs['dataForm'].resetFields()
        }
      },
      saveOrderInfo () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/dealerPurchase/save`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'orderNo': this.dataForm.orderNo,
                'company': this.dataForm.company,
                'dealerName': this.dataForm.dealerName,
                'dealerEmail': this.dataForm.dealerEmail,
                'otherContact': this.dataForm.otherContact,
                'bladeNo': this.dataForm.bladeNo,
                'bladeExplain': this.dataForm.bladeExplain,
                'filmNo': this.dataForm.filmNo,
                'filmExplain': this.dataForm.filmExplain,
                'deviceNo': this.dataForm.deviceNo,
                'deviceExplain': this.dataForm.deviceExplain,
                'useTimes': this.dataForm.useTimes,
                'comment': this.dataForm.comment,
                'createTime': this.dataForm.createTime,
                'status': this.dataForm.status
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 3000,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      },
      handleAvatarSuccess: function (response) {
        this.goodsImageList.push(response.imagePath)
      },
      beforeAvatarUpload (file) {
        var test1 = /^image\/(jpeg|png|jpg)$/.test(file.type)
        const isLt5M = file.size / 1024 / 1024 <= 5
        var image5 = this.goodsImageList.length <= 3
        if (!image5) {
          this.$message.error('最多上传3张图片')
        }
        if (!test1) {
          this.$message.error('上传图片格式不对，只支持(jpeg|png|jpg)')
        }
        if (!isLt5M) {
          this.$message.error('上传图片大小不能超过 5M')
        }
        return test1 && isLt5M && image5
      },
      handleRemove (file, fileList) {
        this.goodsImageList.pop(file)
      },
      handlePictureCardPreview (file) {
        this.dialogImageUrl = file.url
        this.dialogVisible = true
      }
    }
  }
</script>
