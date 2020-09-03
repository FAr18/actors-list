<template>
  <b-container class="actors-list-container">
    <ActorCard
      v-for="(actor, key) in listFiltered"
      :key="key"
      :character-name="actor.character"
      :actor-name="actor.actor"
      :tags="actor.tags"
      :websites="actor.websites"
      :imageUrl="actor.image_url"
      :spoiler="spoiler"
    />
  </b-container>
</template>

<script>
import axios from "axios";
import ActorCard from "@/components/ActorCard";

export default {
  components: { ActorCard },
  props: {
    spoiler: {
      type: Boolean,
      default: true,
    },
    filter: {
      type: String,
      default: ""
    }
  },
  data() {
    return {
      baseUrl: process.env.VUE_APP_BASE_URL,
      actors: [],
    };
  },
  mounted() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      axios.get("static/actors.json").then((response) => {
        this.actors = response.data.actors;
        this.shuffleList();
      });
    },
    shuffleList() {
      let length = this.actors.length;
      for (let i = length - 1; i > 0; i--) {
        let rndIndex = Math.floor(Math.random() * (i + 1));
        [this.actors[i], this.actors[rndIndex]] = [this.actors[rndIndex], this.actors[i]];
      }
    }
  },
  computed: {
    listFiltered() {
      if (this.filter.length == "") return this.actors;
      else {
        console.log(this.filter);
        return this.actors.filter(actor => {
          return actor.tags.includes(this.filter);
        });
      }
    }
  },
};
</script>

<style>
.actors-list-container {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
  justify-items: center;
  gap: 20px 20px;
}
</style>
