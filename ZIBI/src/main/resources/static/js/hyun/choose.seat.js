$(function(){ // performanceSeat.jsp 
	
	/* ----------------------------------
	 * 인원 선택 시작
	 * ---------------------------------- */
	let totalPeople = calculatePeopleNum();
	$('.adult-minus').on('click',function(){
		underEight(-1, 0, 0);
	});
	$('.adult-plus').on('click',function(){
		underEight(1, 0, 0);
	});
	
	$('.teenage-minus').on('click',function(){
		underEight(0, -1, 0);
	});
	$('.teenage-plus').on('click',function(){
		underEight(0, 1, 0);
	});

	$('.treatement-minus').on('click',function(){
		underEight(0, 0, -1);
	});
	$('.treatement-plus').on('click',function(){
		underEight(0, 0, 1);
	});
	
	// 전체 인원수 확인 0명 이상 8명 이하 (음수가 될 수 없고 전체 인원은 8명 이하만 가능)
	function underEight(adult_num, teenage_num, treatement_num){
		let adult = Number($('.adult-num').text())+adult_num;
		let teenage = Number($('.teenage-num').text())+teenage_num;
		let treatement = Number($('.treatement-num').text())+treatement_num;
		
		if(adult<0 || teenage<0 || treatement<0){
			alert('0 이하는 안됨');
		} else if(adult + teenage + treatement > 8) {
			alert('8 이하만 가능');
		} else {
			$('.adult-num').text(adult);
			$('.teenage-num').text(teenage);
			$('.treatement-num').text(treatement);
		}
		// 최종 인원 수
		calculatePeopleNum();
	}
	// 전체 인원 수 계산
	function calculatePeopleNum(){
		let result = Number($('.adult-num').text()) + Number($('.teenage-num').text()) + Number($('.treatement-num').text());
		console.log('전체 인원 수 : ' + result);
		return result;
	}
	
	/* ----------------------------------
	 * 인원 선택 끝
	 * ---------------------------------- */
	
	let ticketing_num = $('#ticketing-num').text();
	
	rowAndCol(ticketing_num);
	// ticketing-num으로 row, col 알아내기
	function rowAndCol(ticketing_num){
		$.ajax({
			url:'drawSeat',
			type:'post',
			data:{ticketing_num:ticketing_num},
			dataType:'json',
			success:function(param){
				seat(param);
				
				mouseoverSeat(param);
				mouseoutSeat(param);
				clickSeat(param);
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	// 좌석 그리기
	function seat(param){
		console.log(param.pickCinema[0]);
		console.log(param.pickPerformance[0]);
		console.log(param.pickTicketing[0]);
		
		console.log(param.pickCinema[0].cinema_row);
		console.log(param.pickCinema[0].cinema_col);
		let standard = param.pickCinema[0].cinema_col * 0.2;
		console.log('standard : ' + standard);
		console.log(param.pickCinema[0].cinema_col-standard);
		
		
		$('#seat').empty();
		let output = '';
		for(let i=0; i<param.pickCinema[0].cinema_row; i++){
			for(let j=0; j<param.pickCinema[0].cinema_col; j++){
				if(j == standard || j == (param.pickCinema[0].cinema_col-standard)){
					output += ' ';
				}
				output += '<div id="'+i+'_'+j+'" class="" style="display:inline-block;width:50px;height:50px;border:1px solid black;"></div>';
			}
			output += '<br>';
		}
		$('#seat').append(output);
		
				
	}
	
	// 마우스 오버
	function mouseoverSeat(param){
		for(let i=0; i<param.pickCinema[0].cinema_row; i++){
			for(let j=0; j<param.pickCinema[0].cinema_col; j++){
				$('#'+i+'_'+j).on('mouseover', (e) => {
					$('#'+i+'_'+j).css({ "background-color": "blue" });
					console.log('total 인원 : ' + calculatePeopleNum());
				});
			}
		}
	}
	
	// 클래스 추가 삭제 변경 : https://sharphail.tistory.com/45
	
	// 클릭하고 mouseout하면 색 그대로 // mouseout을 clickSeat에 들어거야 할지도
	function mouseoutSeat(param){
		for(let i=0; i<param.pickCinema[0].cinema_row; i++){
			for(let j=0; j<param.pickCinema[0].cinema_col; j++){
				$('#'+i+'_'+j).on('mouseout', (e) => {
					$('#'+i+'_'+j).css({ "background-color": "" });
				});
			}
		}
	}
	
	
	
	// 클릭 + 클릭한 좌석 id 구하기 -> 토글 형태로 구현하기 + 좌석 여러 개 구현하기
	function clickSeat(param){
		for(let i=0; i<param.pickCinema[0].cinema_row; i++){
			for(let j=0; j<param.pickCinema[0].cinema_col; j++){
				$('#'+i+'_'+j).click(function(){
					$(this).css("background-color", "red"); // css 값을 주지 말고 class값 주기
					console.log($(this).prop("id"));
				});
			}
		}
	}
	
	
});