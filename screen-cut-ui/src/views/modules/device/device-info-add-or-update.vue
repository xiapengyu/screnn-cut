<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="序列码" prop="serialNo" :class="{ 'is-required': true }">
        <el-input v-model="dataForm.serialNo" placeholder="序列码" disabled></el-input>
      </el-form-item>
      <el-form-item label="经销商" prop="creatorName" :class="{ 'is-required': true }">
        <el-input v-model="dataForm.creatorName" placeholder="经销商" disabled></el-input>
      </el-form-item>
      <el-form-item label="类型" prop="type" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.type" :disabled="this.dataForm.op===0">
          <el-radio :label="1">不限次数</el-radio>
          <el-radio :label="2">有限次数</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="剩余次数" prop="remainTimes" :class="{ 'is-required': true }">
          <el-input-number v-model="dataForm.remainTimes" controls-position="right" 
          :min="0" label="剩余次数" :disabled="dataForm.type === 1 || this.dataForm.op===0"></el-input-number>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.status" :disabled="this.dataForm.op===0">
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">正常</el-radio>
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
        userList: [],
        dataForm: {
          op: 0,
          id: 0,
          serialNo: '',
          creatorName: '',
          type: 1,
          status: 1,
          remainTimes: 0
        },
        dataRule: {
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
      init (id, op) {
        this.dataForm.id = id
        this.dataForm.op = op
        this.visible = true
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/device/info`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.device.id
              this.dataForm.serialNo = data.device.serialNo
              this.dataForm.creatorName = data.device.creatorName
              this.dataForm.type = data.device.type
              this.dataForm.remainTimes = data.device.remainTimes
              this.dataForm.status = data.device.status
              this.userList = data.userList
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
            if (!this.dataForm.unuseAmount < 0) {
              this.$message.error('未用次数必须大于0')
            }
            this.$http({
              url: this.$http.adornUrl(`/sys/device/saveDeviceInfo`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'type': this.dataForm.type,
                'remainTimes': this.dataForm.remainTimes,
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
