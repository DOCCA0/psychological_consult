<template>
  <el-dialog
    :title= '修改'
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <el-form-item label="姓名" prop="name">
        <el-input v-model="dataForm.name" placeholder="姓名"></el-input>
      </el-form-item>
      <el-form-item label="性别" prop="sex" :class="{ 'is-required': !dataForm.id }">
        <el-input v-model="dataForm.sex"  placeholder="男/女"></el-input>
      </el-form-item>
      <el-form-item label="年龄" prop="age">
        <el-input v-model="dataForm.age" placeholder="年龄"></el-input>
      </el-form-item>
      <el-form-item label="级别" prop="level">
        <el-input v-model="dataForm.level" placeholder="等级"></el-input>
      </el-form-item>
      <el-form-item label="擅长领域" size="mini" prop="skill">
        <el-input v-model="dataForm.skill" placeholder="擅长领域"></el-input>
      </el-form-item>
      <el-form-item label="工作地点" prop="place">
        <el-input v-model="dataForm.place" placeholder="工作地点"></el-input>
      </el-form-item>
      <el-form-item label="工作时间" prop="workTime">
        <el-input v-model="dataForm.workTime" placeholder="工作时间"></el-input>
      </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  // import { isEmail, isMobile } from '@/utils/validate'
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          userName: '',
          name: '',
          sex: '',
          age: '',
          level: '',
          skill: '',
          place: '',
          workTime: '',
          status: 1
        }
      }
    },
    methods: {
      init (id) {
          this.dataForm.id = id || 0
          this.visible = true
          this.$nextTick(() => {
            this.$refs['dataForm'].resetFields()})
            if (this.dataForm.id) {
              this.$http({
                url: this.$http.adornUrl(`/psychology/doctor/infoByToken`),
                method: 'get',
                params: this.$http.adornParams()
              }).then(({data}) => {
                if (data && data.code === 0) {
                  console.log('data is', data.page.list[0].name)
                  this.dataForm.name = data.page.list[0].name
                  this.dataForm.sex = data.page.list[0].sex
                  this.dataForm.age = data.page.list[0].age
                  this.dataForm.level = data.page.list[0].level
                  this.dataForm.skill = data.page.list[0].skill
                  this.dataForm.place = data.page.list[0].place
                  this.dataForm.workTime = data.page.list[0].workTime
                }
              })
            }
      },
      // 表单提交
      dataFormSubmit () {
            this.$http({
              url: this.$http.adornUrl(`/psychology/doctor/update`),
              method: 'post',
              data: this.$http.adornData({
                'name': this.dataForm.name,
                'sex': this.dataForm.sex,
                'age': this.dataForm.age,
                'level': this.dataForm.level,
                'skill': this.dataForm.skill,
                'place': this.dataForm.place,
                'work_time': this.dataForm.workTime
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
        }
  }
</script>
