import axios from "axios";

const API_VERSION_PREFIX = "/api/v1"

const backend_api = axios.create({
    baseURL: import.meta.env.VITE_CRAWLER_BACKEND_URL + API_VERSION_PREFIX,
    headers: {
        Accept: "application/json",
        'Content-Type': 'application/json'
    }
});

export { backend_api, API_VERSION_PREFIX }