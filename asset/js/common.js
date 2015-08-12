//把数组转成能POST提交的数据
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
};

//获取url的参数
function getVal(name) {
var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
var r = window.location.search.substr(1).match(reg);
if (r != null) return unescape(r[2]); return 0;
} 