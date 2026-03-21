import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

import '@picocss/pico/css/pico.min.css'
import '@/tokens/colors.css'
import '@/tokens/lightness.css'
import '@/styles/main.css'

import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { faMugSaucer, faHouse, faGear, faCircleUser } from '@fortawesome/free-solid-svg-icons'

const app = createApp(App)

app.use(createPinia())
app.use(router)

library.add(faCircleUser, faHouse, faMugSaucer, faGear)
app.component('FontAwesomeIcon', FontAwesomeIcon)

app.mount('#app')
