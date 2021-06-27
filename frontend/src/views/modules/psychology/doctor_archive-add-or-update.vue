<template>
<!--  医生修改回复弹出框-->
  <el-dialog
    :title="修改"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="我的回复" >
        <el-input v-model="dataForm.doctorDescription"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>

</template>
<template>
  <!--client修改回复弹出框-->
  <el-dialog
    :title="修改"
    :close-on-click-modal="false"
    :visible.sync="client_visible">
    <el-form :model="dataForm" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="我的回复" >
        <el-input v-model="dataForm.clientDescription"></el-input>
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
        client_visible: true,
        dataForm: {}
      }
    },
    methods: {
      init (type, id) {
        console.log('type是 ', type)
        this.dataForm.id = id || 0
        this.$http({
          url: this.$http.adornUrl('/psychology/archive/infoByArchivesId/' + id),
          method: 'get',
          params: this.$http.adornParams()
        }).then(({data}) => {
          if (data && data.code === 0) {
            console.log(data)
            this.dataForm = data.archive
          } else {
            this.dataForm = []
          }
        }).then(() => {
          if (type === 0) {
            this.visible = true
          } else if (type === 1) {
            this.dataForm.status = 1
            this.dataFormSubmit()
          } else if (type === -1) {
            // client修改回复弹出框
            this.client_visible = true
          } else {
            this.dataForm.status = -1
            this.dataFormSubmit()
          }
          this.$nextTick(() => {
            this.$refs['dataForm'].resetFields()
          })
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$http({
          url: this.$http.adornUrl(`/psychology/archive/update/`),
          method: 'post',
          data: this.$http.adornData(
            this.dataForm
          )
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
                this.visible = false
                this.client_visible = false
                this.$emit('refreshDataList')
              }
            })
          } else {
            this.$message.error(data.msg)
          }
        })
      }
    }
  }
</script>
