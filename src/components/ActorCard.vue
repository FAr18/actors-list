<template>
  <b-card :title="characterName" :sub-title="getSubTitle(actorName)" tag="article" class="actor-card-container">
    <!-- <b-card-text>由 {{ actorName }} 扮演</b-card-text> -->
    <b-card-text v-if="spoiler">
      <b-button
        v-for="(tag, key) in tags"
        :key="key"
        :variant="getTagColor(tag)"
        size="sm"
        class="m-1"
        style="cursor: default;">
        {{ getTagText(tag) }}
      </b-button>
    </b-card-text>
    <b-card-text>
      <SocialButton
        v-for="(social, key) in websites"
        :key="key"
        :type="social.web"
        :account="social.account"
        :url="social.url"
      />
    </b-card-text>
  </b-card>
</template>

<script>
import SocialButton from "@/components/SocialButton";

export default {
  components: {
    SocialButton,
  },
  props: {
    characterName: {
      type: String,
      default: "",
    },
    actorName: {
      type: String,
      default: "",
    },
    tags: {
      type: Array,
      default: Array,
    },
    websites: {
      type: Array,
      default: Array,
    },
    imageUrl: {
      type: String,
      default: "",
    },
    spoiler: {
      type: Boolean,
      default: true,
    },
  },
  methods: {
    getSubTitle(actorName) {
      return `由 ${actorName} 扮演`;
    },
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
    }
  },
};
</script>

<style>
.actor-card-container {
  width: 100%;
}

.card-title {
  font-weight: bold;
}
</style>
