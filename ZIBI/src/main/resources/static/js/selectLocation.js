$(function(){
	var table = document.getElementById('location1');
	var rowList = table.rows;
	
	
	// table (지역1) 클릭
	for (i=1; i<rowList.length; i++) {
		var row = rowList[i];     //thead 부분을 제외하기 위해 i가 1부터 시작됩니다.
		var tdsNum = row.childElementCount;     //아래 for문에서 사용하기 위해 row 하위에 존재하는 td의 갯수를 구합니다.

		row.onclick = function() {
			return function() {
			var str = '';
			//row 안에 있는 값들을 순차적으로 가져오기
			for (var j=0; j<tdsNum; j++) {
				var row_value = this.cells[j].innerHTML;
				str += row_value + '';     //값을 하나의 문자열으로 만듭니다.
			};
			
			//console.log(str);
			location2(str);
			};
		}(row);
	} // end of for
	
	
	function location2(location1){
		console.log(location1);
		
		$.ajax({
			url:'selectLocation',
			type:'post',
			data:{location1:location1},
			dataType:'json',
			success:function(param){
				if(param.result=='success'){
					//alert("성공");
					console.log(param.listLoc2);
					$('#location2 tbody').empty();
					let output = '';
					for(var i=0; i<param.listLoc2.length; i++){
						console.log("값 : " + param.listLoc2[i].cinema_num);
						output += '<tr id="'+param.listLoc2[i].cinema_num+'"><td>' + param.listLoc2[i].cinema_location2 + '</td></tr>';
					}
					$('#location2 tbody').append(output);
					
				}
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
		
	}
	
});