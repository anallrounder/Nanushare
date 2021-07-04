 
![nanulogo_new](https://user-images.githubusercontent.com/43713628/124374352-94f28a80-dcd5-11eb-9fac-66a491b711c2.png)
# 나누셰어 Nanushare 
## 기획의도

- 생필품을 필요로 하는 이웃에게 기부를 통해 일상생활이 편리해지도록 돕고자 **작은것부터 나누기 시작하자**는 기부 문화를 만들어 나가기 위해서 공유 플랫폼을 기획하게 되었습니다.
- 누구든지 쉽게 나눔을 받을 수 있도록 **접근성과 편의성을 고려**해 지하철역 위주로 나눔자판기를 배치하고 지도에서 실시간으로 잔여수량을 확인할 수 있도록 했습니다.
<br/>

## 기간

2021.03.02 ~ 2021.05.07  
<br/>

## 개발 환경

![나누셰어-Project-최종ppt-0505_페이지_09](https://user-images.githubusercontent.com/43713628/124374120-93c05e00-dcd3-11eb-9666-f7e9e9035336.jpg) 
![나누셰어-Project-최종ppt-0505_페이지_10](https://user-images.githubusercontent.com/43713628/124374122-958a2180-dcd3-11eb-93b5-b176971c1af4.jpg)

## ERD

![erd](https://user-images.githubusercontent.com/43713628/124374204-3e388100-dcd4-11eb-880a-8960ae63c0ae.png)

## 나의 역할

- 회원이 물품을 기부하기전에 물품, 수량을 선택해 신청하는 페이지를 구현했습니다.

- 회원이 획득한 포인트를 기부할수 있는 페이지를 구현했습니다.
  
- 회원이 기부하거나 나눔을 받은것을 공유하는 나눔게시판 페이지를 구현했습니다.
  - 동적 SQL을 활용한 검색기능 구현
  - 페이징 구현
  - CKEditor4를 활용한 글작성 페이지 구현
  - 이미지 업로드 공동 구현
  - 변동사항을 바로 확인할 수 있도록 Ajax활용한 비동기 처리 구현
  
- 우측 사이드에 최근 글을 볼수있는 바로가기 목록을 모듈화하여 구현했습니다.
  
- 프로젝트 디자인, 기능 통일을 위한 CSS 수정작업을 진행했습니다.
 
<hr>

### 물품 나눔

가입한 회원이 <u>기부할 물품과 수량을 선택</u> 하여 오늘 날짜로 물품나눔 <u>신청서를 작성</u> 할 수 있도록 했습니다. 기부 내역을 DB에 저장하여 회원이 마이페이지에서 확인 가능하고, 관리자도 확인할 수 있도록 했습니다.

### 돈기부여 (포인트 나눔)

가입한 회원이 출석체크, 게임 등을 통해 모은 <u>포인트를 나눔</u>할 수 있도록 했습니다. <u>변동 내역을 DB에 저장</u>하여 마이페이지에서 기부내역 및 포인트 정보를 확인할 수 있도록 했습니다.

### 인증 게시판 & aside 바로가기 목록

![화면 캡처 2021-07-03 154905](https://user-images.githubusercontent.com/43713628/124374445-311c9180-dcd6-11eb-8f0e-d3fc6384515d.png)  <br/>
![화면 캡처 2021-07-03 155135](https://user-images.githubusercontent.com/43713628/124374447-3548af00-dcd6-11eb-8d7a-961f2bd17fda.png)  <br/>


- 작성자, 제목, 글내용으로 검색할 수 있도록 <u>검색기능을 동적 SQL을 통해 구현</u>했습니다.
- 게시판의 <u>페이징 기능을 구현</u>했습니다.
- 글쓰기, 글 읽기, 글 수정, 글 삭제 <u>(CRUD)를 구현</u>했습니다.
- <u>CKEditor4 API를 활용</u>해 게시글 내용 입력을 할 수 있도록 구현했습니다.  (이미지 업로드도 가능)
- 글작성, 글 수정, 댓글 작성, 수정, 삭제 내역을 바로 확인하게 할 수 있도록 <u>ajax를 활용해 비동기로 구현</u>했습니다.
- <u>이미지 업로드 기능</u>을 팀원과 공동으로 구현했습니다.
- 1:1문의 게시판과 공지사항 게시판도 위의 기능을 바탕으로 구현되었습니다.
- 게시판, 공지사항의 최신글을 바로 확인할 수 있도록 오른쪽 사이드 바에 기능을 추가했습니다.
  
### CSS 수정 및 추가

  기존 부트스트랩 css코드에서 통일성 있는 웹페이지 디자인을 위해 코드 색상 및 기능 통일을 위한 작업들을 진행했습니다.
  <br/>

## 링크 (수정중)

- [프로젝트 일정표](https://docs.google.com/spreadsheets/d/1ME5_bBikOx7_cQHwPiANDGv5_HBU7tCQ_JnezfY6In8/edit#gid=0)
- [요구사항 명세서](https://docs.google.com/spreadsheets/d/1ME5_bBikOx7_cQHwPiANDGv5_HBU7tCQ_JnezfY6In8/edit#gid=639719371)
- [데이터베이스 설계서](https://docs.google.com/presentation/d/1SpSda-RYgJhQMHcwP1t0frVp4RSlrN8r_riUHj3Gxvg/edit?usp=sharing)
- [소프트웨어 설계서](https://docs.google.com/presentation/d/1Lt8Qmjtl40dYusTRCoMX1R4KuWMoXd4X07D4pi5ZFZA/edit#slide=id.p)
- [화면 설계서](https://documentcloud.adobe.com/link/track?uri=urn:aaid:scds:US:9dcac066-eef4-4b5d-9f68-3fcd91389ca6)
- [테스트 문서](https://docs.google.com/presentation/d/1dbqVaYyNHt3PsqDUZKz1kVKeShTPsPwaOvBca1moK5A/edit#slide=id.gd083f20291_2_0)

## 조원 (깃허브)

- [심혜선](https://github.com/anallrounder)
- [이슬비](https://github.com/seulpi)
- [이희재](https://github.com/hjlee113)
- [위성일](https://github.com/castle1)
