<template>
    <div class="wave">
        <!-- --d1、--d2是CSS的自定义属性，这里用来设置动画延迟 -->
        <div style="--d1:-0.5s; --d2:-3.5s;"></div>
        <div style="--d1:-1s; --d2:-4s;"></div>
        <div style="--d1:-1.5s; --d2:-4.5s;"></div>
        <div style="--d1:-2s; --d2:-5s;"></div>
        <div style="--d1:-2.5s; --d2:-5.5s;"></div>
        <div style="--d1:-3s; --d2:-6s;"></div>
        <div style="--d1:-3.5s; --d2:-6.5s;"></div>
        <div style="--d1:-4s; --d2:-7s;"></div>
        <div style="--d1:-4.5s; --d2:-7.5s;"></div>
        <div style="--d1:-5s; --d2:-8s;"></div>
        <div style="--d1:-5.5s; --d2:-8.5s;"></div>
        <div style="--d1:-6s; --d2:-9s;"></div>
        <div style="--d1:-6.5s; --d2:-9.5s;"></div>
        <div style="--d1:-7s; --d2:-10s;"></div>
        <div style="--d1:-7.5s; --d2:-10.5s;"></div>
        <div style="--d1:-8s; --d2:-11s;"></div>
        <div style="--d1:-8.5s; --d2:-11.5s;"></div>
        <div style="--d1:-9s; --d2:-12s;"></div>
        <div style="--d1:-9.5s; --d2:-12.5s;"></div>
        <div style="--d1:-10s; --d2:-13s;"></div>
        <div style="--d1:-10.5s; --d2:-13.5s;"></div>
        <div style="--d1:-11s; --d2:-14s;"></div>
        <div style="--d1:-11.5s; --d2:-14.5s;"></div>
        <div style="--d1:-12s; --d2:-15s;"></div>
        <div style="--d1:-12.5s; --d2:-15.5s;"></div>
        <div style="--d1:-13s; --d2:-16s;"></div>
        <div style="--d1:-13.5s; --d2:-16.5s;"></div>
        <div style="--d1:-14s; --d2:-17s;"></div>
        <div style="--d1:-14.5s; --d2:-17.5s;"></div>
        <div style="--d1:-15s; --d2:-18s;"></div>
        <div style="--d1:-15.5s; --d2:-18.5s;"></div>
        <div style="--d1:-16s; --d2:-19s;"></div>
        <!-- 这里我是32个div -->
    </div>
</template>
<style scoped>
*{
    margin: 0;
    padding: 0;
}
.wave{
    /* 弹性布局 */
    display: flex;
    /* 设置投影 */
    filter: drop-shadow(120px 0 0 rgba(149,191,218,0.5));
    position: absolute;
    bottom: 0;
}
.wave div{
    position: relative;
    width: 40px;
    height: 200px;
    margin: 10px;
    border-radius: 3px;
    overflow: hidden;
}
.wave div::before{
    content: "";
    width: 300%;
    height: 100%;
    background-color: rgba(149,191,218,1);
    position: absolute;
    left: -100%;
    top: 50%;
    /* 执行动画：动画名 时长 贝塞尔曲线 无限播放 来回轮流播放 */
    animation: upDown 2s cubic-bezier(0.445, 0.05, 0.55, 0.95) infinite alternate, wave 2s cubic-bezier(0.445, 0.05, 0.55, 0.95) infinite alternate;
    /* 通过var函数调用自定义属性--d1、--d2，设置动画延迟 */
    animation-delay: var(--d1), var(--d2);
}

/* 定义动画 */
@keyframes upDown {
    0%{
        top: 70%;
    }
    100%{
        top: 30%;
    }
}
@keyframes wave {
    0%{
        transform: rotateZ(-20deg);
    }
    100%{
        transform: rotateZ(20deg);
    }
}
</style>
