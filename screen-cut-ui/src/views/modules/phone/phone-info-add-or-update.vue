<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="手机图片" prop="phoneImage" :class="{ 'is-required': true }">
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
          <div class="el-upload__tip" slot="tip">文件大小不能超过5M</div>
        </el-upload>
      </el-form-item>
      <el-form-item label="" prop="">
          <img :src="dataForm.phoneImage" alt="" height="200" width="200">
      </el-form-item>
      <el-form-item label="手机品牌" prop="brandId" :class="{ 'is-required': true }">
          <el-select v-model="dataForm.brandId">
            <el-option v-for="item in brandList" :key="item.id" :label="item.brandName" :value="item.id" />
          </el-select>
      </el-form-item>
      <el-form-item label="手机型号" prop="phoneModel" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.phoneModel" placeholder="手机型号"></el-input>
      </el-form-item>
      <el-form-item label="屏幕宽度(单位:毫米)" prop="width" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.width" placeholder="屏幕宽度"></el-input>
      </el-form-item>
      <el-form-item label="屏幕高度(单位:毫米)" prop="height" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.height" placeholder="屏幕高度"></el-input>
      </el-form-item>
      <el-form-item label="排序码" prop="sortNum" :class="{ 'is-required': true }">
        <el-input-number v-model="dataForm.sortNum" controls-position="right" :min="0" label="排序码"></el-input-number>
      </el-form-item>
      <el-form-item label="机型状态" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status">
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">正常</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="PLT类型" size="mini" prop="type">
        <el-radio-group v-model="dataForm.type">
          <el-radio :label="1">全面</el-radio>
          <el-radio :label="2">带壳</el-radio>
          <el-radio :label="3">背贴</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="PLT文件MD5" size="mini" prop="md5" :class="{ 'is-required': true }">
        <el-input v-model="dataForm.md5" placeholder="PLT文件MD5"></el-input>
      </el-form-item>
      <el-form-item label="PLT文件" prop="pltUrl" :class="{ 'is-required': true }">
        <el-upload
          class="upload-demo"
          drag
          :action= this.uploadPltUrl
          :on-success="handleUploadPltSuccess"
          :before-upload="beforeUploadPlt"
          :on-remove="removePltFile"
          :file-list= this.fileList
          :limit="1">
          <i class="el-icon-upload"></i>
          <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
          <div class="el-upload__tip" slot="tip">文件大小不能超过50M</div>
        </el-upload>
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
        uploadPltUrl: '',
        dialogVisible: false,
        dialogImageUrl: '',
        brandList: [],
        fileList: [],
        dataForm: {
          id: 0,
          phoneImage: '',
          brandId: '',
          phoneBrand: '',
          phoneModel: '',
          sortNum: 1,
          status: 1,
          width: '',
          height: '',
          type: '',
          pltUrl: '',
          originName: '',
          md5: ''
        },
        dataRule: {
          phoneImage: [
            { required: true, message: '手机图片不能为空', trigger: 'blur' }
          ],
          pltUrl: [
            { required: true, message: 'PLT文件不能为空', trigger: 'blur' }
          ],
          brandId: [
            { required: true, message: '手机品牌不能为空', trigger: 'blur' }
          ],
          phoneModel: [
            { required: true, message: '手机型号不能为空', trigger: 'blur' }
          ],
          sortNum: [
            { required: true, message: '排序码不能为空', trigger: 'blur' }
          ],
          width: [
            { required: true, message: '屏幕宽度不能为空', trigger: 'blur' }
          ],
          height: [
            { required: true, message: '屏幕高度不能为空', trigger: 'blur' }
          ],
          md5: [
            { required: true, message: 'PLT文件md5值不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.uploadUrl = window.SITE_CONFIG.baseUrl + '/sys/image/uploadFilesToNginx'
        this.uploadPltUrl = window.SITE_CONFIG.baseUrl + '/sys/phone/uploadPltFile'
        this.fileList = []
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/phone/queryTotalBrand`),
          method: 'post',
          data: this.$http.adornData()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.brandList = data.brandList
          } else {
            this.$message.error(data.msg)
          }
        })
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/phone/queryPhoneModelInfo`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.model.id
              this.dataForm.phoneImage = data.model.phoneImage
              this.dataForm.brandId = data.model.brandId
              this.dataForm.phoneModel = data.model.phoneModel
              this.dataForm.status = data.model.status
              this.dataForm.sortNum = data.model.sortNum
              this.dataForm.width = data.model.width
              this.dataForm.height = data.model.height
              this.dataForm.type = data.model.type
              this.dataForm.pltUrl = data.model.pltUrl
              this.dataForm.originName = data.model.originName
              this.dataForm.md5 = data.model.md5
              this.brandList = data.brandList
              this.fileList.push(data.plt)
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
              url: this.$http.adornUrl(`/sys/phone/savePhoneModelInfo`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'phoneImage': this.dataForm.phoneImage,
                'phoneModel': this.dataForm.phoneModel,
                'brandId': this.dataForm.brandId,
                'width': this.dataForm.width,
                'height': this.dataForm.height,
                'sortNum': this.dataForm.sortNum,
                'status': this.dataForm.status,
                'type': this.dataForm.type,
                'pltUrl': this.dataForm.pltUrl,
                'originName': this.dataForm.originName,
                'md5': this.dataForm.md5
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
        this.dataForm.phoneImage = response.imagePath
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
      },
      handleUploadPltSuccess: function (response) {
        console.log(this.fileList)
        this.dataForm.pltUrl = response.plt.url
        this.dataForm.originName = response.plt.name
        this.fileList.push(response.plt)
        console.log(this.fileList)
      },
      beforeUploadPlt: function (file) {
        const isLt50M = file.size / 1024 / 1024 <= 50
        if (!isLt50M) {
          this.$message.error('上传文件大小不能超过50M')
        }
        const isTest = (this.dataForm.pltUrl === '')
        if (!isTest) {
          this.$message.error('请删除已上传的PLT文件后重新上传')
        }
        return isTest && isLt50M
      },
      removePltFile: function (file) {
        console.log('remove file')
        this.dataForm.pltUrl = ''
        this.fileList.pop(file)
      }
    }
  }
</script>
