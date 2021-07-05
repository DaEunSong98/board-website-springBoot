/*!
* Start Bootstrap - Clean Blog v6.0.3 (https://startbootstrap.com/theme/clean-blog)
* Copyright 2013-2021 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-clean-blog/blob/master/LICENSE)
*/
var pageForm = $('#pageForm');
		$('.paginate_button a').on('click',function(e) {
    		//<a>태그를 클릭해도 페이지 이동이 없도록 처리 
   		 e.preventDefault();
    	
   		 //form태그 내 pageNum값을 href 속성 값으로 변경 
    		pageForm.find("input[name='pageNo']").val($(this).attr("href"));
    	
   		 //actionForm 자체를 submit()
   		pageForm.submit();
});