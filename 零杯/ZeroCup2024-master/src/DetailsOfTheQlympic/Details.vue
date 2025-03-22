<template>
   <div class="container">
    <div class="carousel">
        <div class="Slides">
                <img src="./images/img1.png" alt="Slide 1">
                <img src="./images/img2.png" alt="Slide 2">
                <img src="./images/img3.png" alt="Slide 3">
                <img src="./images/img4.png" alt="Slide 4">
                <img src="./images/img5.png" alt="Slide 5">
        </div>
        </div>
       
    
    <div class="project">
      <div class="project-tab">
        <RouterLink to="/homepage"><div><button class="returnBtn"><img src="./icons/return.png" alt=""></button></div></RouterLink>  
        <div class="title"><img src="./icons/title1.png" alt=""></div>
       <div class="returnBtn" ></div>
      </div>
       <div class="drops">
           <RouterLink to="/Details/Pingpong"><div class="drop" style="--index: 0; border-radius: 57% 43% 43% 57% / 43% 43% 57% 57;">
              <div class="content" id="first"></div>
              <span>乒乓球</span>
            </div></RouterLink> 

            <RouterLink to="/Details/Swim"><div class="drop" style="--index: 1; border-radius: 73% 27% 59% 41% / 57% 59% 41% 43;">
                 <div class="content" id="second"></div>
                 <span>游泳</span>
            </div></RouterLink> 
            <RouterLink to="/Details/Track"><div class="drop" style="--index: 2; border-radius: 35% 65% 31% 69% / 57% 59% 41% 43;">
                  <div class="content" id="third"></div>
                  <span>田径</span>
            </div></RouterLink> 
       </div> 
       <div class="drops">
           <RouterLink to="/Details/Badminton"><div class="drop" style="--index: 0; border-radius: 57% 43% 43% 57% / 43% 43% 57% 57;">
                <div class="content" id="forth"></div>
                <span>羽毛球</span>
            </div></RouterLink> 
            <RouterLink to="/Details/Gymnastics"><div class="drop" style="--index: 1; border-radius: 73% 27% 59% 41% / 57% 59% 41% 43;">
                 <div class="content" id="fifth"></div>
                 <span>艺术体操</span>
            </div></RouterLink> 
            <RouterLink to="/Details/Shoot"><div class="drop" style="--index: 2; border-radius: 35% 65% 31% 69% / 57% 59% 41% 43;">
                  <div class="content" id="sixth"></div>
                 <span>射击</span>
            </div></RouterLink> 
       </div> 
    </div>
   </div> 
        
</template>



<script lang="ts">
import { defineComponent } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import {RouterLink} from 'vue-router'

export default defineComponent({
  name: 'Details',
  setup() {
    window.scrollTo(0, 0); // 页面滚动到顶部
    const router = useRouter();

    const goToPingpangDetail = () => {
      router.push('/Details/Pingpong');
    };

    const goToGymnastics = () => {
      router.push('/Details/Gymnastics');
    };

  

    // Return all functions in a single object
    return {
      goToPingpangDetail,
      goToGymnastics,
   
    };
  }
});
</script>



<style scoped>
.drops {
  width:100vw;
  display:flex;
  justify-content: space-around;
  align-items: center;
  margin:5vw 0;
}
.drops .drop{
  position: relative;
  width: 20vw;
  height: 20vw;
  box-shadow: inset 20px 20px 20px rgba(0, 0, 0, .05),
              25px 35px 20px rgba(0, 0, 0, .05),
              25px 30px 30px rgba(0, 0, 0, .05),
              inset -20px -20px 25px rgba(255, 255, 255, 0.9);
  transition: 0.5s ease-in-out;
  display: flex;
  justify-content: center;
  animation: changeShape 4s linear infinite;
  animation-delay: calc(var(--index) * 0s);

}

