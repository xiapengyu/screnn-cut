<template>
  <el-dialog title="新增"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-input v-if="false" v-model="dataForm.id"></el-input>
      <el-form-item label="名称" prop="name" :class="{ 'is-required': true }">
        <el-input v-model="dataForm.name" placeholder="名称"></el-input>
      </el-form-item>
      <el-form-item label="描述" prop="comment" :class="{ 'is-required': true }">
        <el-input type='textarea' rows="5" placeholder="描述" v-model="dataForm.comment"></el-input>
      </el-form-item>
      <el-form-item label="价格" prop="price" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.price" placeholder="0.00">
            <template slot="append">元</template>
          </el-input>
      </el-form-item>
      <el-form-item label="是否打折" size="mini" prop="isDiscount" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.isDiscount" @change="radioChange(dataForm.isDiscount)">
          <el-radio :label="0">否</el-radio>
          <el-radio :label="1">是</el-radio>
        </el-radio-group>
      </el-form-item>
      <!-- <el-table-column
        prop="isDiscount"
        header-align="center"
        align="center"
        label="是否打折">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isDiscount === 1" size="small" type="danger">是</el-tag>
          <el-tag v-else size="small">否</el-tag>
        </template>
      </el-table-column> -->
      <el-form-item label="折扣价" prop="discountPrice" v-if="dataForm.isDiscount === 1">
          <el-input v-model="dataForm.discountPrice" placeholder="0.00">
            <template slot="append">元</template>
          </el-input>
      </el-form-item>
      <el-form-item label="商品类型" :class="{ 'is-required': true }">
        <el-checkbox-group v-model="typeIdList">
          <el-checkbox v-for="item in this.typeList" @change="change(item)" :key="item.id" :label="item.id">{{item.typeName}}</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item label="图片" :class="{ 'is-required': true }">
          <el-upload
            list-type="picture-card"
            ref="refresh"
            :action=this.uploadUrl
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
        </el-form-item>
      <el-form-item label="库存" prop="stock" :class="{ 'is-required': true }">
          <el-input-number v-model="dataForm.stock" controls-position="right" :min="0" label="库存"></el-input-number>
      </el-form-item>
      <el-form-item label="状态" size="mini" prop="status" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.status">
          <el-radio :label="0">下架</el-radio>
          <el-radio :label="1">上架</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="close()">取消</el-button>
      <el-button @click="saveGoodsInfo()">保存</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: true,
        saleStatusList: [],
        uploadUrl: '',
        goodsImageList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        typeList: [],
        typeIdList: [],
        dataForm: {
          id: '',
          name: '',
          comment: '',
          price: 0,
          isDiscount: 0,
          discountPrice: 0,
          stock: 0,
          status: 1
        },
        dataRule: {
          name: [
            { required: true, message: '名称不能为空', trigger: 'blur' }
          ],
          comment: [
            { required: true, message: '描述不能为空', trigger: 'blur' }
          ],
          price: [
            { required: true, message: '价格不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init () {
        this.visible = true
        this.uploadUrl = window.SITE_CONFIG.baseUrl + '/sys/image/uploadImage'
        this.dataForm.isDiscount = 0
        this.typeIdList = []
        this.goodsImageList = []
        this.dialogImageUrl = ''
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/goods/queryGoodsTypeList`),
          method: 'post',
          data: this.$http.adornData()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.typeList = data.typeList
          }
        })
      },
      change (item) {
        console.log(this.typeIdList)
      },
      radioChange (isDiscount) {
        if (isDiscount === 0) {
          this.dataForm.discountPrice = 0
        }
      },
      saveGoodsInfo () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            if (this.dataForm.price <= 0) {
              this.$message.error('商品价格必须大于0')
            }
            if (this.dataForm.isDiscount === 1 && this.dataForm.discountPrice <= 0) {
              this.$message.error('折扣价格必须大于0')
            }
            if (this.typeIdList.size === 0) {
              this.$message.error('请选择商品类型')
            }
            if (this.goodsImageList.size === 0) {
              this.$message.error('请上传商品图片')
            }
            this.$http({
              url: this.$http.adornUrl(`/sys/goods/newGoods`),
              method: 'post',
              data: this.$http.adornData({
                'name': this.dataForm.name,
                'comment': this.dataForm.comment,
                'price': this.dataForm.price,
                'isDiscount': this.dataForm.isDiscount,
                'discountPrice': this.dataForm.discountPrice,
                'stock': this.dataForm.stock,
                'status': this.dataForm.status,
                'typeIdList': this.typeIdList,
                'goodsImageList': this.goodsImageList
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$refs.refresh.clearFiles()
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 300,
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
      close () {
        this.$refs.refresh.clearFiles()
        this.visible = false
      },
      handleAvatarSuccess: function (response) {
        this.goodsImageList.push(response.imagePath)
      },
      beforeAvatarUpload (file) {
        var test1 = /^image\/(jpeg|png|jpg)$/.test(file.type)
        const isLt5M = file.size / 1024 / 1024 <= 5
        var image5 = this.goodsImageList.length <= 3
        if (!image5) {
          this.$message.error('最多上传3张图片')
        }
        if (!test1) {
          this.$message.error('上传图片格式不对，只支持(jpeg|png|jpg)')
        }
        if (!isLt5M) {
          this.$message.error('上传图片大小不能超过 5M')
        }
        return test1 && isLt5M && image5
      },
      handleRemove (file, fileList) {
        this.goodsImageList.pop(file)
      },
      handlePictureCardPreview (file) {
        this.dialogImageUrl = file.url
        this.dialogVisible = true
      }

    }
  }
</script>
