import Vuex from 'vuex';
import Vue from 'vue';
Vue.use(Vuex);
import axios from 'axios';
let getUser = undefined;

if (window.currentUser) {
  getUser = window.currentUser;
}



export const store = new Vuex.Store({
  state: {
    listings: {},
    users: {},
    session: { currentUser:getUser},
    errors: null
  },
  getters: {
    listings: state => state.listings,
    users: state => state.users,
    session: state => state.session,
    errors: state => state.errors
  },
  mutations: {
    ADD_CURRENT_USER (state, payload) {
      const currentUser = {
        id: payload.id,
        organization_name: payload.organization_name
      };
      state.session.currentUser = currentUser;
    },
    ADD_LISTING (state, payload) {
      const listing = {
        id: payload.id,
        list_name: payload.list_name,
        list_image: payload.list_image,
        user_id: payload.user_id,
        description: payload.description,
        end_date: payload.end_date,
        start_bid: payload.start_bid
      };
      state.listings.unshift(listing); 
    },
    LOGOUT (state) {
      state.session = {currentUser: undefined};
      state.listings = {};
    },
    SET_ERRORS (state, payload) {
      state.errors = payload;
    },
    CLEAR_ERRORS (state) {
      state.errors = null;
    },
    CLEAR_LISTINGS (state) {
      state.listings = {};
    },
    ADD_LISTINGS(state,payload){
      state.listings = Object.assign({},state.listings, payload);
    },
    ADD_USERS(state,payload){
      state.users = Object.assign({},state.users, payload);
    }
  },
  actions: {
    addListing (context) {
      context.commit('ADD_LISTING');
    },
    clearListings (context) {
      context.commit('CLEAR_LISTINGS');
    },
    clearErrors (context) {
      context.commit('CLEAR_ERRORS');
    },
    postListing(context, listing) {
      return axios.post(`api/listings`, listing)
        .then(res => {
          context.commit('ADD_LISTINGS', res.data.listings);
          return (res);
        })
        .catch(e => {
          return (false);
        });
    },
    logCurrentUserIn (context, user) {
      context.commit('CLEAR_ERRORS');

        return axios.post(`api/session`, user )
          .then(res => {
            context.commit('ADD_CURRENT_USER', res.data);
          })
          .catch(e => {
            context.commit('SET_ERRORS', e.response.data[0]);
          });
      
    },
    signUserIn(context, user){
        context.commit('CLEAR_ERRORS');
        return axios.post(`api/users`,
          user
        )
          .then(res => {
            context.commit('ADD_CURRENT_USER', res.data);
            return true;
          })
          .catch(e => {
            context.commit('SET_ERRORS', e.response.data[0]);
            return false;
          });
      
    },
    logout (context) {
      return axios.delete(`api/session`)
        .then(res => {
          context.commit('LOGOUT');

        })
        .catch(e => {
    
          context.commit('SET_ERRORS', e.response.data[0]);
        });


      
    },
    getListings(context) {
      return axios.get(`api/listings`)
        .then(res => {
          context.commit('ADD_LISTINGS', res.data.listings)
        })
        .catch(e => {


        });
    },
    getUsers(context) {
      return axios.get(`api/users`)
        .then(res => {
          context.commit('ADD_USERS', res.data.users)
        })
        .catch(e => {

        });
    }
  }
  
});