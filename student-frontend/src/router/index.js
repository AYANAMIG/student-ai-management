import { createRouter, createWebHistory } from "vue-router";
import StudentManager from '../views/StudentManager.vue';
import LoginView from '../views/LoginView.vue';
import ChartsView from '../views/ChartsView.vue';
import ScoreCharts from '@/views/ScoreCharts.vue';

const routes = [
  { path: "/LoginView", name: "LoginView", component: LoginView },
  {
    path: "/student-manager",
    name: "StudentManager",
    component: StudentManager,
    meta: { requiresAuth: true }
  },
  { path: "/Charts-manager", name: "ChartsManager", component: ChartsView },
  { path: "/Score-manager", name: "ScoreManager", component: ScoreCharts },
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