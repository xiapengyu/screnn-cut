
<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible"
    append-to-body>
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="字典标签" prop="dictLabel" :class="{ 'is-required': !dataForm.dictLabel }">
        <el-input v-model="dataForm.dictLabel" type="text" placeholder="字典标签"></el-input>
      </el-form-item>
      <el-form-item label="字典键值" prop="dictValue" :class="{ 'is-required': !dataForm.dictValue }">
        <el-input v-model="dataForm.dictValue" type="text" placeholder="字典键值"></el-input>
      </el-form-item>
      <el-form-item label="字典类型" prop="dictType" :class="{ 'is-required': !dataForm.dictType }">
        <el-input v-model="dataForm.dictType" type="text" placeholder="字典类型" readonly="true"></el-input>
      </el-form-item>
       <el-form-item label="字典排序" prop="dictSort" :class="{ 'is-required': !dataForm.dictSort }">
        <el-input v-model="dataForm.dictSort" type="text" placeholder="字典排序"></el-input>
      </el-form-item>
      <el-form-item label="备注" prop="remark" >
        <el-input type="textarea" v-model="dataForm.remark"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        roleList: [],
        dataForm: {
          dictLabel: '',
          dictValue: '',
          dictType: '',
          dictSort: 0,
          remark: ''
        },
        dataRule: {
          dictLabel: [
            { required: true, message: '字典标签不能为空', trigger: 'blur' }
          ],
          dictValue: [
            { required: true, message: '字典键值不能为空', trigger: 'blur' }
          ],
          dictType: [
            { required: true, message: '字典类型不能为空', trigger: 'blur' }
          ],
          dictSort: [
            { required: true, message: '字典排序不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (dictType, id) {
        this.dataForm.dictType = dictType
        this.dataForm.id = id || 0
        this.visible = true
        if (this.dataForm.id) {
          this.$http({
            url: this.$http.adornUrl(`/sys/dictData/info/${this.dataForm.id}`),
            method: 'get',
            params: this.$http.adornParams()
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.dataForm.dictLabel = data.dictData.dictLabel
              this.dataForm.dictValue = data.dictData.dictValue
              this.dataForm.dictType = data.dictData.dictType
              this.dataForm.dictSort = data.dictData.dictSort
              this.dataForm.remark = data.dictData.remark
            }
          })
        }
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/dictData/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'dictCode': this.dataForm.id || undefined,
                'dictLabel': this.dataForm.dictLabel,
                'dictValue': this.dataForm.dictValue,
                'dictType': this.dataForm.dictType,
                'dictSort': this.dataForm.dictSort,
                'remark': this.dataForm.remark
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
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
      }
    }
  }
</script>
