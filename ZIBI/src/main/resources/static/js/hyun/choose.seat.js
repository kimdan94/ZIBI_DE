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
	
	
	
	
	
		
});