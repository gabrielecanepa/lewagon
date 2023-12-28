import { createApp } from 'vue';

createApp({
  data() {
    return {
      message: 'Hello Vue!'
    };
  }
}).mount('#results'); // The container where you want the Vue instance to be mounted.
