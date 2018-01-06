
jQuery(document).ready(function() {
	/*
	 * 登陆按钮添加点击事件
	 */
	$(".login").on("click",function(){
		$('.page-container form').submit();
	})
	
	/*注册按钮添加点击事件*/
	$(".register").on("click",function(){
		window.location.href="user.do?method=register";
	})
	
	/*form提交*/
    $('.page-container form').submit(function(){
        var username = $(this).find('.username').val();
        var password = $(this).find('.password').val();
        /*判断用户名是否为空*/
        if(username == '') {
        	/*显示error提示*/
        	
            $(this).find('.error').fadeOut('1000', function(){
                $(this).css('top', '27px');
            });
            
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.username').focus();
            });
            
            return false;
        }
        if(password == '') {
            $(this).find('.error').fadeOut('fast', function(){
                $(this).css('top', '96px');
            });
            $(this).find('.error').fadeIn('fast', function(){
                $(this).parent().find('.password').focus();
            });
            return false;
        }
    });
	
	/*输入数字，叉号取消*/
    $('.page-container form .username, .page-container form .password').keyup(function(){
        $(this).parent().find('.error').fadeOut('fast');
    });

});
