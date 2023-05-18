$(document).ready(function() {
    var r_slideIndex = 0;
    var l_slideIndex = 0;

    show_r_Slides();
    show_l_Slides();

    function show_r_Slides() {
        var i;
        var r_slides = $(".bg_r_img, div.j_enter_bg_r_img video");
        for (i = 0; i < r_slides.length; i++) {
            r_slides[i].classList.remove("active");
        }

        r_slideIndex++;
        if (r_slideIndex > r_slides.length) {r_slideIndex = 1}

        r_slides[r_slideIndex-1].classList.add("active");

        if (r_slides[r_slideIndex-1].tagName === "VIDEO") {
            r_slides[r_slideIndex-1].currentTime = 0;
            r_slides[r_slideIndex-1].play();
        }

        setTimeout(show_r_Slides, 14000); // 이미지와 동영상이 변경되는 시간 설정
    }

    function show_l_Slides() {
        var i;
        var l_slides = $(".bg_l_img, div.j_enter_bg_l_img video");
        for (i = 0; i < l_slides.length; i++) {
            l_slides[i].classList.remove("active");
        }

        l_slideIndex++;
        if (l_slideIndex > l_slides.length) {l_slideIndex = 1}

        l_slides[l_slideIndex-1].classList.add("active");

        if (l_slides[l_slideIndex-1].tagName === "VIDEO") {
            l_slides[l_slideIndex-1].currentTime = 0;
            l_slides[l_slideIndex-1].play();
        }

        setTimeout(show_l_Slides, 14000); // 이미지와 동영상이 변경되는 시간 설정
    }
});


