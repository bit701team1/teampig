var current = 0;
var slides = document.querySelectorAll("#slides > img");
var totalSlides = slides.length;
var direction = 1; // 1: 오른쪽으로 이동, -1: 왼쪽으로 이동

showSlides();

function showSlides() {
    var slideTrack = document.getElementById('slides');
    slideTrack.style.transform = 'translateX(-' + (current * 831) + 'px)';

    if (current == totalSlides - 1) {
        direction = -1; // 마지막 이미지에 도착하면 왼쪽으로 이동
    } else if (current == 0) {
        direction = 1; // 첫번째 이미지에 도착하면 오른쪽으로 이동
    }

    current += direction;

    setTimeout(showSlides, 2000); // 2초마다 이미지를 변경합니다.
}
