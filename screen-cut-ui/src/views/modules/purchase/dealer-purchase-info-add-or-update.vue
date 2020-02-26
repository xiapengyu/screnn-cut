<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    append-to-body>
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="100px" size="mini">
      <el-input v-if="false" v-model="dataForm.id"></el-input>

      <el-row :gutter="20">
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <el-form-item label="采购单号" >
              <el-input v-model="dataForm.orderNo" prop=""></el-input>
            </el-form-item>
            <el-form-item label="经销商名称">
              <el-input v-model="dataForm.dealerName" prop=""></el-input>
            </el-form-item>
            <el-form-item label="其他联系方式">
              <el-input v-model="dataForm.otherContact" prop=""></el-input>
            </el-form-item>
            <el-form-item label="刀片数">
              <el-input v-model="dataForm.bladeNo" prop=""></el-input>
            </el-form-item>
            <el-form-item label="刀片说明">
              <el-input type="textarea" v-model="dataForm.bladeExplain" :rows="3"></el-input>
            </el-form-item>
            <el-form-item label="机器数">
              <el-input v-model="dataForm.deviceNo" ></el-input>
            </el-form-item>
            <el-form-item label="机器说明">
              <el-input type="textarea" v-model="dataForm.deviceExplain" :rows="3"></el-input>
            </el-form-item>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="grid-content bg-purple">
            <el-form-item label="公司">
              <el-input v-model="dataForm.company" ></el-input>
            </el-form-item>
            <el-form-item label="经销商Email">
              <el-input v-model="dataForm.dealerEmail" ></el-input>
            </el-form-item>
            <el-form-item label="订单状态" v-if="dataForm.id!=0">
              <el-select v-model="dataForm.status">
                <el-option label="未确认" value="1"></el-option>
                <el-option label="已确认" value="2"></el-option>
                <el-option label="已拒绝" value="3"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="膜数">
              <el-input v-model="dataForm.filmNo" ></el-input>
            </el-form-item>
            <el-form-item label="膜说明">
              <el-input type="textarea" v-model="dataForm.filmExplain" :rows="3"></el-input>
            </el-form-item>
            <el-form-item label="次数">
              <el-input v-model="dataForm.useTimes" ></el-input>
            </el-form-item>
            <el-form-item v-if="dataForm.id!=0" label="创建时间">
              <el-input :disabled="true" v-model="dataForm.createTime"></el-input>
            </el-form-item>
            <el-form-item label="回复">
              <el-input type="textarea" :rows="3" v-model="dataForm.comment"></el-input>
            </el-form-item>
          </div>
        </el-col>
      </el-row>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
      <el-button @click="saveOrderInfo()" type="primary">保存</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
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
        }
      }
    },
    methods: {
      init (id) {
        this.visible = true
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
