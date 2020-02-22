<template>
  <el-dialog
    :title="详情"
    :close-on-click-modal="false"
    :visible.sync="visible">

    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
      <el-button v-if="this.dataForm.op === 1" @click="saveGoodsInfo()">保存</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
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
          name: '',
          comment: '',
          price: 0,
          stock: 0,
          status: 1
        }
      }
    },
    methods: {
      init (orderNo) {
        this.dataForm.orderNo = orderNo
        this.visible = true
        this.dataForm.isDiscount = 0
        this.typeIdList = []
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/purchaseOrder/detail`),
          method: 'post',
          data: this.$http.adornData({
            'orderNo': orderNo
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.visible = true
            this.dataForm.id = data.goods.id
            this.dataForm.name = data.goods.name
            this.dataForm.comment = data.goods.comment
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
