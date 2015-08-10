var Utils = {
	
	getUserAgent: function(){
		var ua = navigator.userAgent.toLowerCase();
		return ua;
    },
	
	isWeixin: function(){
		var ua = this.getUserAgent();
		var isWeixin = ua.indexOf('micromessenger') != -1;
		return isWeixin;
    },
    
    isAndroid: function(){
		var ua = this.getUserAgent();
		var isAndroid = ua.indexOf('android') != -1;
		return isAndroid;
    },
    
    isIos: function(){
		if(Utils.isLocal()){
			return true;
		}
		var ua = this.getUserAgent();
		var isIos = (ua.indexOf('iphone') != -1) || (ua.indexOf('ipad') != -1);
		return isIos;
    },
	
	isIphone4: function(){
		var ua = this.getUserAgent();
		if(ua.indexOf('iphone') != -1 && window.innerWidth == 320 && window.innerHeight == 416){
			return true;
		}
		return false;
    },
	
	isLocal: function(){
		//alert(typeof(_debug));
		if(typeof(_debug) != 'undefined' && _debug == '1'){
			return true;
		}
		var isLocal = (APP_URL.indexOf('localhost') != -1) || (APP_URL.indexOf('8080') != -1);
		return isLocal;
    },
	
	isPostcode: function(val) {
		var reg = /^[1-9]\d{5}(?!\d)$/;
		if(reg.test(val) == false){
			return false;
		}
		return true;
	},
	
	isMobile: function(val) {
		if(val == null || val.length == 0 || val.length != 11){
			return false;
		}
		//var reg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
		var reg = /^(13|15|18|14|17)\d{9}$/;
		if(reg.test(val) == false){
			return false;
		}
		return true;
	},
	
	isNull: function(val){
		if(val == null || val == ''){
			return true;
		}
		return false;
	},
	
	trim: function(val){
		if(val == null){
			return "";
		}
		return val.toString().replace(/^\s+|\s+$/g, ""); 
	},
	
	location: function(url){
		try {
		url = APP_URL + url;
		//window.location.href = url;
		setTimeout(function(){ //TODO 诡异的跳转问题
			window.location.href = url;
		}, 100);
		} catch (e) {}
	},
	
	postShare: function(type, url, memo){
		Utils.ajaxPost('share.php', {
			type: type,
			url: url,
			memo: memo ? memo : ''
		}, function(response){
			
		});
	},
	
	sendGa: function(name){
		try {
			if(ga && name){
				ga('send', 'event', 'button', 'click', name);
			}
		} catch (e) {}
	},
	
	ajaxGet: function(url, callback, gaName){
		/*if(gaName && ga){
			ga('send', 'event', 'button', 'click', gaName);
		}*/
		$.ajax({
			type: 'GET',
			url: APP_URL + url,
			data: {},
			success: function(res){
				if(callback){callback(res)}
			},
			dataType: 'json'
		});
	},
	
	ajaxPost: function(url, data, callback, gaName){
		/*if(gaName && ga){
			ga('send', 'event', 'button', 'click', gaName);
		}*/
		try {
		$.ajax({
			type: 'POST',
			url: APP_URL + url,
			data: data,
			success: function(res){
				//alert(JSON.stringify(res));
				if(callback){callback(res)}
			},
			dataType: 'json'
		});
		} catch (e) {
			//alert(e);
		}
	}
};

if (!String.prototype.format) {
    String.prototype.format = function(){
        var args = arguments;
        return this.replace(/{(\d+)}/g, function(match, number){
            return typeof args[number] != 'undefined' ? args[number] : match;
        });
    };
}