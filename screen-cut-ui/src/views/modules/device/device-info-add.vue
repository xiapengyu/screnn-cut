<template>
  <el-dialog
    title="新增"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="序列码" prop="serialNo" :class="{ 'is-required': true }">
        <el-input v-model="dataForm.serialNo" placeholder="序列码"></el-input>
      </el-form-item>
      <el-form-item label="类型" prop="type" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.type">
          <el-radio :label="1">不限次数</el-radio>
          <el-radio :label="2">有限次数</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="剩余次数" prop="remainTimes" :class="{ 'is-required': true }">
          <el-input-number v-model="dataForm.remainTimes" controls-position="right" :min="0" label="剩余次数" :disabled="dataForm.type === 1"></el-input-number>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.status">
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">正常</el-radio>
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
        userList: [],
        dataForm: {
          serialNo: '',
          type: 1,
          status: 1,
          remainTimes: 0
        },
        dataRule: {
          serialNo: [
            { required: true, message: '序列码不能为空', trigger: 'blur' }
          ],
          type: [
            { required: true, message: '类型不能为空', trigger: 'blur' }
          ],
          remainTimes: [
            { required: true, message: '剩余次数不能为空', trigger: 'blur' }
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
        this.$http({
          url: this.$http.adornUrl(`/sys/device/queryTotalSysUser`),
          method: 'post',
          data: this.$http.adornData()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.userList = data.userList
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/device/saveDeviceInfo`),
              method: 'post',
              data: this.$http.adornData({
                'serialNo': this.dataForm.serialNo,
                'status': this.dataForm.status,
                'type': this.dataForm.type,
                'remainTimes': this.dataForm.remainTimes
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
