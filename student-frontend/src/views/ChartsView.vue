<template>
  <div style="padding: 20px;">
    <el-page-header content="课程统计" @back="$router.back()" />
    <div style="display: flex; gap: 20px; margin-top: 20px;">
      <div ref="chartRef1" style="width: 600px;height:400px;"></div>
      <div ref="chartRef2" style="width: 600px;height:400px;"></div>
    </div>
  </div>
</template>

<script setup>
import * as echarts from 'echarts'
import { onMounted, ref } from "vue";
import chartApi from "@/api/chart.js";

const chartRef1 = ref()
const chartRef2 = ref()

onMounted(() => {
  const myChart1 = echarts.init(chartRef1.value)
  const myChart2 = echarts.init(chartRef2.value)

  chartApi.selectCoachCourseCount().then(result => {
    const list = result.data

    // 饼图
    const pieData = []
    for (let i = 0; i < list.length; i++) {
      pieData.push({
        name: list[i].name,
        value: list[i].value
      })
    }
    const option1 = {
      title: { text: '专业学生数量', left: 'center' },
      tooltip: { trigger: 'item' },
      legend: { orient: 'vertical', left: 'left' },
      series: [{
        name: '专业学生数量',
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
    const yArray = []
    for (let i = 0; i < list.length; i++) {
      xArray.push(list[i].name)
      yArray.push(list[i].value)
    }
    const option2 = {
      title: { text: '专业学生数量柱状图', left: 'center' },
      tooltip: { trigger: 'axis' },
      xAxis: { type: 'category', data: xArray },
      yAxis: { type: 'value' },
      series: [{
        data: yArray,
        type: 'bar',
        itemStyle: { color: '#409EFF' },
        barWidth: '40%'
      }]
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