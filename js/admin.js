jQuery(function($) {
	
	$('.btn-export').on('click', function(e){
		if(window.confirm('Are you sure?')){
			var _url = APP_URL + 'backend.php?export=1';
			window.open(_url);
			//window.location.href = _url;
		}
	});
	
	//后台列表点击查看code list
	$('.view-codes').on('click', function(e){
		var uid = $(this).attr('data-uid');
		var name = $(this).attr('data-name');
		var openid = $(this).attr('data-openid');
		
		//title
		$('#myModalLabel').html((name?name:openid) + '\'s collects');
		
		//loading
		var _html = '<tr class="info"><td colspan="5">数据加载中...</td></tr>';
		$('#myModalTbody').html(_html);
		
		var url = 'backend.php?id=' + uid;
		Utils.ajaxGet(url, function(res){
			if(!res.success){
				alert(res.msg);
				return false;
			}
			
			var table_ = [];
			
			var list = res.data;
			if(list && list.length > 0){
				for (var i = 0; i < list.length; i++){
					if(i%2 == 0){
						table_.push('<tr class="info">');
					}else{
						table_.push('<tr>');
					}
					table_.push('<td>' + (i+1) + '</td>');
					table_.push('<td>' + list[i].id + '</td>');
					table_.push('<td>' + list[i].codes + '</td>');
					table_.push('<td>' + list[i].cdate + '</td>');
					table_.push('</tr>');
				}
			}else{
				table_.push('<tr class="info">');
				table_.push('<td colspan="5">没有数据</td>');
				table_.push('</tr>');
			}
			$('#myModalTbody').html(table_.join(''));
		});
	});
	
	//updatepwd
    $('#but-submit-updpwd').on('click',function() {
		var username = $('#input-username').val();
		var oldpwd = $('#input-oldpassword').val();
		var password = $('#input-password').val();
		var truepwd = $('#input-truepassword').val();
		if (Utils.isNull(oldpwd) || Utils.isNull(password) || Utils.isNull(truepwd)) {
            alert('密码信息不允许为空');
			return false;
        }
        if (password !== truepwd) {
            alert('新密码和确认密码输入不一致');
			return false;
        }
		
		Utils.ajaxPost('admin.php/updatepwd', {
			username: username,
			oldpwd: oldpwd,
			password: password
		}, function (data) {
			alert(data.msg);
			//$('#form-admin-updpwd')[0].reset();
			document.getElementById('form-admin-updpwd').reset();
        });
    });
	
});
