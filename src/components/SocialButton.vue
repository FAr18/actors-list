<template>
  <div class="social-button-container" @click="openUrl">
    <img :src="iconUrl" class="social-button-icon" />
    <span class="social-button-text">{{ account }}</span>
  </div>
</template>

<script>
import twitchIcon from "@/assets/icons8-twitch-48.png";
import facebookIcon from "@/assets/icons8-facebook-48.png";
import instagramIcon from "@/assets/icons8-instagram-48.png";
import youtubeIcon from "@/assets/icons8-youtube-squared-48.png"
import plurkIcon from "@/assets/plurk.png"

export default {
  props: {
    type: {
      type: String,
      default: "none",
    },
    account: {
      type: String,
      default: "",
    },
    url: {
      type: String,
      default: "",
    },
  },
  computed: {
    iconUrl() {
      let iconSet = {
        Facebook: facebookIcon,
        Twitch: twitchIcon,
        Instagram: instagramIcon,
        Youtube: youtubeIcon,
        Plurk: plurkIcon
      };
      return iconSet[this.type];
    },
  },
  methods: {
    openUrl() {
      if (this.url) window.open(this.url);
    },
  },
};
</script>

<style>
.social-button-container {
  cursor: pointer;
  display: flex;
  justify-content: center;
}

.social-button-icon {
  width: 24px;
  height: 24px;
}

.social-button-text {
  padding-left: 3px;
  font-size: 14px;
}
</style>
