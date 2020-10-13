/**
 * 
 */

$(function(){

	// id정규식 체크 
	$('#id').on('keyup', function() {

		idval = $('#id').val().trim();

		regid = /^[a-z][a-zA-Z0-9]{3,11}$/;

		
		if (!(regid.test(idval))) {

			regfail(this,"올바른 형식이 아닙니다");
			
		} else {
			$(this).parents('.form-group').find('.msg').html("");

		}
	});
});