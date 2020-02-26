<template>
  <el-dialog
    title="新增"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="兑换码数量" prop="count">
          <el-input v-model="dataForm.count" placeholder="兑换码数量"></el-input>
      </el-form-item>
      <el-form-item label="每张切割次数" prop="times">
          <el-input v-model="dataForm.times" placeholder="每张兑换码切割次数"></el-input>
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
          count: '',
          times: ''
        },
        dataRule: {
          count: [
            { required: true, message: '兑换码数量不能为空', trigger: 'blur' }
          ],
          times: [
            { required: true, message: '每张兑换码切割次数不能为空', trigger: 'blur' }
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
            if (this.dataForm.count <= 0 || this.dataForm.count > 1000) {
              this.$message.error('兑换码数量必须大于0且小于1000')
            }
            if (this.dataForm.times <= 0 || this.dataForm.times > 1000) {
              this.$message.error('每张兑换码切割次数必须大于0且小于1000')
            }
            this.$http({
              url: this.$http.adornUrl(`/sys/redeemCode/newRedeemCode`),
              method: 'post',
              data: this.$http.adornData({
                'count': this.dataForm.count,
                'times': this.dataForm.times
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
