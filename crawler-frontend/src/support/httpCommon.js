import axios from "axios";

const API_VERSION_PREFIX = "/api/v1"

const backend_api = axios.create({
    baseURL: "http://localhost:8888" + API_VERSION_PREFIX,
    headers: {
        Accept: "application/json",
        'Content-Type': 'application/json'
    }
});

export { backend_api, API_VERSION_PREFIX }