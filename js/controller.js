/// <reference path="../typings/angularjs/angular.d.ts"/>
var app=angular.module("app",[]);
app.controller("controller",["$scope","$http",function($scope,$http){
	$scope.profile="";
	
	$scope.title="新增";
	
	$scope.loading=function()
	{
		$http.get("/workspace.php?mode=1").success(function(data)
			{
				$scope.profile=data["data"];
			});
	};
	//点击“编辑”
	$scope.update=function(id)
	{
		$scope.title="修改";
		$scope.formData.id=id;
		
		var pro;
		//遍历数组
		for(var item in $scope.profile)
		{
			var obj=$scope.profile[item];
			if(obj.id==id)
			{
				pro=obj;
				continue;
			}
		}
		
		$scope.formData.name=pro.name;
		$scope.formData.phone=pro.phone;
	};
	//点击“删除”
	$scope.del=function(id)
	{
		$http.get("/workspace.php?mode=3&id="+id).success(function(data)
			{
				$scope.loading();
				alert(data["data"]["status"]);
			});
	};
	//表单数据
	$scope.formData={};
	//新增或修改数据
	$scope.add=function()
	{
		var url='/workspace.php?mode=2';
		if($scope.formData.id != null && $scope.formData.id != undefined)
		{
			url="/workspace.php?mode=4";
		}
		$http.post(url,topost($scope.formData),{headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}})
        .success(function(data) {
			switch(data["data"]["status"])
			{
				case 0:
					$scope.formData={};
					$scope.loading();
					alert("添加成功！");
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
			if(str=="")
			{
				str=key+"="+data[key];
			}else{
				str+="&"+key+"="+data[key];
			}
		}
	}else{
		str=data;
	}
	
	return str;
}