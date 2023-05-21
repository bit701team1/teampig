window.addEventListener('scroll', function() {
    var navbar = document.querySelector('.navbar');
    var windowHeight = window.innerHeight;
    var documentHeight = document.body.clientHeight;
    var scrollPosition = window.pageYOffset;

    if (scrollPosition + windowHeight >= documentHeight) {
        navbar.classList.remove('sticky-top');
    } else {
        navbar.classList.add('sticky-top');
    }
});


//   검색창 자바스크립트 영역
/* 검색창 */
document.querySelector(".circle").addEventListener("click", () => {
    for (let i = 0; i <= 3; i++) {
        document
            .getElementsByClassName("nav-items")
            [i].classList.remove("show-menu");
        document
            .getElementsByClassName("box-line")
            [i].classList.remove("box-line-show");
    }
    document.querySelector(".box").classList.remove("box-show");
    document.querySelector(".add").classList.toggle("go");
    document.querySelector(".search").classList.toggle("search-focus");
    document.querySelector(".search").focus();
    document.querySelector(".circle").classList.toggle("color");
    document.querySelector(".line1").classList.toggle("move");
    document.querySelector(".line2").classList.toggle("mov");
    document.querySelector(".effect").classList.toggle("big");


});

/* 메뉴바 영역 */
document.querySelector(".menu").addEventListener("click", () => {
    for (let i = 0; i <= 3; i++) {
        document.querySelector(".box").classList.remove("box-show");
        document
            .getElementsByClassName("nav-items")
            [i].classList.toggle("show-menu");
        document
            .getElementsByClassName("box-line")
            [i].classList.remove("box-line-show");
    }
});

/* 박스 영역 */
document.querySelector(".gallery").addEventListener("click", () => {
    document.querySelector(".box").classList.toggle("box-show");
    for (let i = 0; i <= 3; i++) {
        document
            .getElementsByClassName("box-line")
            [i].classList.toggle("box-line-show");
        document
            .getElementsByClassName("nav-items")
            [i].classList.remove("show-menu");
    }
});

/*스크롤*/
document.addEventListener("DOMContentLoaded", function(event) {
    var elements = document.querySelectorAll(".scroll-page");

    function hideElement(element) {
        element.classList.add("hide");
    }

    function revealElement(element) {
        element.classList.remove("hide");
    }

    function handleScroll() {
        elements.forEach(function(element) {
            var elementTop = element.getBoundingClientRect().top;
            var windowHeight = window.innerHeight;

            if (elementTop < windowHeight * 0.8) {
                revealElement(element);
            } else {
                hideElement(element);
            }
        });
    }

    window.addEventListener("scroll", handleScroll);
    handleScroll();
});