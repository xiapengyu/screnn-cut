<template>
  <el-dialog
    :title="'采购单详情'"
    :close-on-click-modal="false"
    :visible.sync="visible">

    <div>
      <table style="width: 100%;">
        <tr>
          <td style="width: 50%;">采购单号: {{ order.orderNo }}</td>
          <td>收货人姓名: {{ order.userName }}</td></tr>
        <tr>
          <td>客户邮箱: {{ order.userEmail }}</td>
          <td>收货人联系方式: {{ order.phone }}</td>
        </tr>
        <tr>
          <td>配送单状态:
            <el-tag v-if="order.status === 1" size="small">未确认</el-tag>
            <el-tag v-else-if="order.status === 2" size="small" type="success">已确认</el-tag>
            <el-tag v-else-if="order.status === 3" size="small" type="danger">已拒绝</el-tag>
          </td>
          <td>配送地址: {{ order.address }}</td>
        </tr>
        <tr><td colspan="2">备注: {{ order.remark }}</td></tr>
      </table>
    </div>

    <div>
      <table style="width: 100%;">
        <tr>
          <td><h3>采购单明细： </h3></td>
          <td align="right"><h4>总价(￥)： {{ allTotalPrice }}</h4></td>
        </tr>
      </table>
    </div>

    <el-table fixed :data="this.detailList" v-loading="dataListLoading" border style="width: 100%;" height="500">
      <el-table-column
        prop="goods.name"
        label="产品名称">
      </el-table-column>
      <el-table-column
        prop="gosType.typeName"
        width="100"
        label="产品类型">
      </el-table-column>
      <el-table-column
        prop="goods.price"
        width="100"
        label="单价￥">
      </el-table-column>
      <el-table-column
        prop="goods.discountPrice"
        width="120"
        label="折扣价￥">
      </el-table-column>
      <el-table-column
        prop="amount"
        width="120"
        label="数量">
      </el-table-column>
    </el-table>


    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
    </span>
  </el-dialog>
</template>

<style scoped>

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
