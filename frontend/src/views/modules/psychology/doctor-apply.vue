<template>
  <el-dialog
    :title="!dataForm.id ? '填写申请' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
      <!--<el-form-item label="档案ID" prop="archives_id">-->
        <!--<el-input v-model="dataForm.userName" placeholder="档案ID"></el-input>-->
      <!--</el-form-item>-->
      <el-form-item label="患者ID" prop="password" :class="{ 'is-required': !dataForm.id }">
        <el-input v-model="dataForm.password" type="password" placeholder="患者ID"></el-input>
      </el-form-item>
      <!--<el-form-item label="医生ID" prop="comfirmPassword" :class="{ 'is-required': !dataForm.id }">-->
        <!--<el-input v-model="dataForm.comfirmPassword" type="password" placeholder="医生ID"></el-input>-->
      <!--</el-form-item>-->
      <el-form-item label="患者描述" prop="archives_id">
        <el-input v-model="dataForm.userName" placeholder="患者描述"></el-input>
      </el-form-item>
      <!--<el-form-item label="医生建议" prop="mobile">-->
        <!--<el-input v-model="dataForm.mobile" placeholder="医生建议"></el-input>-->
      <!--</el-form-item>-->
      <!--<el-form-item label="答复时间" size="mini" prop="roleIdList">-->
        <!--<el-radio-group v-model="dataForm.roleIdList">-->
          <!--<el-radio v-for="role in roleList" :key="role.roleId" :label="role.roleId">{{ role.roleName }}</el-radio>-->
        <!--</el-radio-group>-->
        <!--<el-input v-model="dataForm.mobile" placeholder="答复时间"></el-input>-->
      <!--</el-form-item>-->
      <el-form-item label="状态" size="mini" prop="status">
        <el-radio-group v-model="dataForm.status">
          <el-radio :label="0">禁用</el-radio>
          <el-radio :label="1">正常</el-radio>
        </el-radio-group>
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
      var validatePassword = (rule, value, callback) => {
        if (!this.dataForm.id && !/\S/.test(value)) {
          callback(new Error('ID不能为空'))
        } else {
          callback()
        }
      }
      var validateComfirmPassword = (rule, value, callback) => {
        if (!this.dataForm.id && !/\S/.test(value)) {
          callback(new Error('ID不能为空'))
        } else if (this.dataForm.password !== value) {
          callback(new Error('确认密码与密码输入不一致'))
        } else {
          callback()
        }
      }
      var validateEmail = (rule, value, callback) => {
        // if (!isEmail(value)) {
        //   callback(new Error('邮箱格式错误'))
        // }
        if (!this.dataForm.id && !/\S/.test(value)) {
          callback(new Error('密码不能为空'))
        } else {
          callback()
        }
      }
      var validateMobile = (rule, value, callback) => {
        // if (!isMobile(value)) {
        //   callback(new Error('手机号格式错误'))
        // } else {
        //   callback()
        // }
        if (!this.dataForm.id && !/\S/.test(value)) {
          callback(new Error('密码不能为空'))
        } else {
          callback()
        }
      }
      return {
        visible: false,
        roleList: [],
        dataForm: {
          id: 0,
          userName: '',
          password: '',
          comfirmPassword: '',
          salt: '',
          email: '',
          mobile: '',
          roleIdList: [],
          status: 1
        },
        dataRule: {
          // userName: [
          //   { required: true, message: '用户名不能为空', trigger: 'blur' }
          // ],
          password: [
            { validator: validatePassword, trigger: 'blur' }
          ],
          comfirmPassword: [
            { validator: validateComfirmPassword, trigger: 'blur' }
          ],
          email: [
            { required: true, message: '描述不能为空', trigger: 'blur' },
            { validator: validateEmail, trigger: 'blur' }
          ],
          mobile: [
            { required: true, message: '手机号不能为空', trigger: 'blur' },
            { validator: validateMobile, trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.$http({
          url: this.$http.adornUrl('/sys/role/select'),
          method: 'get',
          params: this.$http.adornParams()
        }).then(({data}) => {
          this.roleList = data && data.code === 0 ? data.list : []
        }).then(() => {
          this.visible = true
          this.$nextTick(() => {
            this.$refs['dataForm'].resetFields()
          })
        }).then(() => {
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/sys/user/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.userName = data.user.username
                this.dataForm.salt = data.user.salt
                this.dataForm.email = data.user.email
                this.dataForm.mobile = data.user.mobile
                this.dataForm.roleIdList = data.user.roleIdList
                this.dataForm.status = data.user.status
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/sys/user/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'userId': this.dataForm.id || undefined,
                'username': this.dataForm.userName,
                'password': this.dataForm.password,
                'salt': this.dataForm.salt,
                'email': this.dataForm.email,
                'mobile': this.dataForm.mobile,
                'status': this.dataForm.status,
                'roleIdList': this.dataForm.roleIdList
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
