<template>
<div class="card">
  <div class="card-image">
    <figure class="image is-4by3">
      <img src="https://bulma.io/images/placeholders/1280x960.png" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
      <div class="media-content-bidder">
        <p class="subtitle is-6">High Bidder:</p>
        <p class="title is-4">Habitat for Humanity</p>
      </div>
      <div class="media-content">
        <p class="subtitle is-6">Listing Owner:</p>
        <p class="title is-4">Bayview Food Shelf</p>
      </div>
    </div>

    <div class="content">
      12 cans of the best green beans north of the border. Come one come all to get
      these beans. Deals like these won't last long!
      <br>
      <br>
      <section class="bid-section">
        <div>
        <time class="timer-txt">Time Left in Listing:<Countdown class="timer" deadline="January 30, 2018"></Countdown></time>
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
      
      
    },

    methods:{

  
    },
    computed: {

    }
  }
</script>
