/**
 * 
 */
function ajaxView(menuName)
{
	alert('ajaxView.js: '+menuName);
	$.ajax({
		type:"get",
		url: menuName,
		success:function(data)
		{
		
			$('#binContent').empty();
			$('#binContent').append( $('#binContent').html(data)); 		
		},
		
		error:function(){
			alert('error:' + menuName);
		},
	});	
}