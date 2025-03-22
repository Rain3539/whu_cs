<template>
    <div class="shell" id="shell" ref="shellRef">
      <div class="header">
        <img src="./images/img-track/history.svg" alt="" />
      </div>
      <div class="timeline">
        <div class="item" ref="item1Ref" data-text="艺术体操的起源">
          <div class="content">
            <img src="./images/img-track/historyBg1.svg" alt="" class="img" />
            <h2 class="content-title">史前--起源</h2>
            <p class="content-desc">
              田径运动的历史可以追溯到史前时代，当时的人类为了生存，需要进行奔跑、跳跃和投掷等基本身体活动。这些活动逐渐演变成了一种竞技形式，成为古代各种宗教仪式和庆典活动的一部分。最早的有记录的田径比赛出现在古希腊的奥林匹克运动会上。
            </p>
          </div>
        </div>
        <div class="item" ref="item2Ref" data-text="国际艺术体操联合会的成立">
          <div class="content">
            <img src="./images/img-track/historyBg2.svg" alt="" class="img" />
            <h2 class="content-title">19世纪--兴起</h2>
            <p class="content-desc">
              19世纪，随着工业革命的推进和现代体育观念的形成，田径运动开始在欧洲和美国等地兴起。学校体育课程中引入了田径项目，各种田径俱乐部和比赛也应运而生。1840年，首届现代田径比赛在英国举行，标志着田径运动进入了一个新的发展阶段。
            </p>
          </div>
        </div>
        <div class="item" ref="item3Ref" data-text="艺术体操成为奥运会正式比赛项目">
          <div class="content">
            <img src="./images/img-track/historyBg3.svg" alt="" class="img" />
            <h2 class="content-title">1912--成立联合会</h2>
            <p class="content-desc">
              1912年，国际田径联合会（IAAF），即现在的世界田径（World Athletics），在瑞典成立。IAAF的成立为田径运动制定统一的规则和标准，促进了田径运动在全球范围内的普及和发展。同年，田径成为现代奥林匹克运动会的核心比赛项目之一。
            </p>
          </div>
        </div>
        <div class="item" ref="item4Ref" data-text="规则和评分系统的改革">
          <div class="content">
            <img src="./images/img-track/historyBg4.svg" alt="" class="img" />
            <h2 class="content-title">1928--女子田径</h2>
            <p class="content-desc">
              1928年阿姆斯特丹奥运会，女子田径项目首次被纳入奥运会比赛，这标志着女子田径运动在国际体育界的认可和地位的提升。从此，女子田径项目在奥运会中的比重逐渐增加，推动了田径运动的性别平等。
            </p>
          </div>
        </div>
        <div class="item" ref="item5Ref" data-text="艺术体操项目的扩展和普及">
          <div class="content">
            <img src="./images/img-track/historyBg5.svg" alt="" class="img" />
            <h2 class="content-title">20世纪--发展</h2>
            <p class="content-desc">
              20世纪末至今，田径运动在全球范围内得到了广泛传播和深入发展。随着科技的发展，田径运动也经历了技术革新，例如使用电子计时器提高比赛成绩的精确度，以及引入高科技运动装备提升运动员的表现。此外，田径赛事的国际化程度不断提高，世界田径锦标赛等赛事成为全球关注的焦点。
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
    background-image: url(./images/img-track/historyBg1.svg)!important;
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