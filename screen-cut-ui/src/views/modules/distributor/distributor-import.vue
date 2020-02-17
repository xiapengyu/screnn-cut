<template>
  <el-dialog
    title="导入"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="经销商信息" prop="uploadFile" :class="{ 'is-required': true }">
        <el-upload
          class="upload-demo"
          drag
          :action= this.uploadUrl
          :show-file-list="false"
          :on-success="handleUploadSuccess"
          :before-upload="beforeUpload">
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          <div class="el-upload__tip" slot="tip">文件大小不能超过50M</div>
        </el-upload>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <a class='download' target="_blank" :href='dataForm.templateFileUrl' title="下载模板" style="margin-right:10px">下载模板</a>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        uploadUrl: '',
        dataForm: {
          uploadFile: '',
          templateFileUrl: ''
        }
      }
    },
    methods: {
      init () {
        this.visible = true
        // 模板文件上传接口
        this.uploadUrl = window.SITE_CONFIG.baseUrl + '/sys/distributor/uploadDistributorFile'
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        // 获取模板文件地址
        this.$http({
          url: this.$http.adornUrl(`/sys/distributor/downDistributorTemplate`),
          method: 'post',
          data: this.$http.adornData()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataForm.templateFileUrl = data.distributorTemplate
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      handleUploadSuccess: function (response) {
        console.log(response.code)
        if (response.code === 0) {
          this.$message({
            message: '文件上传成功',
            type: 'success',
            duration: 1500,
            onClose: () => {
              this.visible = false
              this.$emit('refreshDataList')
            }
          })
        } else {
          this.$message.error('文件上传失败')
        }
      },
      beforeUpload (file) {
        var FileExt = file.name.replace(/.+\./, '')
        const test1 = ['xls', 'xlsx'].indexOf(FileExt.toLowerCase()) > -1
        const isLt5M = file.size / 1024 / 1024 <= 50
        if (!test1) {
          this.$message.error('上传图片格式不对，只支持(xls|xlsx)')
        }
        if (!isLt5M) {
          this.$message.error('文件大小不能超过50M')
        }
        return isLt5M
      }
    }
  }
</script>
