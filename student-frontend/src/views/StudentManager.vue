<template>
  <div class="container">
    <el-card class="form-card">
      <el-form :model="student" label-width="80px" @submit.prevent="handleAdd">
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="姓名" required>
              <el-input v-model="student.name" placeholder="请输入姓名" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="年龄" required>
              <el-input v-model.number="student.age" type="number" placeholder="请输入年龄" />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="专业" required>
              <el-select v-model="student.major" placeholder="请选择专业">
                <el-option label="计算机科学与技术" value="计算机科学与技术" />
                <el-option label="软件工程" value="软件工程" />
                <el-option label="人工智能" value="人工智能" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="所属班级" required>
              <el-select v-model="student.classp" placeholder="请选择班级">
                <el-option label="23级计算机技术3班" value="23级计算机技术3班" />
                <el-option label="23级计算机技术4班" value="23级计算机技术4班" />
                <el-option label="23级计算机技术2班" value="23级计算机技术2班" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="入学日期" required>
              <el-date-picker
                  v-model="student.enrol"
                  type="date"
                  placeholder="请选择入学日期"
                  format="YYYY-MM-DD"
                  value-format="YYYY-MM-DD"
                  style="width: 100%;"
              />
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item>
              <el-button type="primary" @click="handleAdd">添加</el-button>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
    </el-card>

    <el-card class="search-card">
      <el-row :gutter="20">
        <el-col :span="8">
          <el-input v-model="searchName" placeholder="输入姓名搜索" clearable @keyup.enter="handleSearch" />
        </el-col>
        <el-col :span="2">
          <el-button @click="handleSearch">查询</el-button>
        </el-col>
      </el-row>
    </el-card>

    <el-card class="table-card">
      <el-table :data="students" border>
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="name" label="姓名" />
        <el-table-column prop="age" label="年龄" />
        <el-table-column prop="major" label="专业" />
        <el-table-column prop="enrol" label="入学日期" />
        <el-table-column prop="classp" label="所属班级" />
        <el-table-column label="操作" min-width="160" align="center">
          <template #default="scope">
            <div style="display:flex; gap:8px; justify-content:center;">
              <el-button type="primary" @click="handleEdit(scope.row)">编辑</el-button>
              <el-button type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
            </div>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <el-dialog v-model="dialogVisible" title="编辑学生信息" width="500px">
      <el-form :model="editStudent" label-width="80px">
        <el-form-item label="姓名" required>
          <el-input v-model="editStudent.name" placeholder="请输入姓名" />
        </el-form-item>
        <el-form-item label="年龄" required>
          <el-input v-model.number="editStudent.age" type="number" placeholder="请输入年龄" />
        </el-form-item>
        <el-form-item label="专业" required>
          <el-select v-model="editStudent.major" placeholder="请选择专业">
            <el-option label="计算机科学与技术" value="计算机科学与技术" />
            <el-option label="软件工程" value="软件工程" />
            <el-option label="人工智能" value="人工智能" />
          </el-select>
        </el-form-item>
        <el-form-item label="所属班级" required>
          <el-select v-model="editStudent.classp" placeholder="请选择班级">
            <el-option label="23级计算机技术3班" value="23级计算机技术3班" />
            <el-option label="23级计算机技术4班" value="23级计算机技术4班" />
            <el-option label="23级计算机技术2班" value="23级计算机技术2班" />
          </el-select>
        </el-form-item>
        <el-form-item label="入学日期" required>
          <el-date-picker
              v-model="editStudent.enrol"
              type="date"
              placeholder="请选择入学日期"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
              style="width: 100%;"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleUpdate">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue';
import request from '@/utils/request';
import { ElMessage, ElMessageBox } from 'element-plus';

const students = ref([]);
const searchName = ref('');
const student = ref({ name: '', age: '', major: '', classp: '', enrol: '' });
const editStudent = ref({ id: null, name: '', age: '', major: '', classp: '', enrol: '' });
const dialogVisible = ref(false);

const fetchStudents = async () => {
  try {
    const res = await request.get('/students');
    students.value = res.data;
  } catch (err) {
    ElMessage.error('获取学生列表失败');
  }
};

const handleAdd = async () => {
  if (!student.value.name) { ElMessage.warning('请输入姓名'); return; }
  if (!student.value.age) { ElMessage.warning('请输入年龄'); return; }
  if (!student.value.major) { ElMessage.warning('请选择专业'); return; }
  if (!student.value.classp) { ElMessage.warning('请选择所属班级'); return; }
  if (!student.value.enrol) { ElMessage.warning('请选择入学日期'); return; }
  try {
    await request.post('/students', student.value);
    ElMessage.success('添加成功');
    student.value = { name: '', age: '', major: '', classp: '', enrol: '' };
    fetchStudents();
  } catch (err) {
    ElMessage.error('添加失败');
  }
};

const handleSearch = async () => {
  try {
    const res = await request.get('/students/search', {
      params: { name: searchName.value }
    });
    students.value = res.data;
  } catch (err) {
    ElMessage.error('搜索失败');
  }
};

const handleDelete = async (id) => {
  try {
    await ElMessageBox.confirm('确定删除该学生信息？删除不可恢复！', '删除确认', {
      type: 'warning'
    });
    await request.delete(`/students/${id}`);
    ElMessage.success('删除成功');
    fetchStudents();
  } catch (err) {
    if (err === 'cancel') {
      ElMessage.info('已取消删除');
    } else {
      ElMessage.error('删除失败');
    }
  }
};

const handleEdit = (row) => {
  editStudent.value = { ...row };
  dialogVisible.value = true;
};

const handleUpdate = async () => {
  try {
    await request.put(`/students/${editStudent.value.id}`, editStudent.value);
    ElMessage.success('修改成功');
    dialogVisible.value = false;
    fetchStudents();
  } catch (err) {
    ElMessage.error('修改失败');
  }
};

onMounted(() => {
  fetchStudents();
});
</script>

<style scoped>
.container { padding: 20px; }
.form-card, .search-card, .table-card { margin-bottom: 20px; }
</style>