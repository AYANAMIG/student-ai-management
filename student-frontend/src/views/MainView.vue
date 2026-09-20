<template>
  <el-container class="main-container">
    <el-aside width="220px" class="aside-menu">
      <el-menu
          router
          :default-active="$route.path"
          background-color="#304156"
          text-color="#fff"
          active-text-color="#42b983"
      >
        <el-menu-item index="/main/student">
          <el-icon><User /></el-icon>
          <span>学生信息管理</span>
        </el-menu-item>
        <el-menu-item index="/main/charts">
          <el-icon><PieChart /></el-icon>
          <span>课程统计</span>
        </el-menu-item>
        <el-menu-item index="/main/score">
          <el-icon><Histogram /></el-icon>
          <span>成绩统计</span>
        </el-menu-item>
        <el-menu-item index="/main/log">
          <el-icon><Document /></el-icon>
          <span>日志统计</span>
        </el-menu-item>
      </el-menu>
    </el-aside>

    <el-main class="main-content">
      <router-view />
    </el-main>
  </el-container>
</template>

<script setup>
import { User, PieChart, Histogram, Document } from '@element-plus/icons-vue'
</script>

<style scoped>
.main-container {
  display: flex;
  height: 100vh;
}
.aside-menu {
  background-color: #304156;
}
.main-content {
  background-color: #f5f7fa;
  padding: 16px;
  overflow: auto;
}
</style>