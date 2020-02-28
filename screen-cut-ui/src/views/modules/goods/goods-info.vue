<template>
  <div class="mod-user">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.name" placeholder="名称" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button @click="clearQueryData()">重置</el-button>
        <el-button type="primary" @click="addHandle()">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        prop="id"
        header-align="center"
        align="center"
        label="ID">
      </el-table-column>
      <el-table-column
        prop="name"
        header-align="center"
        align="center"
        label="名称">
      </el-table-column>
      <el-table-column
        prop="comment"
        header-align="center"
        align="center"
        label="介绍">
      </el-table-column>
      <el-table-column
        prop="price"
        header-align="center"
        align="center"
        label="价格">
      </el-table-column>
      <el-table-column
        prop="isDiscount"
        header-align="center"
        align="center"
        label="是否打折">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.isDiscount === 1" size="small">是</el-tag>
          <el-tag v-else-if="scope.row.isDiscount === 0" size="small">否</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="discountPrice"
        header-align="center"
        align="center"
        label="折后价格">
      </el-table-column>
      <el-table-column
        prop="saleAmount"
        header-align="center"
        align="center"
        label="销量">
      </el-table-column>
      <el-table-column
        prop="stock"
        header-align="center"
        align="center"
        label="库存">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 1" size="small">上架</el-tag>
          <el-tag v-else-if="scope.row.status === 0" size="small">下架</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        label="创建时间">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id, 0)">查看</el-button>
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id, 1)">修改</el-button>
          <el-button type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
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
    <addGoods v-if="addVisible" ref="addGoods" @refreshDataList="getDataList"></addGoods>
  </div>
</template>

<script>
  import AddGoods from './goods-info-add'
  import AddOrUpdate from './goods-info-add-or-update'
  
  export default {
    data () {
      return {
        dataForm: {
          name: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        addVisible: false
      }
    },
    components: {
      AddGoods,
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/sys/goods/list'),
          method: 'POST',
          data: this.$http.adornData({
            'currPage': this.pageIndex,
            'limit': this.pageSize,
            'name': this.dataForm.name,
            'typeId': this.dataForm.typeId
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
      // 查看 / 修改
      addOrUpdateHandle (id, op) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id, op)
        })
      },
      // 新增
      addHandle () {
        this.addVisible = true
        this.$nextTick(() => {
          this.$refs.addGoods.init()
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
            url: this.$http.adornUrl('/sys/goods/delete'),
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
        this.dataForm.name = ''
        this.getDataList()
      }
    }
  }
</script>
