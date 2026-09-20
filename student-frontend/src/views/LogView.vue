<template>
  <div style="padding: 20px;">
    <h2>日志统计</h2>
    <el-table :data="logs" border>
      <el-table-column prop="id" label="ID" width="80" />
      <el-table-column prop="operator" label="操作员" />
      <el-table-column prop="type" label="操作类型" />
      <el-table-column prop="time" label="操作时间" />
    </el-table>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import request from '@/utils/request'

const logs = ref([])

onMounted(async () => {
  try {
    const res = await request.get('/logs')
    logs.value = res.data
  } catch (e) {
    console.error('获取日志失败：', e)
  }
})
</script>

<style scoped>
</style>