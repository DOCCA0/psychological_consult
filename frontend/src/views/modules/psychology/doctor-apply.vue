<template>
  <el-dialog
    :title= '填写预约'
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="患者描述" prop="clientDescription">
        <el-input v-model="dataForm.clientDescription" placeholder="患者描述"></el-input>
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
        dataForm: {
          status: 0,
          doctorId: 3,
          clientDescription: ''
        }
      }
    },
    methods: {
      init (doctorId) {
        this.visible = true
        this.dataForm.doctorId = doctorId
      },
      // 表单提交
      dataFormSubmit () {
        this.$http({
          url: this.$http.adornUrl('/psychology/archive/save'),
          method: 'post',
          data: this.$http.adornData({
            'doctorId': this.dataForm.doctorId,
            'clientDescription': this.dataForm.clientDescription,
            'status': 0
          })
        }).then((data) => {
          console.log('申请返回的数据', data)
          console.log('data.data.code', data.data.code)
          if (data && data.data.code === 0) {
            this.visible = false
            this.$message({
              message: '操作成功',
              type: 'success',
              duration: 1500,
              onClose: () => {
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
