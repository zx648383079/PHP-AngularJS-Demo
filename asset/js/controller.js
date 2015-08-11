/// <reference path="../../typings/angularjs/angular.d.ts"/>
//login页面
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

//wordspace页面
var app=angular.module("app",[]);
app.controller("controller",["$scope","$http",function($scope,$http){
	$scope.profile=new Array;
	
	$scope.title="新增";
	
	$scope.more=false;
	$scope.page=0;
	
	$scope.loading=function()
	{
		$http.get(APP_URL+"workspace.php?mode=1&page="+$scope.page).success(function(data)
			{
				angular.forEach(data["data"]['data'],function(v,k)
					{
						$scope.profile.push(v);
					});
				$scope.more=data["data"]['more'];
			});
	};
	
	//点击“编辑”
	$scope.update=function(id)
	{
		$scope.title="修改";
		$scope.formData.id=id;
		
		var pro;
		//遍历数组
		angular.forEach($scope.profile,function(v,k)
			{
				if(v.id==id)
				{
					pro=v;
				}
			});
		
		$scope.formData.name=pro.name;
		$scope.formData.phone=pro.phone;
	};
	//点击“删除”
	$scope.del=function(id)
	{
		$http.get(APP_URL+"workspace.php?mode=3&id="+id).success(function(data)
			{
				switch(data["data"]["status"])
				{
					case 0:
						//$scope.loading();
						var index;
						angular.forEach($scope.profile,function(v,k)
						{
							if(v.id==id)
							{
								index=k;
							}
						});
						$scope.profile.splice(index,1);
						alert("删除成功！");
						break;
					case 10:
						break;
					default:
						break;
				}
			});
	};
	//表单数据
	$scope.formData={};
	//新增或修改数据
	$scope.add=function()
	{
		var mode=true;
		var url='workspace.php?mode=2';
		if($scope.formData.id != null && $scope.formData.id != undefined)
		{
			url="workspace.php?mode=4";
			mode=false;
		}
		$http.post(APP_URL+url,topost($scope.formData),{headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}})
        .success(function(data) {
			switch(data["data"]["status"])
			{
				case 0:
					if(mode)
					{
						if(!$scope.more)
						{
							$scope.profile.push(data["data"]['data']);
						}
						alert("添加成功！");
					}else{
						var index;
						var id=$scope.formData.id;
						angular.forEach($scope.profile,function(v,k)
						{
							if(v.id==id)
							{
								index=k;
							}
						});
						$scope.profile.splice(index,1,data["data"]['data']);
						alert("修改成功！");
					}
					$scope.formData={};
					break;
				case 10:
					alert("姓名和手机号不能为空");
					break;
				default:
					break;
			}
		});
	};
	//清空
	$scope.clear=function()
	{
		$scope.title="新增";
		$scope.formData={};
	};
	
	//加载更多
	$scope.addMore=function()
	{
		if($scope.more)
		{
			$scope.page++;
			$scope.loading();
		}	
	}
}]);

//自定义筛选
app.filter("myFilter",function()
{
	return function(input,name)
	{
		//input 是内部的数组 $scope.profile
		//console.log("input=",input); 
		//console.log("name=",name); 
		
		if(name!=null && name !="" && name !=undefined)
		{
			var output=[];
			angular.forEach(input,function(v,k)
			{
				if(v.name.contains(name) || v.phone.contains(name))
				{
					output.push(v);
				}
			});
			return output;
		}else{
			return input;
		}
		//console.log("output=",output); 
		
	}
});

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


//把数组转成能提交的数据
function topost(data)
{
	var str="";
	
	if(data instanceof Object)
	{
		for(var key in data)
		{
			var v=data[key];
			if(typeof v === "string")
			{
				v=v.replace(/\ +/g,"");
				v=v.replace(/[\r\n]/g,"<br/>");
			}
			if(str=="")
			{
				str=key+"="+v;
			}else{
				str+="&"+key+"="+v;
			}
		}
	}else{
		str=data;
	}
	
	return str;
}