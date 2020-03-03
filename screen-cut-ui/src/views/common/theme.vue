<template>
  <el-form>
    <h2>{{ $t('message.setting') }}</h2>
    <!--<el-form-item label="导航条类型">
      <el-radio-group v-model="navbarLayoutType">
        <el-radio label="default" border>default</el-radio>
        <el-radio label="inverse" border>inverse</el-radio>
      </el-radio-group>
    </el-form-item>-->
    <el-form-item :label="$t('message.sideBarSkin')">
      <el-radio-group v-model="sidebarLayoutSkin">
        <el-radio label="light" border>light</el-radio>
        <el-radio label="dark" border>dark</el-radio>
      </el-radio-group>
    </el-form-item>
    <el-form-item :label="$t('message.language')">
      <el-radio-group v-model="language" @change="changeLocal">
        <el-radio label="chinese" border>中文</el-radio>
        <el-radio label="english" border>English</el-radio>
      </el-radio-group>
    </el-form-item>
  </el-form>
</template>

<script>
  export default {
    computed: {
      navbarLayoutType: {
        get () { return this.$store.state.common.navbarLayoutType },
        set (val) { this.$store.commit('common/updateNavbarLayoutType', val) }
      },
      sidebarLayoutSkin: {
        get () { return this.$store.state.common.sidebarLayoutSkin },
        set (val) { this.$store.commit('common/updateSidebarLayoutSkin', val) }
      }
    },
    data () {
      return {
        language: ''
      }
    },
    methods: {
      changeLocal (val) {
        this.language = val
        // this.$http({
        //   url: this.$http.adornUrl('/sys/dictData/changeLocal'),
        //   method: 'post',
        //   // data: this.$http.adornData(val, false)
        //   data: this.$http.adornData({
        //     'language': val
        //   })
        // }).then(({data}) => {
        //   if (data && data.code === 0) {
        //     this.$message({
        //       message: '操作成功',
        //       type: 'success',
        //       duration: 3000
        //     })
        //   } else {
        //     this.$message.error(data.msg)
        //   }
        // })
        this.lang = val
        this.$i18n.locale = this.lang
      }

    }

  }
</script>

