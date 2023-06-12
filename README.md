# teampig

## :file_folder: 프로젝트 소개
 맛집 추천 및 검색 사이트입니다. 
 
***
## :computer: 개발 환경
<img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">  <img src="https://img.shields.io/badge/apachemaven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white">
<img src="https://img.shields.io/badge/java-40AEF0?style=for-the-badge&logo=java&logoColor=white">
<img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white">
<img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
<img src="https://img.shields.io/badge/mybatis-4479A1?style=for-the-badge&logo=mybatis&logoColor=white">
<img src="https://img.shields.io/badge/apachetomcat-F8DC75?style=for-the-badge&logo=Apache_Tomcat&logoColor=white">
<img src="https://img.shields.io/badge/navercloud-03C75A?style=for-the-badge&logo=naver&logoColor=white">

***

##  :hourglass:  개발 기간
 2023.4.27  ~  2023.5.22
 
***



## :smiley: 멤버 구성
|이름|기능|
|---|---|
**김성학**|사용자 맞춤 추천 기능 , 검색 기능 , 일반 유저 마이페이지 , 즐겨찾기|
**김형민**|프론트 총괄 , 메뉴얼 페이지 , 메인 페이지|
**조경철**|입장페이지 , 질문게시판|
**김동호**|게시글 작성 및 수정 페이지 , GPT를 이용한 홍보글 작성 , 회원가입|
**전세진**|로그인 페이지 , 디테일 페이지 , 리스트 페이지 , 지도 기능|
**이수연**|예약 기능 , 쿠폰 기능 , 사장님 마이페이지|
***

## :exclamation: 페이지별 기능

- 입장
    - 기본적인 회원가입, 로그인을 할 수 있는 페이지입니다
    - 네이버와 카카오 로그인 API를 이용해서 보다 간편하게 저희 페이지의 사용자가 되실 수 있습니다
    - 회원가입시 사장님과 일반 소비자를 구분해서 회원가입을 합니다.

- 비즈니스
    - 전반적인 저희 페이지의 소개를 담당하는 곳으로 일반 이용자와 사장님의 관점에서 저희 페이지만의 장점과 특색을 살펴보실 수 있습니다
- 메인
    - 네비게이션 바를 이용해 추천맛집, 인기맛집, 사이트 소개, 마이페이지로 이동할 수 있습니다. 
      - 개인 히스토리를 바탕으로 한 추천 기능
      - 평점, 리뷰, 즐겨찾기 순 인기 맛집 추천 기능


- 검색페이지
    - 전체 음식점에 대한 검색을 할 수 있는 페이지입니다
    - 사용자가 원하는 정보를 쉽게 얻을 수 있도록 여러 기능을 담았습니다
        - 다양한 조건의 필터링 기능
            
            (가격, 즐겨찾기, 리뷰, 평점순)
            
        - 네이버 지도 API를 활용해서 검색 결과 지도에 표시
        - 키워드 검색 기능
- 상세페이지
     - 해당 음식점의 정보와 리뷰, 주변 인기 식당을 볼 수 있습니다.
- 일반사용자 페이지
    - 계정내에서 작성한 리뷰글이나 즐겨찾기에 대한 관리를 할 수 있습니다
        - 상세페이지에서 작성한 리뷰목록 확인
        - 즐겨찾기 목록 출력 및 해제 기능
- 사장 마이페이지
     - 가게 정보를 등록 후, 사장 마이페이지에 들어가면 사장님은 가게 정보와 등록된 사진, 예약 수, 리뷰 수를 확인할 수 있습니다.
        - Chat gpt를 이용한 홍보글
         
             Chat got api를 활용해 몇 가지 키워드를 넣으면 가게 홍보글을 쉽게 작성하고 수정할 수 있습니다. 외국인에게 어필하고 싶은 맛집이라면 원하는 국가의 언어로도 작성할 수 있습니다.
        - 가게 정보 입력시 위도 경도 변환
          
             NCloud Geocoding api를 활용해 주소를 입력하면 위도, 경도까지 저장돼 지도로 위치를 확인할 수 있습니다.
        - 쿠폰 관리
          
             사장님이 쿠폰 등록을 한 경우 상세 보기 페이지에서 일반 사용자가 쿠폰을 가져갈 수 있습니다. 이때 쿠폰 관리 페이지에서 쿠폰의 남은 시간 및 수량이 확인 가능합니다. 
        - 예약 관리
          
             상세 보기 페이지에서 일반 사용자가 예약을 한 경우, 사장님은 예약 관리 페이지에서 시간을 확인하고 취소하거나 변경할 수 있습니다.
        - 리뷰 관리
          
             상세 보기 페이지에서 작성된 리뷰 중 악의적인 내용들은 삭제할 수 있는 기능을 제공하고 있습니다. 
        
- 질문게시판
    - 홈페이지 전역에서 작동하는 챗봇이외에도 좀더 상세한 질문을 할 수 있도록 질문게시판 구성
    - 사용자가 질문글을 작성하면 관리자가 답글로 도움을 주는 공간입니다
    - 비밀글 처리로 자유롭게 질문할 수 있습니다



