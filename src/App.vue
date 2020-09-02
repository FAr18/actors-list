<template>
  <div id="app">
    <b-container class="p-3">
      <!-- <h1 class="m-4 text-light">不治之鎮 2.0</h1>
      <div class="text text-light"></div> -->
      <b-form-checkbox
        v-model="spoiler"
        name="check-button"
        switch
        class="text-light"
      >
        是否顯示身分標籤
      </b-form-checkbox>
      <b-row v-if="spoiler" class="justify-content-md-center align-items-md-center">
        <span class="text-light">標籤過濾：</span>
        <b-button
          v-for="(tag, key) in tags"
          :key="key"
          :variant="getTagColor(tag)"
          size="sm"
          class="m-1"
          style="cursor: default;"
          @click="setFilter(tag)">
          {{ getTagText(tag) }}
        </b-button>
      </b-row>
    </b-container>
    <hr />
    <ActorsList :spoiler="spoiler" :filter="filter" class="mb-5"/>
  </div>
</template>

<script>
import ActorsList from "./components/ActorsList";

export default {
  name: "App",
  components: {
    ActorsList,
  },
  data() {
    return {
      spoiler: false,
      tags: [
        "prisoner",
        "origin_prisoner",
        "newbie_prisoner",
        "police",
        "prison_guard",
        "prison_doctor"
      ],
      filter: ""
    };
  },
  methods: {
    getTagColor(tag) {
      let tagsColor = {
        prisoner: "secondary",
        origin_prisoner: "danger",
        newbie_prisoner: "warning",
        police: "primary",
        prison_guard: "info",
        prison_doctor: "success"
      };
      return tagsColor[tag];
    },
    getTagText(tag) {
      let tagsColor = {
        prisoner: "囚犯",
        origin_prisoner: "原生囚犯",
        newbie_prisoner: "新生囚犯",
        police: "警察",
        prison_guard: "獄警",
        prison_doctor: "獄醫"
      };
      return tagsColor[tag];
    },
    setFilter(newFilter) {
      if (newFilter == this.filter) this.filter = "";
      else this.filter = newFilter;
    }
  },
};
</script>

<style>
body {
  height: 100%;
}

#app {
  text-align: center;
}
</style>
