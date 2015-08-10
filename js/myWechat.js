wx.error(function(res){
	//alert('wx error, ' + JSON.stringify(res));
});

wx.ready(function () {
	initWechat();
});

var initWechat = function() {
	wx.onMenuShareTimeline({
  		title: App.share_title2,
  		link: App.share_url,
  		imgUrl: App.share_img_url,
  		trigger: function (res) {},
  		success: function (res) {
			Utils.postShare(10, App.share_url, 'shareTimeline');
  		},
  		cancel: function (res) {},
  		fail: function (res) {
    		//alert(JSON.stringify(res));
  		}
    });
	
	wx.onMenuShareAppMessage({
	    title: App.share_desc,
	    desc: App.share_title,
	    link: App.share_url,
	    imgUrl: App.share_img_url,
	    success: function () {
			Utils.postShare(20, App.share_url, 'shareAppMessage');
		},
	    cancel: function () {}
	});
	
	//
	/*wx.onMenuShareQQ({
	    title: App.share_desc,
	    desc: App.share_title,
	    link: App.share_url,
	    imgUrl: App.share_img_url,
	    success: function () {
			Utils.postShare(30, App.share_url, 'shareQQ');
		},
	    cancel: function () {}
	});*/
	/*wx.onMenuShareWeibo({
	    title: App.share_desc,
	    desc: App.share_title,
	    link: App.share_url,
	    imgUrl: App.share_img_url,
	    success: function () {
			Utils.postShare(40, App.share_url, 'shareWeibo');
		},
	    cancel: function () {}
	});*/
};