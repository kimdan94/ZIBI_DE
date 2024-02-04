$(function(){
	let rowCount = 10;
	let currentPage;
	let count;
	
	/*---------------------------
	 * 댓글 목록
	 *---------------------------*/
	//댓글 목록
	function selectList(pageNum){
		currentPage = pageNum;
		//로딩 이미지 노출
		$('#loading').show();
		
		$.ajax({
			url:'listReply',
			type:'post',
				//key		변수		key		변수			key		변수-태그에 있는 아이디를 불러옴
			data:{pageNum:pageNum,rowCount:rowCount,helper_num:$('#helper_num').val()},
			dataType:'json',
			success:function(param){
				//로딩 이미지 감추기
				$('#loading').hide();
				count = param.count;
				
				if(pageNum == 1){
					//처음 호출시는 해당 ID의 div의 내부 내용물을 제거
					$('#output').empty();
				}
				
				//1 읽어오기
				displayReplyCount(param);
				
				//댓글 목록 작업				item:한 건의 레코드
				$(param.list).each(function(index,item){
					let output = '<div class="item">';
					output += '<ul class="detail-info">';
					output += '<li>';
					output += '<img src="../member/viewProfile?mem_num='+item.mem_num+'" width="40" height="40" class="my-photo">';
					output += '</li>';
					output += '<li>';
					
					if(item.mem_nickname){
						output += item.mem_nickname + '<br>';
					}
					
					if(item.re_mdate){
						output += '<span class="modify-date">최근 수정일 : ' + item.re_mdate + '</span>';
					}else{
						output += '<span class="modify-date">최근 등록일 : ' + item.re_date + '</span>';
					}
					
					output += '</li>';
					output += '</ul>';
					output += '<div class="sub-item">';//\r이랑 \n을 발견하면 <br>로 바꾸겠다(줄바꿈 처리)
					output += '<p>' + item.re_content.replace(/\r\n/g,'<br>') + '</p>';
					
					if(param.user_num==item.mem_num){
						//로그인한 회원번호와 댓글 작성자 회원번호가 같으면
						output += ' <input type="button" data-num="'+item.re_num+'" value="수정" class="modify-btn">';
						output += ' <input type="button" data-num="'+item.re_num+'" value="삭제" class="delete-btn">';
					}
					
					output += '<hr size="1" noshade>';
					output += '</div>';//<div class="sub-item">닫는 대그
					output += '</div>';//<div class="item">닫는 태그
					
					//문서 객체에 추가
					$('#output').append(output);
					
				});//end of each
				
				//paging button 처리
				if(currentPage>=Math.ceil(count/rowCount)){
					//다음 페이지가 없음
					$('.paging-button').hide();
				}else{
					//다음 페이지가 존재
					$('.paging-button').show();
				}
				
			},
			error:function(){
				//로딩 이미지 감추기
				$('#loading').hide();
				alert('네트워크 오류 발생');
			}
		});//end of ajax
	}//end of selectList
	
	//다음 댓글 보기 버튼 클릭시 데이터 추가
	$('.paging-button input').click(function(){
		selectList(currentPage + 1);
	});
	
	/*---------------------------
	 * 댓글 등록
	 *---------------------------*/
	//댓글 등록
	$('#re_form').submit(function(event){
		//댓글 입력하지 않았을 때 알림
		if($('#re_content').val().trim()==''){
			alert('내용을 입력해주세요');
			$('#re_content').val('').focus();
			return false;
		}
		
		let form_data = $(this).serialize();
		//서버와 통신
		$.ajax({
			url:'writeReply',
			type:'post',
			data:form_data,
			dataType:'json',
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인 후 사용해주세요!');
				}else if(param.result == 'success'){
					//폼 초기화
					initForm();
					//댓글 작성이 성공하면 새로 삽입한 글을 포함해서 
					//첫번째 페이지의 게시글들을 다시 호출
					selectList(1);
				}
				
			},
			error:function(){
				alert('네트워크 오류');
			}
		});//end of ajax
		//기본 이벤트 제거
		event.prventDefault();
	})//end of submit
	
	//댓글 작성 폼 초기화
	function initForm(){
		$('textarea').val('');
		$('#re_first .letter-count').text('300/300');
	}
	
	/*---------------------------
	 * 댓글 수정
	 *---------------------------*/
	//댓글 수정 버튼 클릭시 수정폼 노출
	
	
	
	/*---------------------------
	 * 댓글 등록, 수정 공통
	 *---------------------------*/
	$(document).on('keyup','textarea',function(){
		//입력한 글자수 구하기
		let inputLength = $(this).val().length;
		
		if(inputLength>300){//300자 넘어선 경우
			$(this).val($(this).val().substring(0,300));
		}else{//300자 이하인 경우 남은 글자수 구하기
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id')=='re_content'){
				//등록폼 글자수
				$('#re_first .letter-count').text(remain);
			}else if($(this).attr('id')=='mre_content'){
				//수정폼 글자수
				$('#mre_first .letter-count').text(remain);
			}
		}
	});//end of keyup

	/*---------------------------
	 * 댓글 삭제
	 *---------------------------*/


	/*---------------------------
	 * 댓글수 표시
	 *---------------------------*/
	function displayReplyCount(param){
		let count = param.count;
		let output;
		if(count>0){
			output = '댓글수('+count+')';
		}else{
			output = '댓글수(0)';
		}
		//문서 객체의 추가
		$('#output_rcount').text(output);
	}

	/*---------------------------
	 * 초기 데이터(목록) 호출
	 *---------------------------*/
})//end of all function