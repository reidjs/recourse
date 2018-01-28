<template >
  <div v-if="currentUser">
    <nav class="navbar is-info" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <h1 class="logo">reCourse</h1>
        </a>
         <div class="navbar-item">Hello, {{currentUser.organization_name}}</div>
         <div class="navbar-item">Your Balance: <b>&nbsp 345 Manna</b></div>
         
      </div>
       <div class="navbar-end">
          <a class="navbar-item" href="/">
            Add Listing
          </a>
       </div>
    </nav>
    </div>
  </div>
</template>


<script>
export default {
  name: "navbar",
  computed: {
    currentUser() {
      return this.$store.state.session.currentUser;
    },
    listings(){
      return Object.values(this.$store.state.listings);
    }
  },
  methods: {
    logout: function() {
      this.$store.dispatch("logout").then(() => this.$router.push("login"));
    }
  },
  data() {
    return {};
  }
};
</script>