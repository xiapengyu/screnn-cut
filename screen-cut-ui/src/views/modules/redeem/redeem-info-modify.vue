<template>
  <el-dialog
    title="更新"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="兑换码批次" prop="batchNo" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.batchNo" placeholder="兑换码批次"></el-input>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status" >
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">启用</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
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
          batchNo: '',
          status: 0
        },
        dataRule: {
          batchNo: [
            { required: true, message: '兑换码批次不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '兑换码状态不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init () {
        this.visible = true
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/redeemCode/modifyByBatchNo`),
              method: 'post',
              data: this.$http.adornData({
                'batchNo': this.dataForm.batchNo,
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
