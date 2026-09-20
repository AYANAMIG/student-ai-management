<template>
  <!-- 用内联样式绑定背景图，避开 css-loader 路径解析 -->
  <div class="login-container" :style="{ backgroundImage: 'url(/images/background.png)' }">
    <el-card class="login-card">
      <template #header>
        <div class="login-title">学生信息管理系统 - 登录</div>
      </template>

      <el-form :model="loginForm" label-width="80px">
        <el-form-item label="用户名" required>
          <el-input
              v-model="loginForm.uname"
              placeholder="请输入用户名"
              autocomplete="off"
          />
        </el-form-item>
        <el-form-item label="密码" required>
          <el-input
              v-model="loginForm.upwd"
              type="password"
              placeholder="请输入密码"
              autocomplete="off"
          />
        </el-form-item>
        <el-form-item label="验证码" required>
          <div class="captcha-row">
            <el-input
                v-model="loginForm.code"
                placeholder="请输入验证码"
                autocomplete="off"
                maxlength="4"
            />
            <canvas
                ref="captchaCanvas"
                class="captcha-canvas"
                width="100"
                height="40"
                title="看不清？点击刷新"
                @click="refreshCaptcha"
            />
          </div>
        </el-form-item>
        <el-form-item>
          <el-button
              type="primary"
              class="login-btn"
              @click="handleLogin"
          >
            登录
          </el-button>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import request from '@/utils/request';
import { ElMessage } from 'element-plus';

// 登录表单数据
const loginForm = ref({
  uname: '',
  upwd: '',
  code: ''
});

// 验证码
const captchaCanvas = ref(null);
const captchaCode = ref('');

const router = useRouter();

// 生成 4 位随机验证码
const generateCode = () => {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  let code = '';
  for (let i = 0; i < 4; i++) {
    code += chars[Math.floor(Math.random() * chars.length)];
  }
  return code;
};

// 绘制验证码
const drawCaptcha = (code) => {
  const canvas = captchaCanvas.value;
  if (!canvas) return;
  const ctx = canvas.getContext('2d');
  const w = canvas.width;
  const h = canvas.height;
  ctx.clearRect(0, 0, w, h);
  ctx.fillStyle = '#f2f6ff';
  ctx.fillRect(0, 0, w, h);
  // 干扰线
  for (let i = 0; i < 5; i++) {
    ctx.strokeStyle = `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255}, 0.5)`;
    ctx.beginPath();
    ctx.moveTo(Math.random() * w, Math.random() * h);
    ctx.lineTo(Math.random() * w, Math.random() * h);
    ctx.stroke();
  }
  // 干扰点
  for (let i = 0; i < 30; i++) {
    ctx.fillStyle = `rgba(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255}, 0.6)`;
    ctx.beginPath();
    ctx.arc(Math.random() * w, Math.random() * h, 1, 0, 2 * Math.PI);
    ctx.fill();
  }
  // 文字
  for (let i = 0; i < code.length; i++) {
    ctx.font = 'bold 24px Arial';
    ctx.fillStyle = `rgb(${Math.random() * 150}, ${Math.random() * 150}, ${Math.random() * 150})`;
    ctx.save();
    ctx.translate(15 + i * 22, 28);
    ctx.rotate((Math.random() - 0.5) * 0.5);
    ctx.fillText(code[i], 0, 0);
    ctx.restore();
  }
};

// 刷新验证码
const refreshCaptcha = () => {
  captchaCode.value = generateCode();
  drawCaptcha(captchaCode.value);
};

onMounted(() => {
  refreshCaptcha();
});

// 登录
const handleLogin = async () => {
  try {
    // 校验空值
    if (!loginForm.value.uname || !loginForm.value.upwd) {
      ElMessage.warning('请输入用户名和密码');
      return;
    }
    if (!loginForm.value.code) {
      ElMessage.warning('请输入验证码');
      return;
    }

    // 校验验证码
    if (loginForm.value.code.toUpperCase() !== captchaCode.value.toUpperCase()) {
      ElMessage.error('验证码错误');
      refreshCaptcha();
      loginForm.value.code = '';
      return;
    }

    // 请求后端
    const res = await request.post('/persons/login', {
      uname: loginForm.value.uname,
      upwd: loginForm.value.upwd
    }, {
      responseType: 'text'
    });

    if (res.data === '登录成功') {
      localStorage.setItem('isLogin', 'true');
      localStorage.setItem('loginUsername', loginForm.value.uname);
      ElMessage.success('登录成功');
      router.push('/main');
    } else {
      ElMessage.error(res.data);
      refreshCaptcha();
      loginForm.value.code = '';
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
  background-size: cover;
  background-position: center;
  background-repeat: no-repeat;
}

.login-card {
  width: 400px;
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.94);
}

.login-title {
  text-align: center;
  font-size: 18px;
  font-weight: bold;
}

.login-btn {
  width: 100%;
}

.captcha-row {
  display: flex;
  align-items: center;
  gap: 8px;
  width: 100%;
}

.captcha-row .el-input {
  flex: 1;
}

.captcha-canvas {
  width: 100px;
  height: 40px;
  flex-shrink: 0;
  cursor: pointer;
  border: 1px solid #dcdfe6;
  border-radius: 4px;
  background-color: #f2f6ff;
}

:deep(.el-input__wrapper) {
  pointer-events: auto !important;
  opacity: 1 !important;
}
</style>