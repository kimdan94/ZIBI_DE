<h1 align="left">ZIBI Project</h1>

###
- 프로젝트 기간 : 2024년 1월 10일 ~ 2024년 2월 14일



<h3 align="left">1. 기획 스케치</h3>
<hr>


<h4 align="left">1) 기획 의도</h4>

###

<p align="left">2023년 기준 우리나라 1인 가구 수는 750만 명으로 무려 35%를 차지하고 있다고 합니다.<br>1인 가구 자취인들에게 세분화된 자취 기능들을 한 데 모은 플랫폼이 필요하다고 생각했고. <br>총 6개의 서비스를 제공하는 플랫폼을 만들게 되었습니다.</p>

###

<h4 align="left">2) 기획 단계</h4>

- **요구사항 정의서**
  - Word를 활용하여 구현하려는 기능들을 기반으로 웹사이트에 필요한 기능을 구체적으로 나열했습니다.
  ![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/27fee5d0-dd62-42d7-b86b-1f4a0a8a03e7)
- **테이블 설계서**
  - Excel를 활용하여 구현하려는 기능들을 기반으로 필요한 테이블을 만들었습니다.
![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/3e496869-d468-423a-9c03-73d715279bce)
- **UML&ERD 작성**
  - StarUml을 활용하여 구현하려는 기능들을 기반으로 데이터를 구조화하였습니다.
![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/b205891e-918a-4839-86ae-7fbe69ecea02)

<h4 align="left">3) 협업 과정</h4>
세미 프로젝트를 진행하면서 깃충돌 이슈와 같은 문제가 종종 있었기에, 프로젝트를 진행함에 있어 팀원들간의 의사소통이 가장 중요하다고 생각했습니다.
<p></p>

- **디스코드를 활용해 중요 이슈를 공유하고, 테이블 및 개인 기능의 변동사항 또한 공유하도록 했습니다.**
- **카카오톡 단톡방을 활용해 깃허브의 이슈, 공동 파일에 대한 풀 리퀘를 실시간으로 공유했습니다**


<hr>

<h3 align="left">2. 프로젝트 소개</h3>

<h4 align="left">1) 개발 환경</h4>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/c55af302-80cb-4b50-aa00-918461b5bbcd)

<h4 align="left">2) 사용한 API</h4>

- **Daum 주소 서비스**
- **CKEditor**

<h4 align="left">3) 실행화면</h4>

<b>재능기부 메인 페이지</b>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/b1bb9905-fefa-4356-add6-fab1b16efd2d)<br>

- **상위 게시판 분류**
  - 헬프미, 헬프유 버튼 클릭 시 해당 게시판 글로 분류되어 목록에 보여짐

- **하위 카테고리 분류**
  -  벌레~기타 버튼 클릭 시 해당 카테고리 글로 분류되어 목록에 보여짐

- **제목, 내용, 제목+내용, 주소로 LIKE 검색**
  -  검색 결과에 따라 결과 다르게 처리됨

- **최신순, 조회수, 스크랩수에 따라 글 정렬**

- **페이지 처리**
  -  한 화면에 게시글 3개씩 표시됨

<br>
<b>글쓰기 페이지</b>
<p></p>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/b2824580-cf4d-4af5-abd8-392f8de9681b)<br>

- **등록 시 상세주소,썸네일 제외한 모든 항목에 입력 유효성 체크**

- **CK Editor로 이미지 첨부, 내용 작성 가능**
- **썸네일 파일 미첨부 시 기본 이미지 표시**

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/b6f4249b-bbdb-469f-a86e-15804917770f)<br>

- **Daum API 사용하여 주소 검색창 띄움**
  - 검색한 주소에 대한 지도 미리보기(마커 표시)
<br>

<b>글수정 페이지</b>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/e1bbe963-c313-4e4f-a91e-70ace77af0c4)<br>

- **작성했던 내용 미리보기 가능**

- **기존에 첨부한 썸네일 사진(파일) 삭제 가능**
  -  파일 삭제 후 수정된 글엔 미리보기 이미지로 표시됨
<br>

<b>글 상세</b>
<p></p>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/fb10004b-2793-4640-ab35-25b3d45480e1)


- **우측 사이드바 상단의 접속한 회원의 프로필 이미지 띄워짐**
  - 클릭 시 접속 회원의 오픈프로필 이동

- **Daum API로 글 작성 시 등록한 주소에 대한 지도 띄워짐**

- **스크랩은 토글 형태로 동작**

- **스크랩수, 댓글수, 조회수 하단에 명시됨**

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/0577aa22-a36e-4425-8d6e-53cd8c97f2eb)

- **작성자 본인의 댓글 수정, 삭제 가능**
  - 삭제된 댓글은 댓글수에 반영됨

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/c5499125-2ecc-463b-a48a-012b38b813d5)

- **내가 작성한 글의 경우 글수정, 글삭제, 나의 채팅방 버튼 노출**

- **글 삭제 버튼 클릭 시 confirm창 표시**
    - 글 삭제 시 해당 게시글의 댓글, 스크랩까지 모두 삭제됨

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/43c3530f-0ba7-4d4a-92ad-11f26ef19bc7)

- **내가 작성한 글의 경우 해결 중, 해결 완료 토글 노출**
  -  해결 중이 default 값
  -  해결 여부 변경 시 글 목록의 해결 여부도 같이 변경
<br>

<b>채팅</b>
<p></p>

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/2f24d63a-e45e-429d-86c5-3cdb528a8d35)

- **회원 닉네임 검색해서 채팅 멤버 추가 가능**
  - 선택했던 회원 삭제 가능

- **채팅방 이름 자동 생성 시 추가한 회원 닉네임이 나열되어 채팅방 이름 생성됨**
   (default 값이 자동생성 checkbox)

  - 자동생성 checkbox 해제 시 text로 채팅방 
   이름 변경 가능

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/5cdec75d-8092-4d73-8eba-2d985cf78cf8)

- **채팅 리스트에 채팅방 이름, 채팅 내용, 작성일, 읽지 않은 채팅수가 보여짐**

- **채팅하기 버튼 클릭 시 채팅방 페이지로 연결됨**

- **검색 버튼으로 채팅방 검색 가능**

![image](https://github.com/kimdan94/ZIBI_DE/assets/123554665/07598e4e-c940-4360-af47-bdd1d9d116e4)

- **글 작성자와 댓글 작성자들 사이의 1:N 채팅**
 
- **채팅 메시지 하단에 읽지 않은 채팅수가 보여짐**
  - 모두 읽은 채팅은 ‘읽음＇으로 표시됨

- **WebSocket 사용하여 구현**

- **채팅방 입장 시 초대문구와 함께 채팅방 생성됨**

- **채팅방 이름 변경 버튼으로 채팅방 이름 변경 가능**

