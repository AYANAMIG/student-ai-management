<template>
  <div style="padding: 20px;">
    <el-page-header content="成绩分布统计" @back="$router.back()" />
    <div style="display: flex; gap: 20px; margin-top: 20px;">
      <div ref="chartRef1" style="width: 600px;height:400px;"></div>
      <div ref="chartRef2" style="width: 600px;height:400px;"></div>
    </div>
  </div>
</template>

<script setup>
import * as echarts from 'echarts'
import { onMounted, ref } from "vue";
import scoreApi from '@/api/score.js';

const chartRef1 = ref()
const chartRef2 = ref()

onMounted(() => {
  const myChart1 = echarts.init(chartRef1.value)
  const myChart2 = echarts.init(chartRef2.value)

  scoreApi.selectScoreCount().then(result => {
    const list = result.data

    // 饼图
    const pieData = []
    for (let i = 0; i < list.length; i++) {
      pieData.push({
        name: list[i].name,
        value: list[i].total_score,
        avg_score: list[i].avg_score
      })
    }
    const option1 = {
      title: { text: '各班总成绩和平均成绩', left: 'center' },
      tooltip: {
        trigger: 'item',
        formatter: function (params) {
          return `${params.name}<br/>总成绩：${params.value}<br/>平均成绩：${params.data.avg_score}`
        }
      },
      legend: { orient: 'vertical', left: 'left' },
      series: [{
        name: '总成绩',
        type: 'pie',
        radius: '50%',
        data: pieData,
        emphasis: {
          itemStyle: {
            shadowBlur: 10,
            shadowOffsetX: 0,
            shadowColor: 'rgba(0, 0, 0, 0.5)'
          }
        }
      }]
    };
    myChart1.setOption(option1)

    // 柱状图
    const xArray = []
    const totalScoreArr = []
    const avgScoreArr = []
    for (let i = 0; i < list.length; i++) {
      xArray.push(list[i].name)
      totalScoreArr.push(list[i].total_score)
      avgScoreArr.push(list[i].avg_score)
    }
    const option2 = {
      title: { text: '各班总成绩与平均成绩柱状图', left: 'center' },
      tooltip: { trigger: 'axis' },
      legend: { data: ['总成绩', '平均成绩'], top: 30 },
      xAxis: { type: 'category', data: xArray },
      yAxis: { type: 'value' },
      series: [
        { name: '总成绩', data: totalScoreArr, type: 'bar', itemStyle: { color: '#409EFF' } },
        { name: '平均成绩', data: avgScoreArr, type: 'bar', itemStyle: { color: '#E6A23C' } }
      ]
    };
    myChart2.setOption(option2)
  })

  window.addEventListener('resize', () => {
    myChart1.resize()
    myChart2.resize()
  })
})
</script>

<style scoped>
</style>