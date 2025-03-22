<template>
    <div class="shell" id="shell" ref="shellRef">
      <div class="header">
        <img src="./images/img-shoot/history.svg" alt="" />
      </div>
      <div class="timeline">
        <div class="item" ref="item1Ref" data-text="艺术体操的起源">
          <div class="content">
            <img src="./images/img-shoot/historyBg1.svg" alt="" class="img" />
            <h2 class="content-title">中世纪--起源</h2>
            <p class="content-desc">
              射击运动的历史可以追溯到中世纪，当时射击主要是作为一种生存技能和军事训练手段。随着火器的发展，射击技能逐渐成为一种竞技活动。最早的射击比赛可能是在瑞士和德国等地的民间活动中自发形成的，人们使用各种早期的火枪进行射击比赛。
            </p>
          </div>
        </div>
        <div class="item" ref="item2Ref" data-text="国际艺术体操联合会的成立">
          <div class="content">
            <img src="./images/img-shoot/historyBg2.svg" alt="" class="img" />
            <h2 class="content-title">1896--成为奥运项目1907--成立协会</h2>
            <p class="content-desc">
              射击运动在1896年首届现代奥林匹克运动会上就被列为正式比赛项目，这标志着射击运动在国际体育界的重要地位。奥运会射击比赛包括多个不同的射击项目，如手枪、步枪和飞碟射击等。
            </p>
          </div>
        </div>
        <div class="item" ref="item3Ref" data-text="艺术体操成为奥运会正式比赛项目">
          <div class="content">
            <img src="./images/img-shoot/historyBg3.svg" alt="" class="img" />
            <h2 class="content-title">1907--成立协会</h2>
            <p class="content-desc">
              1907年，国际射击运动联合会（ISSF）在瑞士成立，这是射击运动历史上的一个重要时刻。ISSF的成立标志着射击运动开始向国际化和规范化方向发展。同年，举办了第一届国际射击比赛，为后来世界射击锦标赛的举办奠定了基础。
            </p>
          </div>
        </div>
        <div class="item" ref="item4Ref" data-text="规则和评分系统的改革">
          <div class="content">
            <img src="./images/img-shoot/historyBg4.svg" alt="" class="img" />
            <h2 class="content-title">1984--中国射击崛起</h2>
            <p class="content-desc">
              艺术体操的规则和评分系统经历了重大改革，引入了难度系数和艺术表现分的概念，使得比赛更加公正和透明。这些改革促进了艺术体操技术的发展，提高了比赛的观赏性。
            </p>
          </div>
        </div>
        <div class="item" ref="item5Ref" data-text="艺术体操项目的扩展和普及">
          <div class="content">
            <img src="./images/img-shoot/historyBg5.svg" alt="" class="img" />
            <h2 class="content-title">21世纪--发展</h2>
            <p class="content-desc">
              进入21世纪，射击运动在技术和规则上不断发展和创新。例如，引入了电子靶记分系统，提高了比赛的精确度和公正性。同时，射击项目的多样性也得到了增强，女子射击项目在奥运会中的比重逐渐增加，促进了性别平等在射击运动中的体现。
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
    background-image: url(./images/img-shoot/historyBg1.png)!important;
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