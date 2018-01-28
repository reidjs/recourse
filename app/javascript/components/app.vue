<template>
  <div id="app">
  <transition name="fade" mode="out-in">
    <main class='main-content'>
      <transition name="fade" mode="out-in">
        <Navbar></Navbar>
      </transition>
      <transition name="fade" mode="out-in">
        <router-view></router-view>
      </transition>
    </main>
  </transition>
  </div>

</template>

<script>
  import Vue from 'vue';
  import VueRouter from 'vue-router';
  // import SessionForm from './components/session_form'

  // import IndexComponent from './components/index_component'
  // import SiteShowComponent from './components/site_show_component';
  import Navbar from './navbar'
  import LoginForm from './login_form'
  import SignupForm from './signup_form'
  import Vuex from 'vuex';
  // import Buefy from 'buefy'
  // import 'buefy/lib/buefy.css'

  // Vue.use(Buefy)
  // import Vuetify from 'vuetify';
  
  
  // import('../../app/assets/stylesheets/vuetify.css');
  // Vue.use(Vuetify);
  Vue.use(VueRouter);
  Vue.use(Vuex);

  Vue.use(Buefy.default)
 

  const config = {
    errorBagName: 'frontendErrors', // change if property conflicts
  }

  //  Vue.use(VeeValidate, config);

  import { store } from '../store';


  const routes = [
    
    { path: '/', component: SignupForm, meta: { requiresUnAuth: true} },
    // { path: '/', component: IndexComponent,meta: { requiresAuth: true }},
    { path: '/login', component: LoginForm, meta: { requiresUnAuth: true} },
    { path: '/signup', component: SignupForm, meta: { requiresUnAuth: true} }
]

  const router = new VueRouter({
    // mode: 'history',
    routes // short for `routes: routes`
  })

router.beforeEach((to, from, next) => {
  if (to.matched.some(record => record.meta.requiresAuth)) {

    if (!store.state.session.currentUser ) {
      next({
        path: '/signup',
        query: { redirect: to.fullPath }
      })
    } else {
      next()
    }
  }else if(to.matched.some(record => record.meta.requiresUnAuth)){
      if (store.state.session.currentUser ) {
            next({
              path: '/',
              query: { redirect: to.fullPath }
            })
          } else {
            next()
          }
  }  else {
    next()
  }
})



 export default {
  name: 'app',
  router,
  computed: {
    listings: function() {
      return this.$store.getters.listings
    },
    session: function() {
      return this.$store.getters.session
    }
  },
  store,
  components:{
    Navbar
  }
}

</script>