@keyframes changeShape {
    0% {
        border-radius: 57% 43% 43% 57% / 43% 43% 57% 57%;
    }
    25% {
        border-radius: 73% 27% 59% 41% / 57% 59% 41% 43%;
    }
    50% {
        border-radius: 35% 65% 31% 69% / 57% 59% 41% 43%;
    }
    75% {
        border-radius: 47% 53% 48% 52% / 68% 30% 70% 32%;
    }
    100% {
        border-radius: 57% 43% 43% 57% / 43% 43% 57% 57%;
    }
} 
.drops .drop .content{
  position:absolute;
  top:6vw;
  left:8vw;
  width:7vw;
  height:7vw;
  margin-bottom:10vw;
  /* background-size: cover; */
  background-repeat: no-repeat; 
}
#first{
  background-image: url('./icons_/icon1.svg');
}
#second{
  background-image: url('./icons_/icon2.svg');
}
#third{
  background-image: url('./icons_/icon3.svg');
}
#forth{
  background-image: url('./icons_/icon4.svg');
}
#fifth{
  background-image: url('./icons_/icon5.svg');
}
#sixth{
  background-image: url('./icons_/icon6.svg');
}
.drops .drop::before{
  content: '';
  position: absolute;
  top:4vw;
  left: 5vw;
  width: 2vw;
  height: 2vw;
  background-color: #fff;
  border-radius: 50%;
  opacity: 0.8;
}
.drops .drop::after{
  content: '';
  position: absolute;
  top: 6vw;
  left: 7vw;
  width: 1vw;
  height: 1vw;
  background-color: #fff;
  border-radius: 50%;
  opacity: 0.9;
}
@font-face {  
    font-family: 'MyCustomFont'; /* 自定义字体名称 */  
    src: url('./font/寒蝉团圆体/ChillReunion_Round.otf') format('opentype'); /* 字体文件路径和格式 */  
    font-weight: normal; /* 字体粗细 */  
    font-style: normal; /* 字体样式 */  
}  

.drops .drop span{
  position:absolute;
  font-size:2vw;
  top:14vw;
  display:block;
  color:#004793;
  font-family: 'MyCustomFont', sans-serif; /* 在页面中使用自定义字体 */  
}
@keyframes rubberBand {
  from {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }

  30% {
    -webkit-transform: scale3d(1.25, 0.75, 1);
    transform: scale3d(1.25, 0.75, 1);
  }

  40% {
    -webkit-transform: scale3d(0.75, 1.25, 1);
    transform: scale3d(0.75, 1.25, 1);
  }

  50% {
    -webkit-transform: scale3d(1.15, 0.85, 1);
    transform: scale3d(1.15, 0.85, 1);
  }

  65% {
    -webkit-transform: scale3d(0.95, 1.05, 1);
    transform: scale3d(0.95, 1.05, 1);
  }

  75% {
    -webkit-transform: scale3d(1.05, 0.95, 1);
    transform: scale3d(1.05, 0.95, 1);
  }

  to {
    -webkit-transform: scale3d(1, 1, 1);
    transform: scale3d(1, 1, 1);
  }
}
.animate__rubberBand {
  -webkit-animation-name: rubberBand;
  animation-name: rubberBand;
}
.drops .content:hover {
  animation: rubberBand 1s ease-in-out 1;
}
.drops span:hover {
  animation: rubberBand 1s ease-in-out 1;
}






* {
  
    margin:0;
    padding:0;
    list-style:none;
}
html {
  overflow-y: scroll; 
  scrollbar-width: none; 
}
.container {
  position:relative;
  width:100%;
  height:210vh;
  
  background-color: #87CBFF;
 
}
.carousel {
    width:100vw;
  
    margin: 0 auto;
    overflow:hidden;
    position:relative;
}
.Slides {
    display: flex;
    width:500%;
    animation:slide 15s infinite;
}
.Slides img{
    width:20%;
}
@keyframes slide {
  0%, 20% {
    transform: translateX(0);
  }
  25%, 40% {
    transform: translateX(-20%);
  }
  45%, 60% {
    transform: translateX(-40%);
  }
  65%, 80% {
    transform: translateX(-60%);
  }
  85%, 100% {
    transform: translateX(-80%);
  }
}

/* 第二个部分 */


.project {
    width:100%;
    top:75vh;
    border-top-left-radius: 5vw;
    border-top-right-radius: 5vw;
    position:absolute;
    background-color:  #87CBFF;
    z-index: 1;
}
.project-tab{
  display:flex;
  padding:5vw;
  
  justify-content:space-between;
  
}
.returnBtn {
  width:5vw;
  height:5vw;
  background-color: rgba(0,0,0,0);
  border:0;
}
.title{
  width:26vw;
  height:5vw;
  text-align:center;
}
.title img {
  width:100%;
  
}

</style>