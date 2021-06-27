<template>
  <div class="mod-user">
<!--    表格-->
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">

      <el-table-column
        prop="archivesId"
        header-align="center"
        align="center"
        width="50"
        label="申请Id">
      </el-table-column>
      <el-table-column
        prop="clientId"
        header-align="center"
        align="center"
        width="60"
        label="申请者编号">
      </el-table-column>
      <el-table-column
        prop="clientRate"
        header-align="center"
        align="center"
        width="250"
        label="申请者评级">
        <template slot-scope="scope" >
        <el-rate
          v-model="scoreMap[scope.$index]"
          :icon-classes="iconClasses"
          disabled
          show-score
          :colors="{5:'#00ffcc', 3:'#ffe121', 2:'#ff2121'}"
          text-color="#008080">
        </el-rate>
        </template>
      </el-table-column>
      <el-table-column
        prop="clientDescription"
        header-align="center"
        align="center"
        label="申请者描述">
      </el-table-column>
      <el-table-column
        prop="doctorDescription"
        header-align="center"
        align="center"
        label="我的回复">
      </el-table-column>
      <el-table-column
        prop="applyTime"
        header-align="center"
        align="center"
        label="申请时间">
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === -1"  type="danger">申请失败</el-tag>
          <el-tag v-if="scope.row.status === 0" >申请中</el-tag>
          <el-tag v-if="scope.row.status === 1" type="success">申请成功</el-tag>
        </template>
      </el-table-column>
      <el-table-column
        fixed="right"
        header-align="center"
        align="center"
        width="250"
        label="操作">
        <template slot-scope="scope">
          <el-button type="text" size="small" @click="addOrUpdateHandle(0, scope.row.archivesId)">修改回复</el-button>
          <el-button type="success" size="small" @click="addOrUpdateHandle(1, scope.row.archivesId)">同意</el-button>
          <el-button type="danger" size="small" @click="addOrUpdateHandle(2, scope.row.archivesId)">终止</el-button>
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
  import AddOrUpdate from './doctor_archive-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          userName: ''
        },
        value: 0,
        scoreMap: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
        dataList: [],
        doctorId: 0,
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false,
        avgs: []
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取平均分
      getAvgs () {
        let ids = []
        console.log('datalist is ', this.dataList)
        let list = this.dataList
        for (let i = 0; i < list.length; i++) {
          ids.push(list[i].clientId)
        }
        console.log(ids)
        this.$http({
          url: this.$http.adornUrl('/psychology/clientquestion/avgs'),
          method: 'post',
          data: ids
        }).then(({data}) => {
          this.scoreMap = []
          const objectToPairs = obj => Object.keys(obj).map(k => [k, obj[k]]);
          let avgs = data.avgs
            console.log('data is', avgs)
          for (let i = 0;i < avgs.length; i++){
            let pair = objectToPairs(avgs[i])
            console.log('avg is', pair[0][0], pair[0][1])
            sessionStorage.setItem(pair[0][0], pair[0][1])
            this.scoreMap.push(pair[0][1])


          }
            console.log('scoremap ', this.scoreMap)
          console.log('scoremap[0]', this.scoreMap[0])
        }
        )
      },
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/psychology/archive/infoByToken'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize
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
          this.getAvgs()
        })
      },
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
      // 新增 / 修改
      addOrUpdateHandle (type, id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(type, id)
        })
      }
    }
  }
</script>
