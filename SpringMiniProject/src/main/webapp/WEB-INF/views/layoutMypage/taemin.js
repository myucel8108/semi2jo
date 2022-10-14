setInterval(blink, 500);
let target = document.querySelector("#dynamic");
function blink(){
    target.classList.toggle("active");

}
let horizontalUnderLine = document.getElementById("horizontal-underline");
let horizontalMenus = document.querySelectorAll("nav2:first-child a");

