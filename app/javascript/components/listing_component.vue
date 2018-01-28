<template>
<div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img v-bind:src="listing.list_url" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
      <div class="media-content-bidder">
        <p class="subtitle is-6">High Bidder:</p>
        <p class="title is-4">need to add</p>
      </div>
      <div class="media-content">
        <p class="subtitle is-6">Listing Owner:</p>
        <p class="title is-4">{{listing.lister.organization_name}}</p>
      </div>
    </div>

    <div class="content">
      <span>{{listing.description}}</span>
      <br>
      <br>
      <section class="bid-section">
        <div>
        <time class="timer-txt">Time Left in Listing:<Countdown class="timer" v-bind:deadline='listing.end_date'></Countdown></time>
        </div>
        <br>
        <div>
        <b-field>
            <b-select placeholder="Currency">
                <option>$</option>
                <option>£</option>
                <option>€</option>
            </b-select>
            <b-input type="number" placeholder="0,00"></b-input>
            <p class="control">
                <button class="button is-success">Bid</button>
            </p>
        </b-field>
        </div>
      </section>
    </div>
  </div>
</div>
</template>

<script>
  import axios from 'axios';
  import Countdown from './countdown'
  export default {
    name: 'Listing',
    components: { Countdown },
    props: ['listingProp'],

    
    data() {
      
      return{
        status: true,
        listing: this.listingProp
      }
    },

    created(){
      console.log(this.listingProp)
      
    },

    methods:{

  
    },
    computed: {

    }
  }
</script>
