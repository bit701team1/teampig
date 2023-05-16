// 1. 메인 이미지 사진에 버튼을 활성화하여 작동 시키는 방법
// var slides = document.querySelectorAll("#slides > img");
// var prev = document.getElementById("prev");
// var next = document.getElementById("next");

// var current = 0;

// showSlides(current);
// prev.onclick = prevSlide;
// next.onclick = nextSlide;

// function showSlides(n) {
//     for (var i=0; i <slides.length; i++){
//         slides[i].style.display = "none";
//     }
//     slides[n].style.display = "block";
// }

// function prevSlide(){
//     if(current > 0) current -= 1;
//     else current = slides.length - 1;
//         showSlides(current);
// }

// function nextSlide(){
//     if(current < slides.length - 1) current += 1;
//     else current = 0;
//         showSlides(current);
// }

// 2. 사장님페이지 사진이 자동으로 변경되게 하는 방법
var current = 0;
showSlides();

function showSlides() {
    var slides = document.querySelectorAll("#slides > img");

    for (let i = 0; i < slides.length; i++) {
        slides[i].classList.remove("active");
    }

    current++;

    if (current > slides.length) {
        current = 1;
    }

    slides[current - 1].classList.add("active");
    setTimeout(showSlides, 2000);
}

// 3. 플로팅 버튼이 각 요소로 이동하는 기능
window.addEventListener('DOMContentLoaded', function() {

    // 모든 버튼 요소 가져오기
    var buttons = document.querySelectorAll('.remote-btn');

    // 버튼 요소에 이벤트 추가
    buttons.forEach(function(button) {
        button.addEventListener('click', function() {

            // 클릭한 버튼의 data-target 속성값 가져오기
            var targetId = this.getAttribute('data-target');

            // data-target 속성값을 사용하여 해당 요소 가져오기
            var targetElement = document.querySelector(targetId);

            // 해당 요소의 위치로 스크롤 이동
            window.scrollTo({
                top: targetElement.offsetTop,
                behavior: 'smooth'
            });
        });
    });

    // 3-1.스크롤 이벤트 추가
    window.addEventListener('scroll', function() {

        // 스크롤 위치가 800 이상일 때만 remote를 보이도록 함
        if (window.scrollY >= 800) {
            document.querySelector('.remote').style.display = 'block';
        } else {
            document.querySelector('.remote').style.display = 'none';
        }

        // 스크롤 위치에 따라 버튼 색상 변경
        buttons.forEach(function(button) {
            var targetId = button.getAttribute('data-target');
            var targetElement = document.querySelector(targetId);

            // 현재 스크롤 위치가 해당 요소보다 위에 있으면 버튼 색상을 변경
            if (window.scrollY < targetElement.offsetTop) {
                button.classList.remove('active');
            } else {
                button.classList.add('active');
            }
        });
    });
});