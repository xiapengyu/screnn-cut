<template>
  <div class="mod-user">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.serialNo" placeholder="序列码" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-input v-model="dataForm.creatorName" placeholder="经销商" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-select v-model="dataForm.type" @change="choseType(dataForm.type)" placeholder="类型" style="width:100px;">
          <el-option
            v-for="item in typeList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-select v-model="dataForm.status" @change="choseStatus(dataForm.status)" placeholder="状态" style="width:100px;">
          <el-option
            v-for="item in statusList"
            :key="item.id"
            :label="item.name"
            :value="item.id">
          </el-option>
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()">查询</el-button>
        <el-button @click="clearQueryData()">重置</el-button>
        <el-button type="primary" @click="addHandle()">新增</el-button>
        <el-button type="primary" @click="importDeviceHandle()">导入设备</el-button>
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
        prop="serialNo"
        header-align="center"
        align="center"
        label="序列码">
      </el-table-column>
      <el-table-column
        prop="creatorName"
        header-align="center"
        align="center"
        label="经销商">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="类型">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.type === 1" size="small" type="danger">不限次数</el-tag>
          <el-tag v-else size="small">有限次数</el-tag>
        </template>
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
    <add-device v-if="addVisible" ref="addDevice" @refreshDataList="getDataList"></add-device>
    <import-device v-if="importDevice" ref="importDevice" @refreshDataList="getDataList"></import-device>
  </div>
</template>

<script>
  import AddOrUpdate from './device-info-add-or-update'
  import AddDevice from './device-info-add'
  import ImportDevice from './device-import'
  export default {
    data () {
      return {
        dataForm: {
          serialNo: '',
          creatorName: '',
          type: '',
          status: ''
        },
        dataList: [],
        typeList: [{'id': 1, 'name': '不限次数'}, {'id': 2, 'name': '有限次数'}],
        statusList: [{'id': 0, 'name': '禁用'}, {'id': 1, 'name': '正常'}],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        addOrUpdateVisible: false,
        addVisible: false,
        importDevice: false
      }
    },
    components: {
      AddOrUpdate,
      AddDevice,
      ImportDevice
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/sys/device/list'),
          method: 'post',
          data: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'serialNo': this.dataForm.serialNo,
            'creatorName': this.dataForm.creatorName,
            'type': this.dataForm.type,
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
      addHandle () {
        this.addVisible = true
        this.$nextTick(() => {
          this.$refs.addDevice.init()
        })
      },
      importDeviceHandle () {
        this.importDevice = true
        this.$nextTick(() => {
          this.$refs.importDevice.init()
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
            url: this.$http.adornUrl('/sys/device/delete'),
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
        this.dataForm.serialNo = ''
        this.dataForm.creatorName = ''
        this.dataForm.type = ''
        this.dataForm.status = ''
        this.getDataList()
      },
      choseType (id) {
        this.dataForm.type = id
      },
      choseStatus (id) {
        this.dataForm.status = id
      }
    }
  }
</script>
