document.querySelector("iframe").addEventListener("mouseover", function() {
    this.style.width = "200%";
    this.style.height = "200%";
    this.style.top = "-25%";
    this.style.left = "-25%";
});
    document.querySelector("iframe").addEventListener("mouseout", function() {
    this.style.width = "200%";
    this.style.height = "200%";
    this.style.top = "0";
    this.style.left = "0";
});