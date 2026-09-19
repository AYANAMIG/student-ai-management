import service from "@/utils/request.js";

const chartApi = {
    selectCoachCourseCount() {
        return service.get('/students/selectCoachCourseCount')
    }
};

export default chartApi;