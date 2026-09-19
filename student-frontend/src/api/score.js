import service from "@/utils/request.js";

const scoreApi = {
    selectScoreCount() {
        return service.get('/students/selectScoreCount')
    }
};

export default scoreApi;