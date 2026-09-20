import { createRouter, createWebHistory } from "vue-router";
import StudentManager from '../views/StudentManager.vue';
import LoginView from '../views/LoginView.vue';
import ChartsView from '../views/ChartsView.vue';
import ScoreCharts from "@/views/ScoreCharts.vue";
import MainView from '@/views/MainView.vue';
import LogView from '@/views/LogView.vue';

const routes = [
  {
    path: "/LoginView",
    name: "LoginView",
    component: LoginView
  },
  {
    path: "/main",
    name: "MainView",
    component: MainView,
    redirect: "/main/student",
    meta: { requiresAuth: true },
    children: [
      { path: "student", name: "StudentManager", component: StudentManager },
      { path: "charts",  name: "ChartsManager",  component: ChartsView },
      { path: "score",   name: "ScoreManager",   component: ScoreCharts },
      { path: "log",     name: "LogView",        component: LogView }
    ]
  },
  { path: '/', redirect: '/LoginView' }
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

router.beforeEach((to, from, next) => {
  if (to.meta.requiresAuth) {
    if (localStorage.getItem('isLogin') !== 'true') {
      next('/LoginView');
    } else {
      next();
    }
  } else {
    next();
  }
});

export default router;