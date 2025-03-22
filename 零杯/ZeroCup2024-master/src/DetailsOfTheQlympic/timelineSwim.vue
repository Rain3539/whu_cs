<template>
    <div class="shell" id="shell" ref="shellRef">
      <div class="header">
        <img src="./images/img-swim/history.svg" alt="" />
      </div>
      <div class="timeline">
        <div class="item" ref="item1Ref" data-text="艺术体操的起源">
          <div class="content">
            <img src="./images/img-swim/historyBg1.png" alt="" class="img" />
            <h2 class="content-title">远古--起源</h2>
            <p class="content-desc">
              游泳起源说法众多，人们为了生存、捕捞、逃避危险等学会游泳，是人类与大自然斗争的技能。各国古代文明中都有游泳相关的记载或活动，如古埃及壁画中有游泳的描绘，古希腊人将游泳作为锻炼身体的方式。
            </p>
          </div>
        </div>
        <div class="item" ref="item2Ref" data-text="国际艺术体操联合会的成立">
          <div class="content">
            <img src="./images/img-swim/historyBg2.png" alt="" class="img" />
            <h2 class="content-title">17世纪--近代发展</h2>
            <p class="content-desc">
              游泳运动在欧洲逐渐兴起，英国成为现代游泳的重要发源地。游泳活动日益频繁，室内游泳池开始修建，游泳组织和比赛相继出现。1837 年英国伦敦成立了第一个游泳组织，并举办了最早的游泳比赛。这一时期游泳技术和规则不断探索和完善。
            </p>
          </div>
        </div>
        <div class="item" ref="item3Ref" data-text="艺术体操成为奥运会正式比赛项目">
          <div class="content">
            <img src="./images/img-swim/historyBg3.png" alt="" class="img" />
            <h2 class="content-title">19世纪--现代竞技游泳形成</h2>
            <p class="content-desc">
              1896年第一届现代奥运会上，游泳项目被列为正式比赛项目。20世纪初，跳水、花样游泳等项目也相继被纳入奥运会。现代奥运会游泳比赛包括自由泳、‌仰泳、‌蛙泳、‌蝶泳和‌混合泳等多个项目，比赛距离从50米到1500米不等。匈牙利人阿尔弗雷德・哈约什是首位奥运会游泳冠军，他的夺冠推动了游泳在世界范围内的发展。
            </p>
          </div>
        </div>
        <div class="item" ref="item4Ref" data-text="规则和评分系统的改革">
          <div class="content">
            <img src="./images/img-swim/historyBg4.png" alt="" class="img" />
            <h2 class="content-title">20世纪中叶-技术创新</h2>
            <p class="content-desc">
              游泳技术不断创新，各国游泳水平普遍提高，游泳运动在全球范围内得到广泛普及。
              美国运动员迈克尔・菲尔普斯在这一时期脱颖而出，他在奥运会上多次获得金牌，成为游泳界的传奇人物。
              1896年第一届现代奥运会上，游泳项目被列为正式比赛项目。
              20世纪初，跳水、花样游泳等项目也相继被纳入奥运会。
              现代奥运会游泳比赛包括自由泳、‌仰泳、‌蛙泳、‌蝶泳和‌混合泳等多个项目，比赛距离从50米到1500米不等
              。
            </p>
          </div>
        </div>
        <div class="item" ref="item5Ref" data-text="艺术体操项目的扩展和普及">
          <div class="content">
            <img src="./images/img-swim/historyBg5.png" alt="" class="img" />
            <h2 class="content-title">21世纪--多元发展</h2>
            <p class="content-desc">
              游泳运动更加注重科学训练、技术细节和个性化发展。游泳赛事不断丰富，除了奥运会、世锦赛等大型赛事，各种区域性、俱乐部赛事也蓬勃开展。中国游泳运动员孙杨在 21 世纪取得了优异的成绩，多次在奥运会、世锦赛等赛事中获得金牌，为中国游泳事业的发展做出了重要贡献。中国游泳运动员潘展乐以46秒40的成绩获得2024巴黎奥运会男子100米自由泳冠军，为中国游泳首夺该项目奥运会金牌，并打破了自己保持的世界纪录。
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
    background-image: url(./images/img-swim/historyBg1.png)!important;
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