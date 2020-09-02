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
        Youtube: youtubeIcon
      };
      return iconSet[this.type];
    },
  },
  methods: {
    openUrl() {
      let url = "";
      if (this.url) url = this.url;
      else if (this.account) {
        let urlSet = {
          facebook: "https://www.facebook.com/",
          twitch: "https://www.twitch.tv/",
          instagram: "https://www.instagram.com/",
          plurk: "https://www.plurk.com/",
          youtube: "https://www.youtube.com/"
        };
        url = `${urlSet[this.type]}${this.account}`;
      }

      if (url) window.open(url);
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
</style>
