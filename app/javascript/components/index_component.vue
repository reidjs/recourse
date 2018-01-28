<template>

  <div id="main" class="index-main">
    <div class="index-wrapper">
      <div class="cards-wrapper">
        <ul class="card-list" v-if="listingKeys && listingKeys.length">
          <li class="card-index-item" v-for="key in listingKeys" v-bind:key="key">
              <!-- <a :href="'/#/listings/' + key"> -->
              <Listing v-bind:listingProp='listings[key]'></Listing>
              <!-- </a> -->
          </li>
        </ul>
      </div>
    </div>
  </div>
  
</template>

<script>
  import axios from 'axios';
  import Listing from './listing_component';

  export default {
    
    data(){
      return{
        dialog: false,
        loading: false,
        listing: {
          list_name: "",
          list_image: "",
          user_id: "",
          description: "",
          end_date: "",
          start_bid: "" 
        }
        

      }
    },

    name: 'IndexComponent',
    components: {
      Listing
    },
    
    computed: {
      listingKeys(){
        return Object.keys(this.$store.state.listings)
      },
      listings(){
        return this.$store.state.listings
      }
    },

    created(){
      this.$store.dispatch("getListings")
    },
  
    methods:{
      getListing: function(){
          this.$store.dispatch("getListing", 1)
      }
      // postListing: function(){
      //   this.$store.dispatch("postListing",this.listing).then((ok)=> {
      //       if (ok){
      //         this.dialog = false;
      //         this.site.url = "http://www.YourSiteHere";

   
      //       }
      //     })
      // }
        
  }
}
</script>