<template>
  <div class="auth-form">
    <div class="auth-inner-wrapper">
      <img id="hero-image" src="https://res.cloudinary.com/eventbike/image/upload/c_scale,w_5760/v1517156084/leone-venter-469710_syofmw.jpg"/>
      <div class="login-form">
        <h1>Welcome to reCourse</h1>
        <h2>Log in to get started</h2>
        <ul id="error-list">
          <li class="error-msg">
            {{errors}}
          </li>
        </ul>
        <div class="form-name form">
          <label class="label label-name">Organization Name </label>
          <input class="input" type="text" v-on:keyup="clearErrors" @keydown.enter="login" v-model="user.organization_name">
        </div>
        <div class="form-password form">
          <label class="label label-password">Password </label>
          <div class="pw-submit">
            <input class="input" type="password" v-on:keyup="clearErrors" @keydown.enter="login" v-model="user.password">
            <button class="button is-primary" v-on:click="login">LOG IN</button>    
          </div>
        </div>
        <div id="signup-button">
          <p class="account-prompt">Don't have an account?
            <router-link v-on:click.native="clearErrors" to="/">Click Here</router-link> to create one!
          </p> 
        </div>
      </div>
    </div>
  </div>  
</template>


<script>
  import axios from 'axios';
  export default {
    name: 'login-form',
    data() {
      return{
        user: {
          organization_name: '',
          password: ''
        }
      }
    },
    computed:{
      errors () {
        return this.$store.getters.errors
      }
    },
    methods:{
      login: function() {
        let user = {
          "user": {
            "organization_name": this.user.organization_name,
            "password": this.user.password
          } 
        }
        this.$store.dispatch('logCurrentUserIn',user).then( ()=>{
        this.$router.push('/')})
      },
      clearErrors: function() {
        this.$store.dispatch('clearErrors');
      }
    },

  }
</script>