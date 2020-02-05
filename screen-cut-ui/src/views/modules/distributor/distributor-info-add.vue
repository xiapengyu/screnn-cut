<template>
  <el-dialog
    title="新增"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="公司名称" prop="name" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.name" placeholder="公司名称"></el-input>
      </el-form-item>
      <el-form-item label="公司地址" prop="address" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.address" placeholder="公司地址"></el-input>
      </el-form-item>
      <el-form-item label="联系人" prop="contact" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.contact" placeholder="联系人"></el-input>
      </el-form-item>
      <el-form-item label="联系方式" prop="phone" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.phone" placeholder="联系方式"></el-input>
      </el-form-item>
      <el-form-item label="邮箱" prop="email" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.email" placeholder="邮箱"></el-input>
      </el-form-item>
      <el-form-item label="识别码" prop="identifier" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.identifier" placeholder="识别码"></el-input>
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
        dataForm: {
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
              url: this.$http.adornUrl(`/sys/distributor/saveDistributorInfo`),
              method: 'post',
              data: this.$http.adornData({
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
