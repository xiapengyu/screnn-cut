<template>
  <div class="mod-user">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.orderNo" :placeholder="$t('message.orderNo')" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="dataForm.email" :placeholder="$t('message.email')" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">{{$t('message.search')}}</el-button>
        <el-button @click="clearQueryData()">{{$t('message.clean')}}</el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        prop="orderNo"
        header-align="center"
        align="center"
        :label="$t('message.orderNo')">
      </el-table-column>
      <!--<el-table-column
        prop="company"
        header-align="center"
        align="center"
        label="所属公司">
      </el-table-column>
      <el-table-column
        prop="userName"
        header-align="center"
        align="center"
        label="客户名称">
      </el-table-column>-->
      <el-table-column
        prop="userEmail"
        header-align="center"
        align="center"
        :label="$t('message.userEmail')">
      </el-table-column>
      <el-table-column
        prop="phone"
        header-align="center"
        align="center"
        :label="$t('message.phone')">
      </el-table-column>
      <!--<el-table-column
        prop="discountPrice"
        header-align="center"
        align="center"
        label="刀片数">
      </el-table-column>
      <el-table-column
        prop="saleAmount"
        header-align="center"
        align="center"
        label="膜数">
      </el-table-column>
      <el-table-column
        prop="stock"
        header-align="center"
        align="center"
        label="机器数">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="次数">
      </el-table-column>-->
      <el-table-column
        prop="remark"
        header-align="center"
        align="center"
        :label="$t('message.remark')">
      </el-table-column>
      <el-table-column
          prop="status"
          header-align="center"
          align="center"
          :label="$t('message.status')">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="small">{{$t('message.noConfirm')}}</el-tag>
          <el-tag v-else-if="scope.row.status === 2" size="small" type="success">{{$t('message.confirmed')}}</el-tag>
          <el-tag v-else-if="scope.row.status === 3" size="small" type="danger">{{$t('message.rejected')}}</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        :label="$t('message.createTime')">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="200"
        :label="$t('message.operation')">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="queryDetailHandle(scope.row.id)">{{$t('message.read')}}</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">{{$t('message.del')}}</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
    <query-detail v-if="queryDetailVisible" ref="queryDetail" @refreshDataList="getDataList"></query-detail>
    <addGoods v-if="addVisible" ref="addGoods" @refreshDataList="getDataList"></addGoods>


    <el-dialog
      :title="dataForm.status==2 ? '确认' : '拒绝'"
      :visible.sync="confirmDialogVisible"
      width="50%">
      <div slot="title" v-if="dataForm.status==2">{{$t('message.submit')}}</div>
      <div slot="title" v-else-if="dataForm.status!=2">{{$t('message.reject')}}</div>
      <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="confirmSubmit()" label-width="100px">
        <el-input v-if="false" prop="id" v-model="dataForm.id"></el-input>
        <el-form-item :label="$t('message.comment')" prop="comment">
          <el-input type="textarea" v-model="dataForm.comment" :placeholder="$t('message.comment')" :rows="5"></el-input>
        </el-form-item>
      </el-form>

      <span slot="footer" class="dialog-footer">
        <el-button @click="confirmDialogVisible = false">{{$t('message.cancle')}}</el-button>
        <el-button type="primary" @click="confirmSubmit()">{{$t('message.submit')}}</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
  import QueryDetail from './purchase-info-query-detail'

  export default {
    data () {
      return {
        dataForm: {
          id: '',
          status: '',
          comment: '',
          orderNo: '',
          email: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        queryDetailVisible: false,
        addVisible: false,
        confirmDialogVisible: false
      }
    },
    components: {
      QueryDetail
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/sys/purchaseOrder/list'),
          method: 'POST',
          data: this.$http.adornData({
            'currPage': this.pageIndex,
            'limit': this.pageSize,
            'orderNo': this.dataForm.orderNo,
            'email': this.dataForm.email
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      // 查看详情
      queryDetailHandle (val) {
        this.queryDetailVisible = true
        this.$nextTick(() => {
          this.$refs.queryDetail.init(val, 1) // 1：app用户，2经销商
        })
      },
      // 打开确认/拒绝窗口
      showConfirmWin (val, status) {
        this.dataForm.id = val
        this.dataForm.status = status
        this.confirmDialogVisible = true
      },
      // 表单提交
      confirmSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl('/sys/purchaseOrder/confirm'),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id,
                'status': this.dataForm.status,
                'comment': this.dataForm.comment
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 300,
                  onClose: () => {
                    this.visible = false
                    this.getDataList()
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      },
      // 查看 / 修改
      addOrUpdateHandle (id, op) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id, op)
        })
      },
      // 删除
      deleteHandle (id) {
        this.$confirm(`确定进行删除操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/sys/purchaseOrder/delete'),
            method: 'post',
            data: this.$http.adornData({
              'id': id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 300,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        }).catch(() => {})
      },
      clearQueryData () {
        this.dataForm.orderNo = ''
        this.dataForm.company = ''
        this.getDataList()
      }
    }
  }
</script>
