<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="批次" prop="batchNo">
          <el-input v-model="dataForm.batchNo" placeholder="批次" disabled></el-input>
      </el-form-item>
      <el-form-item label="兑换编码" prop="redeemNo">
          <el-input v-model="dataForm.redeemNo" placeholder="兑换编码" disabled></el-input>
      </el-form-item>
      <el-form-item label="二维码" prop="url">
          <img :src="dataForm.url" alt="" height="200" width="200">
      </el-form-item>
      <el-form-item label="切割次数" prop="times">
          <el-input v-model="dataForm.times" placeholder="切割次数" disabled></el-input>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status" :disabled="this.dataForm.status===2 || this.dataForm.op===0">
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">启用</el-radio>
          <el-radio :label="2">已兑换</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
      <el-button v-show="dataForm.op===1" type="primary" @click="dataFormSubmit()">确定</el-button>
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
