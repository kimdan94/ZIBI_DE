$(function(){
	/*------------------
	 * 해결 여부 토글 읽기
	 *------------------*/
	//현재 이미지와 text 유지
	function selectSol(helper_num){
		$.ajax({
			url:'getSol',
			type:'post',
			data:{helper_num:helper_num},
			dataType:'json',
			success:function(param){
				displaySol(param);
			},
			error:function(){
				alert('네트워크 오류');
			}
		});//end of ajax
	}//end of selecSol
	
	
	/*------------------
	 * 해결여부 변경
	 *------------------*/
	$('#output_solution').click(function(){
		$.ajax({
			url:'updateSol',
			type:'post',
			data:{helper_num:$('#output_solution').attr('data-num')},
			dataType:'json',
			success:function(param){
				if(param.status == 'logout'){
					alert('로그인 후 사용해주세요');
				}else if(param.status == 'yesSol'){
					alert('해결 완료로 변경되었습니다.')
					displaySol(param);
				}else if(param.status == 'noSol'){
					alert('해결 중으로 변경되었습니다.');
					displaySol(param);
				}else{
					alert('해결여부 오류 발생');
				}
			},
			error:function(){
				alert('네트워크 오류');
			}
		});//end of ajax
	});//end of click
	
	
	/*------------------
	 * 해결여부 표시 공통 함수
	 *------------------*/
	function displaySol(param){
		let output;
		let outputText;
		if(param.status == 'yesSol'){
			output = '../images/de/toggle2.png';
			outputText = '[해결 완료]';
		}else if(param.status == 'noSol'){
			output = '../images/de/toggle1.png';
			outputText = '[해결 중]';
		}else{
			alert('해결여부 표시 오류');
		}
		//문서 객체에 추가
		$('#output_solution').attr('src',output);
		$('#output_text').text(outputText);
	}
	
	//초기 데이터 표시
	selectSol($('#output_solution').attr('data-num'));
});//end of function