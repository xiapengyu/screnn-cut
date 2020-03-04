<template>
  <el-dialog
    :title="$t('message.detail')"
    :close-on-click-modal="false"
    :visible.sync="visible"
    append-to-body>

    <div>
      <table style="width: 100%;">
        <tr>
          <td style="width: 50%;"><div><div class="info-label">{{$t('message.orderNo')}}:</div> <div class="info-value">{{ order.orderNo }}</div></div></td>
          <td><div><div class="info-label">{{$t('message.clientName')}}:</div> <div class="info-value">{{ order.userName }}</div></div></td>
        </tr>
        <tr>
          <td style="width: 50%;"><div><div class="info-label">{{$t('message.clientEmail')}}:</div> <div class="info-value">{{ order.userEmail }}</div></div></td>
          <td><div><div class="info-label">{{$t('message.clientPhone')}}:</div> <div class="info-value">{{ order.phone }}</div></div></td>
        </tr>
        <tr>
          <td style="width: 50%;"><div><div class="info-label">{{$t('message.status')}}:</div> <div class="info-value">
            <el-tag v-if="order.status === 1" size="small">{{$t('message.noConfirm')}}</el-tag>
            <el-tag v-else-if="order.status === 2" size="small" type="success">{{$t('message.confirmed')}}</el-tag>
            <el-tag v-else-if="order.status === 3" size="small" type="danger">{{$t('message.rejected')}}</el-tag>
          </div></div></td>
        </tr>
        <tr>
          <td colspan="2"><div><div class="info-label">{{$t('message.clientAddress')}}:</div> <div class="info-value">{{ order.address }}</div></div></td>
        </tr>
        <tr>
          <td colspan="2"><div><div class="info-label">{{$t('message.remark')}}:</div> <div class="info-value">{{ order.remark }}</div></div></td>
        </tr>
      </table>
    </div>

    <div>
      <table style="width: 100%;">
        <tr>
          <td><h3>{{$t('message.orderGoodsList')}}： </h3></td>
          <td align="right"><h4>{{$t('message.totalPrice')}}： {{ allTotalPrice }}</h4></td>
        </tr>
      </table>
    </div>
    <el-table fixed :data="this.detailList" v-loading="dataListLoading" border style="width: 100%;" height="500">
      <el-table-column
        prop="goods.name"
        :label="$t('message.productName')">
      </el-table-column>
      <el-table-column
        prop="gosType.typeName"
        width="120"
        :label="$t('message.productType')">
      </el-table-column>
      <el-table-column
        prop="goods.price"
        width="100"
        :label="$t('message.unitPrice')">
      </el-table-column>
      <el-table-column
        prop="goods.discountPrice"
        width="120"
        :label="$t('message.discountPrice')">
      </el-table-column>
      <el-table-column
        prop="amount"
        width="120"
        :label="$t('message.amount')">
      </el-table-column>
    </el-table>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">{{$t('message.cancle')}}</el-button>
    </span>
  </el-dialog>
</template>

<style>
  .info-label{
    width: 140px;
    float: left;
  }
  .info-value{
    float: left;
  }
</style>

<script>
  export default {
    data () {
      return {
        dataListLoading: false,
        visible: false,
        allTotalPrice: '',
        order: '',
        detailList: []
      }
    },
    methods: {
      init (id, accountType) {
        this.visible = true
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/purchaseOrder/detail`),
          method: 'post',
          data: this.$http.adornData({
            'id': id,
            'accountType': accountType
          })
        }).then(({data}) => {
          this.allTotalPrice = data.allTotalPrice
          this.order = data.order
          this.detailList = data.detailList
          this.dataListLoading = false
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
