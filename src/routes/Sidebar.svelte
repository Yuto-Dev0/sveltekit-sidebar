<script>
    
    import { fade, fly } from 'svelte/transition'
    import SelfIntro from './Self_Intro.svelte';
    const urls = [
        {url: ".", name: "Portfolio"},
        {url: "contact", name: "Contact"},
    ]

    let toggle = true
    let iconToggle = !toggle
    function visibilityToggle(){
        toggle = !toggle
        if(iconToggle){
            iconToggle = false;
        }
        else {
            setTimeout(() =>{
                iconToggle = true
            },50)
        }
    }
</script>

{#if !toggle && iconToggle}
<a href="#nav"  on:click={visibilityToggle}>
<div in:fade="{{duration:100}}" class="sidebar_button"><svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
  </svg>
</div>  
</a>
{/if}

{#if (toggle && !iconToggle)}
    <nav class="navmain" in:fly="{{x:-200, duration:300}}" out:fly="{{x:-200, duration:300}}">
        
        <a href="#0" on:click={visibilityToggle}>
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="close_button">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
          </svg>
        </a>
        <br><br>
        <SelfIntro />
        {#each urls as url}
            <li class="sidebar-host">
                <a href="{url.url}"><span class="clickable">{url.name}</span></a>
            </li>
        {/each}
    
    </nav>
    {/if}

<style lang="postcss">

    .close_button{
        @apply left-8 w-10 mt-8 float-left absolute transition-all duration-700 hover:-translate-y-1
    }

    .sidebar_button{
        @apply p-8 float-left transition-all duration-700 hover:-translate-y-1
    }

    .navmain{
        @apply relative bg-slate-100 w-[25rem] float-left border-gray-950 border-l-2 border-r-2 border-opacity-30 min-h-screen px-28 shadow-xl 
    }

    .sidebar-host{
        @apply 
        list-none
        transition-all hover:translate-x-[4px] hover:border-slate-400 hover:border-l-blue-600 hover:bg-white
        font-bold 
        border-zinc-500 border-2 border-l-cyan-950 border-l-4
        drop-shadow-xl 
        w-[100%] p-0 my-6
    }

    .sidebar-host .clickable{
        @apply 
        font-mono
        block 
        text-center 
        text-lg
        py-3
        m-0
        w-full h-full ;
    }
</style>