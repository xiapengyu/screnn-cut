<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="品牌名称" prop="brandName" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.brandName" placeholder="手机品牌"></el-input>
      </el-form-item>
      <el-form-item label="品牌图片" prop="brandImg" :class="{ 'is-required': true }">
        <el-upload
          class="upload-demo"
          drag
          :action= this.uploadUrl
          :show-file-list="false"
          :on-success="handleUploadSuccess"
          :before-upload="beforeUpload"
          multiple>
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          <div class="el-upload__tip" slot="tip">文件大小不能超过50M</div>
        </el-upload>
      </el-form-item>
      <el-form-item label="" prop="">
          <img :src="dataForm.brandImg" alt="" height="200" width="200">
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        uploadUrl: '',
        dialogVisible: false,
        dialogImageUrl: '',
        dataForm: {
          id: 0,
          brandImg: '',
          brandName: ''
        },
        dataRule: {
          brandImg: [
            { required: true, message: '品牌图片不能为空', trigger: 'blur' }
          ],
          brandName: [
            { required: true, message: '品牌名称不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.uploadUrl = window.SITE_CONFIG.baseUrl + '/sys/image/uploadFilesToNginx'
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/phoneBrand/queryPhoneBrandInfo`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.brand.id
              this.dataForm.brandImg = data.brand.brandImg
              this.dataForm.brandName = data.brand.brandName
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
              url: this.$http.adornUrl(`/sys/phoneBrand/savePhoneBrandInfo`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'brandImg': this.dataForm.brandImg,
                'brandName': this.dataForm.brandName
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
      },
      handleUploadSuccess: function (response) {
        this.dataForm.brandImg = response.imagePath
        this.dialogImageUrl = response.imagePath
        this.dialogVisible = true
      },
      beforeUpload (file) {
        var test1 = /^image\/(jpeg|png|jpg)$/.test(file.type)
        const isLt5M = file.size / 1024 / 1024 <= 5
        if (!test1) {
          this.$message.error('上传图片格式不对，只支持(jpeg|png|jpg)')
        }
        if (!isLt5M) {
          this.$message.error('上传图片大小不能超过5M')
        }
        return test1 && isLt5M
      }
    }
  }
</script>
