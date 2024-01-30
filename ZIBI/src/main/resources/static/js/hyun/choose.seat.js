$(function(){ // performanceSeat.jsp 
	
	/* ----------------------------------
	 * 인원 선택 시작
	 * ---------------------------------- */
	
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
	
	
	
	
});