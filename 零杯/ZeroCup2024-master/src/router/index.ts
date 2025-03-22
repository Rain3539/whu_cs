import { createRouter, createWebHistory } from 'vue-router'
//主页
import Enter from '../pages/Enter.vue'
import HomePage from '../pages/HomePage.vue'
// 奥运详情页面
import Details from '../DetailsOfTheQlympic/Details.vue'
import Pingpong from '../DetailsOfTheQlympic/Detail-Pingpong.vue'
import Gymnastics from '../DetailsOfTheQlympic/Detail-Gymnastics.vue'
import Badminton from '../DetailsOfTheQlympic/Detail-Badminton.vue'
import Swim from '../DetailsOfTheQlympic/Detail-Swim.vue'
import Shoot from '../DetailsOfTheQlympic/Detail-Shoot.vue'
import Track from '../DetailsOfTheQlympic/Detail-Track.vue'
//中国骄傲
import ChineseProud from "@/pages/ChineseProud.vue";
import detailedEvent from "@/pages/detailedEvent.vue";
import sorts from "@/pages/DetailedEvent/sorts.vue";
import player from "@/pages/DetailedEvent/player.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/', //默认路径
      component: Enter
    },
    {
      path: '/homepage',
      component: HomePage
    },
    //奥运详情页面
    {
      path: '/Details',
      component: Details
    },
    {
      path: '/Details/Pingpong',
      component: Pingpong
    },
    {
      path: '/Details/Gymnastics',
      component: Gymnastics
    },
    {
      path:'/Details/Swim',
      component:Swim
    },
    {
      path:'/Details/Track',
      component:Track
    },
    {
      path:'/Details/Shoot',
      component:Shoot
    },
    {
      path:'/Details/Badminton',
      component:Badminton
    },
    {
      path: '/ChineseProud',
      component: ChineseProud
    },
    {
      path: '/detailedEvent',
      component: detailedEvent,
      children: [
        {
          path: '/DetailedEvent/sorts',
          component: sorts
        },
        {
          path: '/DetailedEvent/player',
          component: player
        }
      ]
    },
  ]
})

export default router
