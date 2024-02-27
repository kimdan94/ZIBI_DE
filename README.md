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

<hr>

<h3 align="left">3. 프로젝트 회고</h3>

<h4 align="left">1) 어제의 나보다 성장했다</h4>

나에게 첫 프로젝트였던 세미 프로젝트 때에는 지금 내 실력으론 CRUD 작업만으로도 벅차다고 생각했다. 그래서 기한 내에 내가 맡은 부분을 완성하지 못하여 함께 프로젝트를 진행하는 팀원들에게 피해가 가진 않을까 하는 걱정이 우선시 됐다. 걱정을 한 아름 안고 수업에서 배운 내용을 기반으로 할 수 있는 마이페이지 부분을 맡았었다. <BR>
그렇게 두 번째 프로젝트인 파이널 프로젝트를 진행하게 되었는데, 이번엔 걱정되더라도 CRUD는 물론이고 세미 때보다 좀 더 다양한 기능을 구현해 보고자 했다.
파이널 프로젝트인 만큼 다들 기능 구현에 욕심이 많았고, 게시판을 각기 맡아 진행하게 되었다. 나 또한 무료로 재능을 기부해 주는 게시판인 '재능기부' 게시판을 맡게 되었고, 만들고 싶은 기능들을 다양하게 기획했다.
코드를 작성함에 있어 가장 기본적인 CRUD 작업부터 시작했는데 내 스스로도 다른 팀원들에 비해 진행 속도가 더디다고 느꼈다. 세미 프로젝트를 진행할 때 CRUD만이라도 제대로 해볼 걸 하는 아쉬움이 들었다.  
다른 팀원들에 비해 더딘 속도 일진 모르나, 결과적으로 기한 내에 처음으로 나 혼자 게시판 하나를 만들어냈다.
세미 프로젝트 때 마이페이지를 만들면서도 무언가를 구현해낸다는 쾌감을 느꼈었는데, 내 스스로 게시판 하나를 만들고 나니 프로젝트를 진행한 기간 동안 받은 스트레스와 걱정이 한 번에 쓸려내려가듯 뿌듯함으로 가득했다.
프로젝트 기간 내내 어려운 기능도 척척 해내고 빠른 속도로 진행하는 팀원들을 보며 작아지는 순간이 많았지만, 남들과 비교하기보다 이전의 나와 비교했을 땐 분명 성장했기 때문에 이번 프로젝트 경험을 바탕으로 앞으로도 어제의 나보다 더 성장할 수 있는 개발자가 되고 싶다는 생각을 했다.

<h4 align="left">2) 선택과 집중</h4>

내가 맡은 게시판에 채팅 기능이 필요했고, 채팅 기능을 구현하기로 한 다른 팀원이 있었다. 프로젝트를 진행하는 도중 시간상 채팅 기능을 구현하기 어려울 것 같다고 하셨고, 나는 고민에 빠졌다.<br>
채팅 기능 대신 오픈 카카오톡 링크를 넣어둘까도 생각했지만, 내가 구현하려는 게시판 특성상 채팅이 가장 적합하다고 생각했다.<br>
예정에 없던 일이라 기한 내에 끝낼 수 있을지가 걱정스러웠지만 수업에서 배운 1:N 채팅을 구현해 보기로 했다.<br>
채팅을 만들던 도중 오류 나는 부분 때문에 강사님에게 질문을 했었는데, 그때 강사님께선 1:N 채팅이 아닌 1:1 채팅을 구현하라고 말씀해주셨다.<br>
그래서 구글링해서 이것저것 찾아보기도 했으나, 수업 때 배운 1:N 채팅과는 방식이 많이 달라 소요되는 시간도 길 것 같았고 구현해낼 수 있을지 모르겠다는 생각이 들었다.<br>
그렇게 고민에 고민을 반복하면서 1:N 채팅을 활용하는 방안으로 채팅을 만들어보려고도 하고 1:1 채팅을 만들어보려고도 했다.<br>
결과적으로 프로젝트 기한 내에 채팅 기능을 완성하지 못했다.<br><br>
이번 프로젝트에서 가장 아쉬운 점으로 꼽을 수 있는데, 채팅 기능을 완성하지 못한 가장 큰 이유는 확고한 선택을 한 번에 하지 못했기 때문이라고 생각한다.<br>
강사님께서 1:1 채팅 방법을 권유해 주신 것도, 내가 구현하려는 게시판 특성상 그게 더 적합하고 구현해 내는 과정 안에서 성장할 수 있을 거라 생각하셔서 권해주신 거였을 것이다.<br>
아예 시도를 안 해본 것은 아니지만, 시도하는 과정에서 어려운 점을 너무 혼자 해결하려고 했던 것 같다.<br>
그래서 1:N 채팅을 활용하는 방법도 시도해 보고 다시 1:1 채팅을 시도해 보고 하느라 시간만 흘러 결과물을 낼 수 없는 결론에 다다랐던 것 같다.<br>
어려운 문제에 있어 시도를 해본 경험은 좋았다고 생각하지만 시간이 한정되어 있을 땐 그 상황에 맞는 선택을 해야 할 필요가 있고, 너무 혼자 애쓰기보단 주변에 도움을 청하는 게 좀 더 좋은 결과를 가져다줄 것이라는 생각을 했다.




