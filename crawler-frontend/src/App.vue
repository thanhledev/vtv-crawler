<script setup>
import { RouterLink, RouterView } from 'vue-router'
import {onMounted} from "vue";
import {useNewsStore} from "@/stores/news.js";

const newsStore = useNewsStore()
onMounted(() => {
  newsStore.loadNews()
})
</script>

<template>
  <RouterView />
</template>

<style scoped>

</style>
