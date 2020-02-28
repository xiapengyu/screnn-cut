<template>
  <el-dialog
    title="推送"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="150px">
      <el-form-item label="标题" prop="title">
        <el-input v-model="dataForm.title" placeholder="标题" disabled></el-input>
      </el-form-item>
      <el-form-item label="内容" prop="content" >
        <el-input type='textarea' rows="5" placeholder="内容" v-model="dataForm.content" disabled></el-input>
      </el-form-item>
      <el-form-item label="推送对象" prop="selectAccount">
          <el-select v-model="dataForm.selectAccount" value-key="id" @change="handleClick(dataForm.selectAccount)">
            <el-option v-for="item in dataForm.accountList" :key="item.id" :label="item.email" :value="item"></el-option>
          </el-select>
      </el-form-item>
      <el-form-item label="已选中对象" prop="content" v-show="this.tags.length > 0">
        <el-tag v-for="tag in tags" closable :key="tag.name" :type="tag.type" @close="handleClose(tag)">{{tag.name}}</el-tag>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">关闭</el-button>
      <el-button type="primary" @click="push()">推送</el-button>
      <el-button type="primary" @click="pushAll()">全量推送</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dialogVisible: false,
        tags: [],
        selectAll: 0,
        dataForm: {
          id: 0,
          title: '',
          content: '',
          selectAccount: '',
          accountList: [],
          accountIdList: []
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        if (this.$refs['dataForm'] !== undefined) {
          this.$refs['dataForm'].resetFields()
        }
        this.$http({
          url: this.$http.adornUrl(`/sys/account/queryTotalAccount`),
          method: 'post',
          data: this.$http.adornData()
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataForm.accountList = data.accountList
          } else {
            this.$message.error(data.msg)
          }
        })
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/push/info`),
            method: 'post',
            data: this.$http.adornData({
              'id': this.dataForm.id
            })
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.id = data.pushMsg.id
              this.dataForm.title = data.pushMsg.title
              this.dataForm.content = data.pushMsg.content
            } else {
              this.$message.error(data.msg)
            }
          })
        }
      },
      // 表单提交
      push () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            if (this.selectAll === 0 && this.tags.length === 0) {
              this.$message.error('请选择推送用户')
            } else {
              this.$http({
                url: this.$http.adornUrl(`/sys/push/pushMsg`),
                method: 'post',
                data: this.$http.adornData({
                  'id': this.dataForm.id,
                  'accoutList': this.tags,
                  'selectAll': this.selectAll
                })
              }).then(({data}) => {
                if (data && data.code === 0) {
                  this.$message({
                    message: '操作成功',
                    type: 'success',
                    duration: 500,
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
          }
        })
      },
      // 表单提交
      pushAll () {
        this.$http({
          url: this.$http.adornUrl(`/sys/push/pushAll`),
          method: 'post',
          data: this.$http.adornData({
            'id': this.dataForm.id
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 500,
              onClose: () => {
                this.visible = false
                this.$emit('refreshDataList')
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      },
      handleClick (account) {
        if (account.id === 0) {
          this.tags = []
          this.selectAll = 1
        } else {
          this.tags.push({id: account.id, name: account.email})
          this.selectAll = 0
        }
      },
      handleClose (tag) {
        if (this.tags.length > 0) {
          this.tags.pop(tag)
        }
      }
    }
  }
</script>

<style>
  .el-tag {
    margin-left: 10px;
  }
</style>
