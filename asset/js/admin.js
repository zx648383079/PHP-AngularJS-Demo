//admin页面
var login=angular.module("login",[]);
login.controller("loginController",["$scope","$http","$window","$interval","$timeout",function($scope,$http,$window,$interval,$timeout){
	$scope.loginForm={username:"admin"};
	$scope.sign=function()
	{
		$http.post(APP_URL+"admin.php",topost($scope.loginForm),{headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}})
        .success(function(data) {
			if(data["success"])
			{
				var i=5;
				var a=$interval(function()
					{
						if(i==0)
						{
							$window.location.href=APP_URL+"backend.php";
							$interval.cancel(a);
						}else{
							$scope.msg="登录成功！将在 "+i+" 秒后进入……";
						}
						i--;
					},1000);
			}else{
				$scope.loginForm.password="";
				$scope.msg=data["msg"];
				var tim=$timeout(function(){
					$scope.msg="";
					$timeout.cancel(tim);
				},2000);
			}
		});
	}
}]);