<template>
  <el-dialog
    :title="dataForm.op===0 ? '查看' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <div slot="title" v-if="dataForm.opt==0">{{$t('message.read')}}</div>
    <div slot="title" v-else-if="dataForm!=0">{{$t('message.edit')}}</div>
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="120px">
      <el-input v-if="false" v-model="dataForm.id"></el-input>
      <el-form-item :label="$t('message.name')" prop="name" :class="{ 'is-required': true }" >
        <el-input v-model="dataForm.name" :placeholder="$t('message.name')" :disabled="dataForm.op === 0"></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.recommend')" prop="comment" :class="{ 'is-required': true }">
        <el-input type='textarea' rows="5" :placeholder="$t('message.recommend')" v-model="dataForm.comment" :disabled="dataForm.op === 0"></el-input>
      </el-form-item>
      <el-form-item :label="$t('message.price')" prop="price" :class="{ 'is-required': true }">
          <el-input v-model="dataForm.price" placeholder="0.00" :disabled="dataForm.op === 0">
            <template slot="append">元</template>
          </el-input>
      </el-form-item>
      <el-form-item :label="$t('message.isDiscount')" size="mini" prop="isDiscount" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.isDiscount" :disabled="dataForm.op === 0" @change="radioChange(dataForm.isDiscount)">
          <el-radio :label="0">{{$t('message.no')}}</el-radio>
          <el-radio :label="1">{{$t('message.yes')}}</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item :label="$t('message.discountPrice')" prop="discountPrice" v-if="dataForm.isDiscount === 1">
          <el-input v-model="dataForm.discountPrice" placeholder="0.00" :disabled="dataForm.op === 0">
            <template slot="append">元</template>
          </el-input>
      </el-form-item>
      <el-form-item :label="$t('message.goodsType')" :class="{ 'is-required': true }">
        <el-checkbox-group v-model="typeIdList" :disabled="dataForm.op === 0">
          <el-checkbox v-for="item in typeList" :key="item.id" :label="item.id">{{item.typeName}}</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
      <el-form-item :label="$t('message.img')" :class="{ 'is-required': true }">
          <el-upload
            list-type="picture-card"
            :action=uploadUrl
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove"
            :on-success="handleAvatarSuccess"
            :file-list=imageDtoList
            :before-upload="beforeAvatarUpload"
            :disabled="dataForm.op === 0">
            <i class="el-icon-plus"></i>
          </el-upload>
          <el-dialog :visible.sync="dialogVisible">
            <img width="100%" :src="dialogImageUrl" alt="">
          </el-dialog>
        </el-form-item>
      <el-form-item :label="$t('message.stock')" prop="stock" :class="{ 'is-required': true }">
          <el-input-number v-model="dataForm.stock" controls-position="right" :min="0" :label="$t('message.stock')" :disabled="dataForm.op === 0"></el-input-number>
      </el-form-item>
      <el-form-item :label="$t('message.status')" size="mini" prop="status" :class="{ 'is-required': true }">
        <el-radio-group v-model="dataForm.status" :disabled="dataForm.op === 0">
          <el-radio :label="0">{{$t('message.putaway')}}</el-radio>
          <el-radio :label="1">{{$t('message.soldOut')}}</el-radio>
        </el-radio-group>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">{{$t('message.close')}}</el-button>
      <el-button v-if="dataForm.op === 1" @click="saveGoodsInfo()">{{$t('message.submit')}}</el-button>
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
        imageDtoList: [],
        dialogImageUrl: '',
        dialogVisible: false,
        typeList: [],
        typeIdList: [],
        dataForm: {
          id: '',
          op: '',
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
      init (id, op) {
        this.dataForm.id = id
        this.dataForm.op = op
        this.uploadUrl = window.SITE_CONFIG.baseUrl + '/sys/image/uploadFilesToNginx'
        this.dataForm.isDiscount = 0
        this.dataForm.discountPrice = 0
        this.typeIdList = []
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/goods/info`),
          method: 'post',
          data: this.$http.adornData({
            'id': this.dataForm.id
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.visible = true
            this.dataForm.id = data.goods.id
            this.dataForm.name = data.goods.name
            this.dataForm.comment = data.goods.comment
            this.dataForm.price = data.goods.price
            this.dataForm.isDiscount = data.goods.isDiscount
            this.dataForm.discountPrice = data.goods.discountPrice
            this.dataForm.stock = data.goods.stock
            this.dataForm.status = data.goods.status
            this.goodsImageList = data.goodsImageList
            this.typeList = data.typeList
            this.typeIdList = data.typeIdList
            this.imageDtoList = data.imageDtoList
          } else {
            this.$message.error(data.msg)
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
            this.$http({
              url: this.$http.adornUrl(`/sys/goods/saveGoods`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id,
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
