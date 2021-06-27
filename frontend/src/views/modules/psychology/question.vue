<template>
  <div class="question-list">
<!--    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">-->
<!--      <el-form-item>-->
<!--        <el-input v-model="dataForm.userName" placeholder="用户名" clearable></el-input>-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button @click="getDataList()">查询</el-button>-->
<!--        <el-button v-if="isAuth('sys:user:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>-->
<!--        <el-button v-if="isAuth('sys:user:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->
<!--    表格-->
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      style="width: 100%;">

      <el-table-column
        prop="questionId"
        header-align="center"
        align="center"
        width="80"
        label="题号">
      </el-table-column>
      <el-table-column
        prop="context"
        header-align="center"
        align="center"
        label="问题">
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="500"
        label="你的答案">
        <template slot-scope="scope">
            <el-radio-group v-model="scope.row.id" @change="getValue(scope.$index,scope.row.id)">
              <el-radio :label="0"  >非常符合</el-radio>
              <el-radio :label="1"  >比较符合</el-radio>
              <el-radio :label="2"  >不太符合</el-radio>
              <el-radio :label="3"  >完全不是</el-radio>
            </el-radio-group>
        </template>
      </el-table-column>
    </el-table>
    <el-button type="primary" style="float:right" @click="submit">提交<i class="el-icon-check el-icon--right"></i></el-button>
  </div>
</template>

<script>
  // import AddOrUpdate from './question-add-or-update'
  export default {
    data () {
      return {
        selectId: '',
        dataList: [],
        pageIndex: 1,
        pageSize: 20,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false
      }
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      refresh () {
        this.$emit('refreshDataList')
      },
      // 提交确认
      submit () {
        this.$confirm('确定要提交吗?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let form = []
          for (let i = 1; i <= 20; i++) {
            let myObj = {
              'questionId': i,
              'hisAnswer': sessionStorage.getItem(i - 1)
            }
            form.push(myObj)
          }
          console.log(form)
          this.$http({
            url: this.$http.adornUrl(`/psychology/clientquestion/saves`),
            method: 'post',
            data: form
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '提交成功',
                type: 'success'
              })
              this.form = []
              window.location.href = 'index.html'
              console.log(this.form)
            } else {
              this.$message.error('还有题目没做哦')
            }
          })
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '取消提交'
          })
        })
      },
      getValue (a, b) {
        console.log(a, b)
        sessionStorage.setItem(a, b)
        console.log(sessionStorage.getItem(a))
      },
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/psychology/question/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize
            // 'username': this.dataForm.userName
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            console.log(data)
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      }
    }
  }
</script>
