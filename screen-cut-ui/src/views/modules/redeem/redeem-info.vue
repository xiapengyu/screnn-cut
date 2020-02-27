<template>
  <div class="mod-user">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.redeemNo" placeholder="兑换编码" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-select v-model="dataForm.status" @change="choseStatus(dataForm.status)" placeholder="状态" style="width:100px;">
          <el-option
            v-for="item in statusList"
            :key="item.id"
            :label="item.label"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button @click="clearQueryData()">重置</el-button>
        <el-button type="primary" @click="addHandle()">新增</el-button>
        <el-button type="primary" @click="batchEnable()" :disabled="dataListSelections.length <= 0">批量启用</el-button>
        <el-button type="danger" @click="batchDisable()" :disabled="dataListSelections.length <= 0">批量禁用</el-button>
        <el-button type="danger"  @click="batchDelete()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="id"
        header-align="center"
        align="center"
        width="80"
        label="ID">
      </el-table-column>
      <el-table-column
        prop="batchNo"
        header-align="center"
        align="center"
        width="60"
        label="批次">
      </el-table-column>
      <el-table-column
        prop="redeemNo"
        header-align="center"
        align="center"
        label="兑换编码">
      </el-table-column>
      <el-table-column
        prop="url"
        header-align="center"
        align="center"
        label="二维码">
        <!-- <template slot-scope="scope">
          <div><img :src="scope.row.url"  min-width="55" height="55"></div>
        </template> -->
        <template slot-scope="scope">
        <el-popover placement="right" title="" trigger="hover">
          <img :src="scope.row.url" style="max-height: 150px;max-width: 150px" />
          <img slot="reference" :src="scope.row.url" :alt="scope.row.url" style="max-height: 55px;max-width: 55px">
        </el-popover>
      </template>
      </el-table-column>
      <el-table-column
        prop="times"
        header-align="center"
        align="center"
        label="切割次数">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0" size="small" type="danger">禁用</el-tag>
          <el-tag v-else-if="scope.row.status === 1" size="small" >启用</el-tag>
          <el-tag v-else size="small">已兑换</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        prop="createTime"
        header-align="center"
        align="center"
        width="180"
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
          <el-button v-show="scope.row.status < 2" type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
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
    <add-redeem  v-if="addRedeemVisible" ref="addRedeem" @refreshDataList="getDataList"></add-redeem>
  </div>
</template>

<script>
  import AddOrUpdate from './redeem-info-add-or-update'
  import AddRedeem from './redeem-info-add'
  export default {
    data () {
      return {
        dataForm: {
          redeemNo: '',
          status: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        addOrUpdateVisible: false,
        addRedeemVisible: false,
        statusList: [{'id': 0, 'label': '禁用'}, {'id': 1, 'label': '正常'}, {'id': 2, 'label': '已兑换'}],
        dataListSelections: []
      }
    },
    components: {
      AddOrUpdate,
      AddRedeem
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/sys/redeemCode/list'),
          method: 'post',
          data: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'redeemNo': this.dataForm.redeemNo,
            'status': this.dataForm.status
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
      // 新增 / 修改
      addOrUpdateHandle (id, op) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id, op)
        })
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      addHandle () {
        this.addRedeemVisible = true
        this.$nextTick(() => {
          this.$refs.addRedeem.init()
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
            url: this.$http.adornUrl('/sys/redeemCode/delete'),
            method: 'post',
            data: this.$http.adornData({
              'id': id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 500,
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
      choseStatus (status) {
        this.dataForm.status = status
      },
      clearQueryData () {
        this.dataForm.redeemNo = ''
        this.dataForm.status = ''
        this.getDataList()
      },
      batchEnable () {
        console.log('')
        var idList = this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定进行批量启用操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/sys/redeemCode/batchEnable'),
            method: 'post',
            data: this.$http.adornData({
              'idList': idList
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 500,
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
      batchDelete () {
        var idList = this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定进行批量删除操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/sys/redeemCode/batchDelete'),
            method: 'post',
            data: this.$http.adornData({
              'idList': idList
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 500,
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
      batchDisable () {
        var idList = this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定进行批量禁用操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/sys/redeemCode/batchDisable'),
            method: 'post',
            data: this.$http.adornData({
              'idList': idList
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        }).catch(() => {})
      }
    }
  }
</script>
