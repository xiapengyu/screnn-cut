<template>
  <div class="mod-user">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.phoneBrand" placeholder="品牌" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="dataForm.phoneModel" placeholder="型号" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button @click="clearQueryData()">重置</el-button>
        <el-button type="primary" @click="addOrUpdateHandle()">新增</el-button>
      </el-form-item>
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      style="width: 100%;">
      <el-table-column
        prop="id"
        header-align="center"
        align="center"
        width="80"
        label="ID">
      </el-table-column>
      <el-table-column
        prop="phoneImage"
        header-align="center"
        align="center"
        label="手机图片">
        <template slot-scope="scope">
          <div><img :src="scope.row.phoneImage"  min-width="55" height="55"></div>
        </template>
      </el-table-column>
      <el-table-column
        prop="phoneBrand"
        header-align="center"
        align="center"
        label="品牌">
      </el-table-column>
      <el-table-column
        prop="phoneModel"
        header-align="center"
        align="center"
        label="型号">
      </el-table-column>
      <el-table-column
        prop="width"
        header-align="center"
        align="center"
        label="屏幕宽度(mm)">
      </el-table-column>
      <el-table-column
        prop="height"
        header-align="center"
        align="center"
        label="屏幕高度(mm)">
      </el-table-column>
      <el-table-column
        prop="sortNum"
        header-align="center"
        align="center"
        label="排序号">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === 0" size="small" type="danger">禁用</el-tag>
          <el-tag v-else size="small">正常</el-tag>
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
          <el-button type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
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
  </div>
</template>

<script>
  import AddOrUpdate from './phone-info-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          phoneBrand: '',
          phoneModel: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        addOrUpdateVisible: false
      }
    },
    components: {
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
          url: this.$http.adornUrl('/sys/phone/phoneModelList'),
          method: 'post',
          data: this.$http.adornParams({
            'currPage': this.pageIndex,
            'limit': this.pageSize,
            'phoneBrand': this.dataForm.phoneBrand,
            'phoneModel': this.dataForm.phoneModel
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
            this.positionList = data.positionList
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
      addOrUpdateHandle (id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id)
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
            url: this.$http.adornUrl('/sys/phone/deletePhoneModelInfo'),
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
      clearQueryData () {
        this.dataForm.phoneBrand = ''
        this.dataForm.phoneModel = ''
        this.getDataList()
      }
    }
  }
</script>
