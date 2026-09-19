<template>
  <div class="login-container">
    <el-card class="login-card">
      <template #header>
        <div class="login-title">学生信息管理系统 - 登录</div>
      </template>
      <el-form :model="loginForm" label-width="80px">
        <el-form-item label="用户名" required>
          <el-input v-model="loginForm.uname" placeholder="请输入用户名" autocomplete="off" />
        </el-form-item>
        <el-form-item label="密码" required>
          <el-input v-model="loginForm.upwd" type="password" placeholder="请输入密码" autocomplete="off" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" class="login-btn" @click="handleLogin">登录</el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import request from '@/utils/request';
import { ElMessage } from 'element-plus';

const loginForm = ref({ uname: '', upwd: '' });
const router = useRouter();

const handleLogin = async () => {
  try {
    if (!loginForm.value.uname || !loginForm.value.upwd) {
      ElMessage.warning('请输入用户名和密码');
      return;
    }
    const res = await request.post('/persons/login', loginForm.value, {
      responseType: 'text'
    });
    if (res.data === '登录成功') {
      localStorage.setItem('isLogin', 'true');
      ElMessage.success('登录成功');
      window.location.href = '/student-manager';
    } else {
      ElMessage.error(res.data);
    }
  } catch (err) {
    ElMessage.error('登录请求失败，请检查后端服务是否启动');
    console.error('登录接口异常：', err);
  }
};
</script>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  background-color: #f5f7fa;
}
.login-card { width: 400px; box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1); }
.login-title { text-align: center; font-size: 18px; font-weight: bold; }
.login-btn { width: 100%; }
</style>