/*
 * 선택시 유져 상태 저장 
 * 챗봇 데이터 저장시 이용
 * parameter : userStateStr
 * 01 : 업무
 * 02 : 외출
 * 03 : 회의
 * 04 : 식사
 * 
 * */
	function userState(userStateStr)
	{
		$.ajax({
			type:"get",
			url: "userState.ajax",
			data : "state="+userStateStr,
			success:function(data)
			{
				conselo.log("sccess");
			},
			
			error:function(){
				alert('error:' + menuName);
			},
		});	
	}

