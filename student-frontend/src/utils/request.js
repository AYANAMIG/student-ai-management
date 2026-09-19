import axios from 'axios';

const request = axios.create({
    baseURL: 'http://localhost:8081/api',
    timeout: 5000
});

export default request;