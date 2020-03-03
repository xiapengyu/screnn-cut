<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <div slot="title" v-if="dataForm.op==0">{{$t('message.read')}}</div>
    <div slot="title" v-else-if="dataForm.op!=0">{{$t('message.edit')}}</div>
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item :label="$t('message.userName')" prop="userName">
          <el-input v-model="dataForm.userName" :placeholder="$t('message.userName')" disabled></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.email')" prop="email">
          <el-input v-model="dataForm.email" :placeholder="$t('message.email')" disabled></el-input>
      </el-form-item>
      <!-- <el-form-item label="头像" prop="avatar">
          <img :src="dataForm.avatar" alt="" height="200" width="200">
      </el-form-item> -->
      <el-form-item :label="$t('message.serialNo')" prop="serialNo">
          <el-input v-model="dataForm.serialNo" :placeholder="$t('message.serialNo')" disabled></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.usedTimes')" prop="useAmount">
          <el-input-number v-model="dataForm.useAmount" controls-position="right" :min="0" :label="$t('message.usedTimes')" disabled></el-input-number>
      </el-form-item>
      <el-form-item :label="$t('message.surplusTimes')" prop="unuseAmount" :class="{ 'is-required': true }">
        <el-input-number v-model="dataForm.unuseAmount" controls-position="right" :min="0" :label="$t('message.surplusTimes')" :disabled="this.dataForm.op===0"></el-input-number>
      </el-form-item>
      <el-form-item :label="$t('message.status')" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status" :disabled="this.dataForm.op===0">
          <el-radio :label="0">{{$t('message.able')}}</el-radio>
          <el-radio :label="1">{{$t('message.ok')}}</el-radio>
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
          userName: '',
          email: '',
          avatar: '',
          serialNo: '',
          phoneModelName: '',
          useAmount: '',
          unuseAmount: '',
          status: 1
        },
        dataRule: {
          unuseAmount: [
            { required: true, message: '未用次数不能为空', trigger: 'blur' }
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
            url: this.$http.adornUrl(`/sys/account/queryAccountInfo`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.account.id
              this.dataForm.userName = data.account.userName
              this.dataForm.email = data.account.email
              this.dataForm.avatar = data.account.avatar
              this.dataForm.serialNo = data.account.serialNo
              this.dataForm.phoneModelName = data.account.phoneModelName
              this.dataForm.useAmount = data.account.useAmount
              this.dataForm.unuseAmount = data.account.unuseAmount
              this.dataForm.status = data.account.status
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
              url: this.$http.adornUrl(`/sys/account/saveAccount`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'userName': this.dataForm.userName,
                'email': this.dataForm.email,
                'avatar': this.dataForm.avatar,
                'serialNo': this.dataForm.serialNo,
                'phoneModelName': this.dataForm.phoneModelName,
                'useAmount': this.dataForm.useAmount,
                'unuseAmount': this.dataForm.unuseAmount,
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
