//feedback页面
var feedback=angular.module("feedback",[]);
feedback.controller("fbController",["$scope","$http","$timeout",function($scope,$http,$timeout){
	$scope.fbForm={kind:0};
	$scope.submit=function()
	{
		$http.post(APP_URL+"feedback.php",topost($scope.fbForm),{headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}})
        .success(function(data) {
			if (data["success"]) {
				$scope.fbForm.message="";
				$scope.msg="发送成功！";
			}else{
				$scope.msg="发送失败！";
			}
			var tim = $timeout(function(){
				$scope.msg="";
				$timeout.cancel(tim);
			},2000);
			
		});
	}
}]);