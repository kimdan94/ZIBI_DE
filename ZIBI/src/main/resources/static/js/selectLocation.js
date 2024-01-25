$(function(){
	
	//--------------------------- 지역 선택 시작 ----------------------------
	let loc1 = 'location1';
	let loc2 = 'location2';
	
	selectLocation(loc1);
	
	// table row 선택 함수
	function selectLocation(location){
		// 기본 영화 선택 리스트 지우기
		var table = document.getElementById(location);
		var rowList = table.rows;
		
		// table (지역) 클릭
		for (i=1; i<rowList.length; i++) {
			var row = rowList[i];     //thead 부분을 제외하기 위해 i가 1부터 시작됩니다.
			var tdsNum = row.childElementCount;     //아래 for문에서 사용하기 위해 row 하위에 존재하는 td의 갯수를 구합니다.
			row.onclick = function() {
				return function() {
					
				var str = '';
				for (var j=0; j<tdsNum; j++) {
					var row_value = this.cells[j].innerHTML;
					this.cells[j].style.backgroundColor="red"
					console.log(this.cells[j]);
					
					str += row_value + '';
				};
				
				console.log(str); // 지역 출력
				if(location == loc1){
					console.log('지역1');
					location2(str); // 지역2의 테이블이 나오게
				} else if(location == loc2){
					console.log('지역2');
					console.log(str);
					
					// ===== [지역1, 지역2 모두 선택하면 선택할 수 있는 영화 고르기] =====
					locationNum(str); // ajax 통신
				}
				
				};
			}(row);
		} // end of for
	}
	
	// 지역2 table 생성 메소드
	function location2(location1){
		$.ajax({
			url:'selectLocation',
			type:'post',
			data:{location1:location1},
			dataType:'json',
			success:function(param){
				if(param.result=='success'){
					$('#location2 tbody').empty();
					let output = '';
					for(var i=0; i<param.listLoc2.length; i++){
						console.log("값 : " + param.listLoc2[i].cinema_num);
						output += '<tr id="'+param.listLoc2[i].cinema_num+'"><td>' + param.listLoc2[i].cinema_location2 + '</td></tr>';
					}
					$('#location2 tbody').append(output);
					selectLocation(loc2);
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	// 지역2의 값 ajax
	function locationNum(location2){
		$.ajax({
			url:'locationNum',
			type:'post',
			data:{location2:location2},
			dataType:'json',
			success:function(param){
				if(param.result=='success'){
					console.log('지역번호 알아내기');
					console.log(param.locNum[0].cinema_num); // 지역번호!!!
					
					// ===== [지역번호로 해당 지역에서 볼 수 있는 영화 알아보기] =====
					listEnt(param.locNum[0].cinema_num);
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	}
	
	
	//============================== 수정 필요 ===============================
	// 지역1 초기화
	function init(){
		$.ajax({
				url:'selectLocList',
				type:'post',
				data:{},
				dataType:'json',
				success:function(param){
					if(param.result=='success'){
						$('#location1 > tbody').empty();
						for(let k=0; k<param.listColor.length; k++){
							let output = '<tr>';
							output += '<td style="border:1px solid black;">' +param.listColor[k].cinema_location1+ '</td>';
							output += '</tr>';
							$('#location1 > tbody').append(output);
						}
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
		});
	} // end of init()
	//=====================================================================
	//--------------------------- 지역 선택 끝 ----------------------------
	
	//--------------------------- 영화 선택 시작 ----------------------------
	
	function listEnt(cinema_num){
		
		$.ajax({
				url:'canPerformance',
				type:'post',
				data:{cinema_num:cinema_num},
				dataType:'json',
				success:function(param){
					if(param.result=='success'){
						// 기본 영화 선택 리스트 지우기
						console.log(param.listPerformance);
						
						
					}
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
});