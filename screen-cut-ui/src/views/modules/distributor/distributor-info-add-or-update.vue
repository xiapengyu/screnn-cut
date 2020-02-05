<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="公司名称" prop="name" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.name" placeholder="公司名称" :disabled="this.dataForm.op===0"></el-input>
      </el-form-item>
      <el-form-item label="公司地址" prop="address" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.address" placeholder="公司地址" :disabled="this.dataForm.op===0"></el-input>
      </el-form-item>
      <el-form-item label="联系人" prop="contact" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.contact" placeholder="联系人" :disabled="this.dataForm.op===0"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.phone" placeholder="联系方式" :disabled="this.dataForm.op===0"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.email" placeholder="邮箱" :disabled="this.dataForm.op===0"></el-input>
      </el-form-item>
      <el-form-item label="识别码" prop="identifier" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.identifier" placeholder="识别码" :disabled="this.dataForm.op===0"></el-input>
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
        dataForm: {
          op: 0,
          id: 0,
          name: '',
          address: '',
          contact: '',
          phone: '',
          email: '',
          identifier: '',
          status: 1
        },
        dataRule: {
          name: [
            { required: true, message: '公司名称不能为空', trigger: 'blur' }
          ],
          address: [
            { required: true, message: '公司地址不能为空', trigger: 'blur' }
          ],
          contact: [
            { required: true, message: '联系人不能为空', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '联系方式不能为空', trigger: 'blur' }
          ],
          email: [
            { required: true, message: '邮箱不能为空', trigger: 'blur' }
          ],
          identifier: [
            { required: true, message: '识别码不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态不能为空', trigger: 'blur' }
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
            url: this.$http.adornUrl(`/sys/distributor/info`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.distributor.id
              this.dataForm.name = data.distributor.name
              this.dataForm.address = data.distributor.address
              this.dataForm.contact = data.distributor.contact
              this.dataForm.phone = data.distributor.phone
              this.dataForm.email = data.distributor.email
              this.dataForm.identifier = data.distributor.identifier
              this.dataForm.status = data.distributor.status
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
              url: this.$http.adornUrl(`/sys/distributor/saveDistributorInfo`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'address': this.dataForm.address,
                'contact': this.dataForm.contact,
                'phone': this.dataForm.phone,
                'email': this.dataForm.email,
                'identifier': this.dataForm.identifier,
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
