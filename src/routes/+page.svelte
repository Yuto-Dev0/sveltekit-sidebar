<script>
    import { fade } from "svelte/transition";
    let innerWidth = 0
</script>
<svelte:window bind:innerWidth/>
{#if innerWidth!=0}
<main in:fade={{delay:100,duration:100}} class="main">
<p>
    Portfolio Desu
</p>
</main>
{/if}

<style lang="postcss">
    .main{
        @apply bg-slate-400
    }
</style>