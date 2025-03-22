<template>
    <div class="shell" id="shell" ref="shellRef">
      <div class="header">
        <img src="./images/img-badminton/history.svg" alt="" />
      </div>
      <div class="timeline">
        <div class="item" ref="item1Ref" data-text="艺术体操的起源">
          <div class="content">
            <img src="./images/img-badminton/historyBg1.png" alt="" class="img" />
            <h2 class="content-title">19世纪中期--起源</h2>
            <p class="content-desc">
              现代羽毛球运动诞生于 1873 年的英国，当时英国格拉斯哥郡的伯明顿镇，鲍弗特伯爵的领地开游园会，几个从印度回来的退役军官介绍了一种隔网用拍子来回击打毽球的游戏，后来这种运动就以 “伯明顿”
            </p>
          </div>
        </div>
        <div class="item" ref="item2Ref" data-text="国际艺术体操联合会的成立">
          <div class="content">
            <img src="./images/img-badminton/historyBg2.png" alt="" class="img" />
            <h2 class="content-title">20世纪初--传播阶段</h2>
            <p class="content-desc">
              20 世纪初，羽毛球运动从英国逐渐传播到世界其他地区，欧美国家羽毛球发展迅速，英国、丹麦、美国、加拿大等成为当时世界羽毛球水平较高的国家。各国开始举办一些国内的羽毛球比赛，并且有了一些地区性的对抗赛。乔治・汤姆斯（George Thomas）是英国羽毛球的重要推动者，他为羽毛球在英国及欧洲的发展做出了重要贡献，后来以他名字命名的 “汤姆斯杯” 成为了世界男子羽毛球团体锦标赛的最高荣誉。
            </p>
          </div>
        </div>
        <div class="item" ref="item3Ref" data-text="艺术体操成为奥运会正式比赛项目">
          <div class="content">
            <img src="./images/img-badminton/historyBg3.png" alt="" class="img" />
            <h2 class="content-title">20世纪中叶--亚洲崛起</h2>
            <p class="content-desc">
              20 世纪 50 年代开始，羽毛球在亚洲得到了很大的发展。马来西亚崭露头角，印度尼西亚的技术和打法日渐成熟，逐渐追上世界顶尖水平。中国羽毛球运动也开始兴起，1953 年中国举办了全国性的球类运动大会，羽毛球作为表演项目出现。国际羽毛球联合会（International Badminton Federation）于 1934 年成立，并在这一时期组织了一些国际比赛，促进了各国之间的交流和竞争。
            </p>
          </div>
        </div>
        <div class="item" ref="item4Ref" data-text="规则和评分系统的改革">
          <div class="content">
            <img src="./images/img-badminton/historyBg4.png" alt="" class="img" />
            <h2 class="content-title">20世纪70年代--群雄逐鹿阶段</h2>
            <p class="content-desc">
              20 世纪 70 年代，国际羽毛球坛呈现出印度尼西亚、中国、欧洲等多强竞争的局面。中国羽毛球队经过多年的发展，逐渐成为世界强队。欧洲的丹麦、瑞典等国家也保持着较高的水平。奥运会于 1992 年将羽毛球列为正式比赛项目。中国羽毛球的标志性人物，被称为 “超级丹”的林丹，与马来西亚名将李宗伟多次在国际比赛中上演巅峰对决，林李大战铸就了羽坛的经典传奇。
            </p>
          </div>
        </div>
        <div class="item" ref="item5Ref" data-text="艺术体操项目的扩展和普及">
          <div class="content">
            <img src="./images/img-badminton/historyBg5.png" alt="" class="img" />
            <h2 class="content-title">21世纪--发展</h2>
            <p class="content-desc">
              随着科技的发展和训练方法的不断改进，羽毛球运动员的技术水平不断提高，比赛中的战术运用更加多样化。羽毛球在世界范围内得到了更广泛的推广和普及，越来越多的国家和地区开始重视羽毛球运动的发展，参与到国际羽毛球赛事中的国家和地区不断增加。中国羽毛球运动员谌龙在林丹之后逐渐成为中国男子羽毛球的领军人物，多次在世界大赛中取得优异成绩。2024年巴黎奥运会，丹麦名将安赛龙击败泰国选手昆拉武特，蝉联男单冠军
            </p>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script lang="ts">
  import { defineComponent, onMounted, ref } from 'vue';
  
  export default defineComponent({
    setup() {
      let shellRef = ref<HTMLElement | null>(null);
      let item1Ref = ref<HTMLElement | null>(null);
      let item2Ref = ref<HTMLElement | null>(null);
      let item3Ref = ref<HTMLElement | null>(null);
      let item4Ref = ref<HTMLElement | null>(null);
      let item5Ref = ref<HTMLElement | null>(null);
      onMounted(() => {
        // window.scrollTo(0,0);
        shellRef.value = document.querySelector('.shell');
        item1Ref.value = document.querySelector('.item');
        item2Ref.value = document.querySelector('.item:nth-child(2)');
        item3Ref.value = document.querySelector('.item:nth-child(3)');
        item4Ref.value = document.querySelector('.item:nth-child(4)');
        item5Ref.value = document.querySelector('.item:nth-child(5)');
        
      initTimeline();
      window.addEventListener('scroll', handleScroll)
   

    });
      const initTimeline = () => {
        if (item1Ref.value && shellRef.value) {
          shellRef.value.classList.add("addBg");
          
          item1Ref.value.classList.add("item--active");
   
      }
      }
      const handleScroll = () =>{
        if (shellRef.value && item1Ref.value && item2Ref.value && item3Ref.value && item4Ref.value && item5Ref.value) {
        const itemRects = [
          item1Ref.value!.getBoundingClientRect(),
          item2Ref.value!.getBoundingClientRect(),
          item3Ref.value!.getBoundingClientRect(),
          item4Ref.value!.getBoundingClientRect(),
          item5Ref.value!.getBoundingClientRect(),
        ];
        let activeItemIndex = -1;
        for(let i =0;i<itemRects.length;i++){
          const itemRect = itemRects[i];
          const viewportHeight = window.innerHeight;
          const vwValueInPixels = parseFloat(getComputedStyle(document.documentElement).fontSize) * 30;
          if(itemRect.bottom >= viewportHeight - vwValueInPixels){
             activeItemIndex = i;
             break;
          }
        }
        const items = [item1Ref.value, item2Ref.value, item3Ref.value, item4Ref.value, item5Ref.value];
        items.forEach((item, index) => {
          if (item) {
            item.classList.remove('item--active');
          }
        });
        if (activeItemIndex!== -1) {
          const activeItem = items[activeItemIndex];
          if (activeItem) {
            activeItem.classList.add('item--active');
            const imgElement = activeItem.querySelector('.img') as HTMLImageElement | null;
            if (imgElement) {
              shellRef.value.classList.remove('addBg');
              shellRef.value.classList.add('newBgStyle');
              shellRef.value.style.backgroundImage=`url(${imgElement.src})`;
            }
          }
        }
        }
      }
    }
})
  </script>
  
  <style scoped>
    * {
      padding: 0;
      margin: 0;
    }
  .shell {
    width:100%;
    height:100%;
    position:relative;
    transition: 0.3s ease 0s;
  }
  .addBg{
    background-attachment: fixed;
    background-size: cover;
    background-repeat: no-repeat; 
    background-image: url(./images/img-badminton/historyBg1.png)!important;
  }

  .newBgStyle {
    background-attachment: fixed;
    background-size: cover;
    background-repeat: no-repeat;
    /* 这里设置默认背景图片或留空，在 JavaScript 中根据需要设置具体的背景图片 */
}
  .header {
      width: 100%;
      text-align: center;
    
      margin-bottom: 10vw;
      position: relative;
      font-size: 4vw;
      color: white;
      z-index:10000;
    }
  
  .title {
      color: #fff;
      font-size: 3vw;
      font-weight: normal;
      margin: 0;
      
    }
  
  .timeline {
      display: flex;
      margin: 0 auto;
      flex-wrap: wrap;
      flex-direction: column;
   
      position: relative;
    }
  
  .content-title {
      font-weight: normal;
      font-size: 45px;
      margin: -10px 0 0 0;
      transition: 0.4s;
      padding: 0 10px;
      box-sizing: border-box;
      color: #fff;
    }
  
  .content-desc {
      margin: 0;
      font-size: 20px;
      box-sizing: border-box;
      color: rgba(255, 255, 255, 0.7);
      line-height: 25px;
    }
  
  .timeline:before {
      position: absolute;
      left: 50%;
      width: 2px;
      height: 100%;
      margin-left: 0px;
      content: '';
      background: rgba(255, 255, 255, 0.7);
    }
  
   .item {
    width:25vw;
    height:80vh;
    left:15vw;
    margin:5vh 0;
    transition: 0.5s;
    opacity: 0.3;
    position:relative;
    text-align: right;
   }
  
   .item:nth-child(even){
    left:60vw;
   }

   .item--active {
    width:28vw;
    opacity: 1;
    filter: blur(0px);
   }
  
  
  
  .img {
      max-width: 100%;
      box-shadow: 0 10px 15px rgba(0, 0, 0, 0.4);
    }
  
  .subtitle {
      color: rgba(255, 255, 255, 0.5);
      font-size: 16px;
      letter-spacing: 5px;
      margin: 10px 0 0 0;
      font-weight: normal;
    }
  
  .footer {
      padding: 95px 0;
      text-align: center;
    }
  
  .footer a {
      color: #999;
      display: inline-block;
    }
  
    
  
    @media only screen and (max-width: 767px) {
    .timeline:before {
        display: none;
      }
    .item {
      width:80vw;
      left:10vw;
      margin:40vw 0;
    }
    .item:nth-child(even){
      width:80vw;
      left:10vw;
      margin:40vw 0;
    }
    } 
  </style>