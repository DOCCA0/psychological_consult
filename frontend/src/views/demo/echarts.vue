<template>
  <div class="mod-demo-echarts">
    <el-alert
      title="提示："
      type="warning"
      :closable="false">
    </el-alert>
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card>
          <div id="J_chartPieBox" class="chart-box"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
  import echarts from 'echarts'
  export default {
    data () {
      return {
        chartPie: null,
        answer0Cnt: 0,
        answer1Cnt: 0,
        answer2Cnt: 0,
        answer3Cnt: 0
      }
    },
    activated () {
      // 由于给echart添加了resize事件, 在组件激活时需要重新resize绘画一次, 否则出现空白bug
      if (this.chartPie) {
        this.chartPie.resize()
      }
    },
    created () {
      this.getAnswerCount()
    },
    methods: {
      getAnswerCount () {
        this.$http({
          url: this.$http.adornUrl('/psychology/clientquestion/countByAnswer/0'),
          method: 'get'
        }).then((data) => {
          if (data && data.data.code === 0) {
            this.answer0Cnt = data.data.cnt
            this.$http({
              url: this.$http.adornUrl('/psychology/clientquestion/countByAnswer/1'),
              method: 'get'
            }).then((data) => {
              if (data && data.data.code === 0) {
                this.answer1Cnt = data.data.cnt
                this.$http({
                  url: this.$http.adornUrl('/psychology/clientquestion/countByAnswer/2'),
                  method: 'get'
                }).then((data) => {
                  if (data && data.data.code === 0) {
                    this.answer2Cnt = data.data.cnt
                    this.$http({
                      url: this.$http.adornUrl('/psychology/clientquestion/countByAnswer/3'),
                      method: 'get'
                    }).then((data) => {
                      if (data && data.data.code === 0) {
                        this.answer3Cnt = data.data.cnt
                        this.initChartPie()
                      }
                    })
                  }
                })
              }
            })
          }
        })
      },
      // 饼状图
      initChartPie () {
        var option = {
          backgroundColor: '#2c343c',
          title: {
            text: '患者问卷数据分析',
            left: 'center',
            top: 20,
            textStyle: {
              color: '#ccc'
            }
          },
          tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
          },
          visualMap: {
            show: false,
            min: 80,
            max: 600,
            inRange: {
              colorLightness: [0, 1]
            }
          },
          series: [
            {
              name: '类型',
              type: 'pie',
              radius: '55%',
              center: ['50%', '50%'],
              data: [
                { value: this.answer0Cnt, name: '非常消极' },
                { value: this.answer1Cnt, name: '比较消极' },
                { value: this.answer2Cnt, name: '比较积极' },
                { value: this.answer3Cnt, name: '非常积极' }
              ].sort(function (a, b) { return a.value - b.value }),
              roseType: 'radius',
              label: {
                normal: {
                  textStyle: {
                    color: 'rgba(255, 255, 255, 0.3)'
                  }
                }
              },
              labelLine: {
                normal: {
                  lineStyle: {
                    color: 'rgba(255, 255, 255, 0.3)'
                  },
                  smooth: 0.2,
                  length: 10,
                  length2: 20
                }
              },
              itemStyle: {
                normal: {
                  color: '#c23531',
                  shadowBlur: 200,
                  shadowColor: 'rgba(0, 0, 0, 0.5)'
                }
              },
              animationType: 'scale',
              animationEasing: 'elasticOut',
              animationDelay: function (idx) {
                return Math.random() * 200
              }
            }
          ]
        }
        this.chartPie = echarts.init(document.getElementById('J_chartPieBox'))
        this.chartPie.setOption(option)
        window.addEventListener('resize', () => {
          this.chartPie.resize()
        })
      }
    }
  }
</script>


<style lang="scss">
  .mod-demo-echarts {
    > .el-alert {
      margin-bottom: 10px;
    }
    > .el-row {
      margin-top: -10px;
      margin-bottom: -10px;
      .el-col {
        padding-top: 10px;
        padding-bottom: 10px;
      }
    }
    .chart-box {
      min-height: 400px;
    }
  }
</style>
