/// <reference path="../typings/angularjs/angular.d.ts"/>
var app=angular.module("app",[]);
app.controller("controller",["$scope","$http",function($scope,$http){
	$scope.profile=new Array;
	
	$scope.title="新增";
	
	$scope.more=false;
	$scope.page=0;
	
	$scope.loading=function()
	{
		$http.get("/workspace.php?mode=1&page="+$scope.page).success(function(data)
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
		$http.get("/workspace.php?mode=3&id="+id).success(function(data)
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
		var url='/workspace.php?mode=2';
		if($scope.formData.id != null && $scope.formData.id != undefined)
		{
			url="/workspace.php?mode=4";
			mode=false;
		}
		$http.post(url,topost($scope.formData),{headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'}})
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