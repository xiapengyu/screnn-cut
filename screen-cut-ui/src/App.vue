<template>
  <transition name="fade">
    <router-view></router-view>
  </transition>
</template>

<script>
  export default {
    created () {
      this.lang = 'chinese'
      this.$i18n.locale = this.lang
    }
  }
</script>
