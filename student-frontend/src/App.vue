<template>
  <!-- 顶部导航栏，登录页面不渲染 -->
  <template v-if="$route.path !== '/LoginView'">
    <!-- 横幅图片区域 -->
    <div class="banner-wrap">
      <img src="/images/logo.png" alt="学生信息管理系统" class="banner-img" />
    </div>
    <!-- 用户名和退出登录独立导航栏 -->
    <nav class="top-nav">
      <div class="user-box">
        <span class="welcome-text">当前登录用户：{{ username || '游客' }}</span>
        <el-button type="danger" size="small" @click="handleLogout">退出登录</el-button>
      </div>
    </nav>
  </template>
  <router-view />
</template>

<script setup>
import { computed } from 'vue'
import { useRouter } from 'vue-router'

const router = useRouter()

const username = computed(() => localStorage.getItem('loginUsername'))

const handleLogout = () => {
  localStorage.removeItem('loginUsername')
  localStorage.removeItem('isLogin')
  router.push('/LoginView')
}
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
.banner-wrap { width: 100%; }
.banner-img {
  width: 100%;
  height: 160px;
  object-fit: cover;
  display: block;
}
.top-nav {
  padding: 12px 30px;
  background: #ffffff;
  border-bottom: 1px solid #e5e7eb;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
.user-box {
  display: flex;
  align-items: center;
  gap: 16px;
}
.welcome-text {
  font-size: 15px;
  color: #333;
  white-space: nowrap;
}
</style>