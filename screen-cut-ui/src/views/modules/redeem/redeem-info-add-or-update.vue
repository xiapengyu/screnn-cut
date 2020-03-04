<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <div slot="title" v-if="dataForm.opt==0">{{$t('message.read')}}</div>
    <div slot="title" v-else-if="dataForm!=0">{{$t('message.edit')}}</div>
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item :label="$t('message.batchNo')" prop="batchNo">
          <el-input v-model="dataForm.batchNo" :placeholder="$t('message.batchNo')" disabled></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.redeemCode')" prop="redeemNo">
          <el-input v-model="dataForm.redeemNo" :placeholder="$t('message.redeemCode')" disabled></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.qrCode')" prop="url">
          <img :src="dataForm.url" alt="" height="200" width="200">
      </el-form-item>
      <el-form-item :label="$t('message.qrCode')" prop="times">
          <el-input v-model="dataForm.times" :placeholder="$t('message.qrCode')" disabled></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.status')" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status" :disabled="this.dataForm.op===0">
          <el-radio :label="0">{{$t('message.disable')}}</el-radio>
          <el-radio :label="1">{{$t('message.able')}}</el-radio>
          <el-radio :label="2">{{$t('message.redeemed')}}</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">{{$t('message.close')}}</el-button>
      <el-button v-show="dataForm.op===1" type="primary" @click="dataFormSubmit()">{{$t('message.submit')}}</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dialogVisible: false,
        dataForm: {
          op: 0,
          id: 0,
          batchNo: '',
          redeemNo: '',
          url: '',
          times: '',
          status: 1
        }
      }
    },
    methods: {
      init (id, op) {
        this.dataForm.id = id
        this.dataForm.op = op
        this.visible = true
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/redeemCode/info`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.redeemCode.id
              this.dataForm.batchNo = data.redeemCode.batchNo
              this.dataForm.redeemNo = data.redeemCode.redeemNo
              this.dataForm.url = data.redeemCode.url
              this.dataForm.times = data.redeemCode.times
              this.dataForm.status = data.redeemCode.status
            } else {
              this.$message.error(data.msg)
            }
          })
        }
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/redeemCode/modifyRedeemCode`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id,
                'status': this.dataForm.status
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 500,
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
      }
    }
  }
</script>
