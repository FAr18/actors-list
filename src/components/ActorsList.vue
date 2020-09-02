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
        console.log(this.actors.length);
      });
    },
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
