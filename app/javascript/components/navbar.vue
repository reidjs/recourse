<template >
  <!-- <div v-if="currentUser" class="navbar"> -->
    <div>
    <nav class="navbar is-info" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <h1 class="logo">Recourse</h1>
        </a>
          <a class="navbar-item" href="/">
            Add Listing
          </a>
      </div>
    </nav>
    </div>
  <!-- </div> -->
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