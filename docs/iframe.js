window.addEventListener('DOMContentLoaded', (event) => {
    const iframes = document.getElementsByTagName("iframe");
    [...iframes].forEach( (iframe) => {
        iframe.onload = function(){
            iframe.style.height = iframe.contentWindow.document.body.scrollHeight  + "px";
        }    
    });    
})
