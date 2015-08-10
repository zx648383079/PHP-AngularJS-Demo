$(document).ready(function(){
	
	if(Utils.isIphone4() == true && _IPHONE4 && _IPHONE4 == '0'){
		window.location.href = APP_URL + 'iphone4.php?iphone4=1';
	}
	if(Utils.isIphone4() == false && _IPHONE4 && _IPHONE4 == '1'){
		window.location.href = APP_URL + 'index.php';
	}
	
	var FIRST_PRELOAD_IMAGES = [
		APP_URL + 'images/mojito1.png',
		APP_URL + 'images/mojito2.png',
		APP_URL + 'images/loading_bg.jpg'
	];
	jQuery.imgpreload(FIRST_PRELOAD_IMAGES, function(){
		myApp.init();
	});
});

var myApp = {
	
	supportOrientation: (typeof window.orientation === 'number' && typeof window.onorientationchange === 'object'),
	shareDesc: '我用{0}秒喝完了世界上最长长长长长长长长的莫吉托，你呢？',
	 
	elements: {},
	distanceKM: 13451, //KM
	milestone: 0,
	milestoneHeight: 0,
	totalMilestone: 0,
	milestones: [],
	skrollrMaxTop: 0,
    pageHeight: 0,
	activeMilestoneNum: 0,
	
	isIphone4: false,
	isAndroid: false,
	isOnlyExternal: true, //
	isLandscape: false,
	isInitOnLandscape: false,
	isPlayDemo: false,
	isGenerateMilestones: false,
	
	isToSectionGame: false,
	isToSectionMain: false,
	isToSectionBottom: false,
	clockTimes: 0,
	clockInterval: 0,
	loadingInterval: 0,
	preloadInterval: 0,
	isPostProfile: false,
	
	init: function(){
		this.animationLoadingImg();
		
		this.setup();
		
		jQuery.imgpreload(PRELOAD_IMAGES, function(){
			myApp.demoPreload();
		});
		
		this.bindOrientation(function(isLandscape){
			myApp.isInitOnLandscape = true;
		});
	},
	
	setup: function(){
		this.$panelLoading = $('#panel-loading');
		this.$panelGame = $('#panel-game');
		this.$panelForm = $('#panel-form');
		this.$panelQrcode = $('#panel-qrcode');
		this.$panelRotate = $('#panel-rotate');
		
		this.elements.page = this.$panelGame;
		this.elements.page01 = this.$panelGame.find('.page01');
		this.elements.page02 = this.$panelGame.find('.page02');
		this.elements.page03 = this.$panelGame.find('.page03');
		this.elements.pageMain = this.$panelGame.find('.page-main');
		
        this.elements.start = this.$panelGame.find('.btn');
		this.elements.btn03 = this.$panelGame.find('.btn03');
		this.elements.startFleche = this.$panelGame.find('.fleche');
		this.elements.startDown = this.$panelGame.find('.down-click');
        this.elements.sectionTop = this.$panelGame.find('section.top');
		this.elements.sectionMain = this.$panelGame.find('div.main');
        this.elements.sectionBottom = this.$panelGame.find('section.bottom');
        this.elements.meter = this.$panelGame.find('.meter');
		this.elements.meterEle = this.elements.meter[0];
		
		this.elements.timer = this.$panelGame.find('#timer');
		this.elements.time = this.$panelGame.find('.time');
		this.elements.timeIcon = this.$panelGame.find('.time-icon');
		
		this.elements.formWord = this.$panelForm.find('.form-word'); 
		
		this.elements.audioBg = document.querySelector('#audio_bg');
		
		this.pageHeight = this.elements.page.height();
		
		this.isIphone4 = Utils.isIphone4();
		this.isAndroid = Utils.isAndroid();
		
		this.initSwiper();
		
		this.bindPanelLoading();
		this.bindPanelGame();
		this.bindPanelForm();
		this.bindPanelFormSucc();
		this.hammerQrCode();
		
		this.initSkrollr();
	},
	
	initSwiper: function(){
		console.log('initSwiper');
		
		/*if(window.innerWidth > window.innerHeight){
			this.isInitOnLandscape = true;
		}*/
		
		this.mySwiper = new Swiper('.swiper-container', {
			direction: 'vertical',
			onlyExternal: myApp.isOnlyExternal,
			onSlideChangeEnd: function(swiper){
				myApp.slideChangeEnd(swiper);
			}
		});
	},
	
	initSkrollr: function(){
		console.log('initSkrollr');
		
		var SCRATCH_ANIMATION = 4800;
		var STORY_ANIMATION = 3000;
		var INGREDIENT_ANIMATION = 7000;
		
		var arrow = 300;
		var story = arrow - 100;
		var building = story + STORY_ANIMATION;
		var sugar = building + SCRATCH_ANIMATION + STORY_ANIMATION;
		var lemon = sugar + INGREDIENT_ANIMATION + 500;
		var mint = lemon + INGREDIENT_ANIMATION + 500;
		var ice = mint + INGREDIENT_ANIMATION + 500;
		var ram = ice + INGREDIENT_ANIMATION + 500;
		var club = ram + INGREDIENT_ANIMATION;
		var soda = club + INGREDIENT_ANIMATION + 500;
		var dancer = soda + INGREDIENT_ANIMATION + 500;
		var smoker = dancer + SCRATCH_ANIMATION + STORY_ANIMATION;
		var coco = smoker + SCRATCH_ANIMATION + STORY_ANIMATION;
		var drummer = coco + SCRATCH_ANIMATION + STORY_ANIMATION;
        this.mySkrollrOptions = {
            constants: {
                arrow: arrow,
                story: story,

                building: building,
                club: club,
                dancer: dancer,
                smoker: smoker,
                coco: coco,
                drummer: drummer,

                sugar: sugar,
                lemon: lemon,
                mint: mint,
                ice: ice,
                ram: ram,
                soda: soda
            },
            beforerender: function(data){
                //console.log('beforerender');
                if(myApp.isToSectionGame == false && myApp.mySkrollr){
                    myApp.mySkrollr.setScrollTop(0);
                    return false;
                }
                //else if(myApp.isToSectionBottom == true){
                //	return false;
                //}
            },
            render: function(data) {
                //console.log(data.curTop);
                if(myApp.isGenerateMilestones == false && data.curTop == 0){
                    myApp.isGenerateMilestones = true;
                    myApp.skrollrMaxTop = data.maxTop;
                    myApp.generateMilestones();
                }
                else if(myApp.isToSectionBottom == false && data.curTop == data.maxTop){
                    myApp.isToSectionBottom = true;
                    myApp.moveToSectionBottom();
                }
                else if(myApp.isIphone4 == false){
                    //myApp.elements.meterEle.style.webkitTransform = 'translate3d(0, ' + -(data.curTop * 1.0868) + 'px, 0)';
                    myApp.elements.meterEle.style.webkitTransform = 'translate3d(0, ' + -(data.curTop * 1.1) + 'px, 0)';
                }
            }
        };

		this.mySkrollr = skrollr.init(this.mySkrollrOptions);
	},
	
	generateMilestones: function(){
		if(this.isIphone4 == true){
			console.log('Iphone4S no generateMilestones');
			return;
		}
		console.log('generateMilestones maxTop ' + this.skrollrMaxTop);
		
		//this.milestoneHeight = this.pageHeight - (45 * 2) - 20; //meter top and bottom
		this.milestoneHeight = this.pageHeight * 2;
		
		this.totalMilestone = Math.floor(this.skrollrMaxTop / this.milestoneHeight);
		this.milestone = Math.floor(this.distanceKM / this.totalMilestone);
		console.log('generateMilestones milestone ' + this.milestone + 'KM');
		
        this.milestones.push(this.distanceKM);
        for(var i = this.totalMilestone - 1; i > 0; i--){
            var val = this.milestone * i;
            this.milestones.push(val);
        }
		this.milestones.push(0);
		console.log('generateMilestones milestones length ' + this.milestones.length);
		console.log(this.milestones);
		
		for(var i = 0; i < this.totalMilestone + 1; i++){
		//for(var i = 0; i < 10; i++){
            this.addMilestone(i);
        }
		this.activeMilestoneNum = 10;
	},
	addMilestone: function(i){
		if(this.milestones[i]){
			var $li = $('<li>').height(this.milestoneHeight).html('<span class="metter-icon"></span>'
				+ '<span class="num">' + this.milestones[i] + '<br>KM</span>');
            this.elements.meter.append($li);
        }
    },
	
	gameRestart: function(){
        this.mySkrollr = skrollr.init(this.mySkrollrOptions);

		myApp.isToSectionGame = false;
		myApp.isToSectionMain = false;
		myApp.isToSectionBottom = false;
		myApp.clockTimes = 0;
		myApp.clockInterval = 0;
		myApp.isPostProfile = false;
		
		//
		myApp.elements.time.text('00:00');
		
		myApp.mySkrollr.setScrollTop(0);
		
		myApp.elements.page.css('top', '0px');
	},
	
	slideChangeEnd: function(swiper){
		if(swiper.activeIndex == 1){ //game
			myApp.$panelGame.find('.page02, .page03').show();
			myApp.animationGameTop();
		}
		else if(swiper.activeIndex == 2){ //form
			if(_HAS_PROFILE == '1'){ //qrcode
				myApp.animationFormSucc();
			}
		}
		else if(swiper.activeIndex == 3){ //qrcode
			myApp.animationFormSucc();
		}
		else{}
	},
	
	bindPanelLoading: function(){
		this.$panelLoading.find('.btn01').bind('click', function(){
			window.clearInterval(myApp.loadingInterval);
			
			myApp.mySwiper.slideTo(1, 800, true);
		});
		
		this.$panelLoading.find('.btn02').bind('click', function(){
			var _url = 'http://www.we-responsible.com/#/Re-sponsible Drinking/Minors';
			
			try {
			setTimeout(function(){
				window.location.href = _url;
			}, 100);
			} catch (e) {}
		});
	},
	bindPanelGame: function(){
		this.elements.page01.one('click', function(){
            //myApp.mySwiper.slideTo(1, 800, true);

			myApp.elements.start.addClass('down');
			
			myApp.elements.startDown.show();
			myApp.elements.startFleche.show();
			if(myApp.isIphone4 == false){				
				myApp.elements.startFleche.addClass('animation_fleche');
			}
			
			myApp.$panelGame.find('.word01').velocity({
				opacity: 0,
				top: '-55%'
			}, {
				duration: 1000,
				complete: function(elements){
					$(elements).hide();
				}
			});
			
			myApp.$panelGame.find('.word02').css('top', '80%').show().velocity({
				opacity: 1,
				top: myApp.isIphone4 == true ? '13%' : '25%'
			}, {
				duration: 1000,
				complete: function(){}
			});
			
			myApp.hammerStart();
		});
		
		this.$panelGame.find('.btn04-click').on('click', function(){
			myApp.$panelGame.find('.masking').show();
            myApp.$panelGame.find('.refresh').hide();
			Utils.sendGa('game-share');
		});
		
		this.$panelGame.find('.btn03-click').on('click', function(){
			myApp.mySwiper.slideTo(2, 800, true);
			myApp.elements.btn03.removeClass('animation_party');
			
			Utils.sendGa('game-party');
		});
		
		this.$panelGame.find('.masking').on('click', function(event){
			$(this).hide();
            myApp.$panelGame.find('.refresh').show();
		});
		
		this.$panelGame.find('.qr-code').click(function(e){
			var ev = e || window.event;
			if(ev.stopPropagation){
				ev.stopPropagation();
			}
			else if(window.event){
				window.event.cancelBubble = true;//兼容IE
			}
		});
		
		this.elements.timeIcon.on('click', function(){
			if(Utils.isLocal()){ //debug
			myApp.mySkrollr.setScrollTop(90000);
			}
			
			if(myApp.elements.audioBg.paused){ //play
				console.log('play music');
				myApp.elements.audioBg.play();
				myApp.elements.timeIcon.removeClass('close');
			}else{
				console.log('pause music');
				myApp.elements.audioBg.pause();
				myApp.elements.timeIcon.addClass('close');
			}
		});
		
		this.$panelGame.find('.refresh').on('click', function(){
			myApp.gameRestart();
		});
	},
	resizeAndroidForm: function(){
		if(myApp.isAndroid == true){
			myApp.$panelForm[0].scrollTop = myApp.$panelForm[0].scrollHeight;
			
			if(myApp.pageHeight > window.innerHeight){ //Opend android keyboard
				myApp.elements.formWord.hide();
			}else{
				myApp.elements.formWord.show();
			}
		}
	},
	bindPanelForm: function(){
		if(myApp.isAndroid == true){
			$(window).resize(function(){
				myApp.resizeAndroidForm();
			});
		}
		
		var inputPhone = this.$panelForm.find('#input-phone');
		var inputNickname = this.$panelForm.find('#input-nickname');
		var buttonForm = this.$panelForm.find('.submit');
		
		var popCloseArray = this.$panelForm.find('.pop-close');
		var popup01 = this.$panelForm.find('.popup01');
		var popup02 = this.$panelForm.find('.popup02');
		var popup03 = this.$panelForm.find('.popup03');
		
		var isValidate = true;
		
		inputPhone.bind('blur', function(){
			myApp.resizeAndroidForm();
			
			var _val = $(this).val();
			if(Utils.isNull(_val)){
				return;
			}
			if(!Utils.isMobile(_val)){
				popup03.show();
				isValidate = false;
			}else{
				isValidate = true;
			}
		});
		
		inputNickname.bind('blur', function(){
			myApp.resizeAndroidForm();
		});
		
		popCloseArray.bind('click', function(){
			$(this).parent('.pop').hide();
		});
		
		buttonForm.bind('click', function(){
			if(myApp.isPostProfile == true || isValidate == false){
				return;
			}
			
			if(myApp.$panelForm.find('.pop:visible').length > 0){
				return;
			}
			
			var _phone = inputPhone.val();
			var _nickname = inputNickname.val();
			if(!Utils.isMobile(_phone)){
				popup03.show();
				return;
			}
			if(Utils.isNull(_nickname)){
				return;
			}
			
			myApp.isPostProfile = true;
			Utils.ajaxPost('profile.php', {
				'phone': _phone,
				'nickname': _nickname,
				'uid': _USER_ID
			}, function(response){
				myApp.isPostProfile = false;
				//alert(JSON.stringify(response));
				if(!response.success){
					alert(response.msg);
					return false;
				}
				var _status = response.data.status;
				if(_status === 0){
					//Call crm api
					myApp.postCrmApi();
					
					myApp.mySwiper.slideTo(3, 800, true);
				}
				else if(_status === 10){
					popup03.show();
				}
				else if(_status === 20){
					popup02.show();
				}
				else if(_status === 30){
					popup01.show();
				}
				else{}
			});
		});
	},
	bindPanelFormSucc: function(){
		myApp.$panelQrcode.find('.confirm').bind('click', function(){
			var _url = 'http://mp.weixin.qq.com/s?__biz=MjM5NDM3MjcyNA==&mid=207493500&idx=1&sn=55cacb434ea935e70b93f39ce0ed44dd&scene=18#rd';
			try {
			setTimeout(function(){
				window.location.href = _url;
			}, 100);
			} catch (e) {}
			
			Utils.sendGa('qrcode-follow');
		});
	},
	
	hammerStart: function(){
		//var hammer = new Hammer(this.elements.startDown[0]);
		var hammer = new Hammer(this.elements.page01[0]);
		hammer.get('pan').set({ direction: Hammer.DIRECTION_VERTICAL });
		hammer.get('swipe').set({ direction: Hammer.DIRECTION_VERTICAL });
		hammer.on('swipeup panup', function(event){
			if(myApp.isToSectionMain == false){
				//alert(event.type);
				console.log(event.type);
				myApp.isToSectionMain = true;
				
				myApp.pageHeight = myApp.elements.page.height(); //***
				
				myApp.moveToSectionMain();
				myApp.elements.pageMain.show();
			}
        });
	},
	
	hammerQrCode: function(){
		$('.qr-code').each(function(i, thiz){
			var hammer = new Hammer(thiz);
			hammer.on('press', function(event){
				Utils.sendGa('press-qr-code');
	        });
		});
	},
	
	postCollect: function(isComplete){
		Utils.ajaxPost('collect.php', {
			'times': myApp.clockTimes,
			'complete': isComplete,
			'uid': _USER_ID
		}, function(response){
			//alert(JSON.stringify(response));
			if(!response.success){ //TODO 无法获取openid
				//alert(response.msg);
				return false;
			}
		});
		
		var _desc = myApp.shareDesc.format(myApp.clockTimes);
		App.share_desc = _desc;
		App.share_title2 = _desc;
		initWechat();
	},
	postCrmApi: function(){
		//alert('postCrmApi');
		Utils.ajaxPost('crmapi.php', {
			'uid': _USER_ID
		}, function(response){
			console.log(response);
			//alert(JSON.stringify(response));
		});
	},
	
	preload: function(){
		console.log('imgpreload ' + PRELOAD_IMAGES.length);
		var $loaded = this.$panelLoading.find('.loaded');
		var $percent = this.$panelLoading.find('.loaded-percent');
		
		this.$panelLoading.find('.loading-m, .noload, .loaded-percent ').show();
		
		var imagesnum = 0;
		jQuery.imgpreload(PRELOAD_IMAGES, {
			each: function() {
				var status = $(this).data('loaded') ? 'success' : 'error';
				var v = (parseFloat(++imagesnum) / PRELOAD_IMAGES.length).toFixed(2);
				var p = Math.round(v * 100) + '%';
				$loaded.css('width', p);
				$percent.html(p);
				//console.log(p);
			},
			all: function() {
				myApp.animationLoading();
			}
		});
	},
	demoPreload: function(){
		console.log('imgpreload ' + PRELOAD_IMAGES.length);
		var $loaded = this.$panelLoading.find('.loaded');
		var $percent = this.$panelLoading.find('.loaded-percent');
		
		this.$panelLoading.find('.loading-m, .noload, .loaded-percent ').show();
		
		var demoPreloadRate = 30; //ms
		var _percent = 0;
		this.preloadInterval = window.setInterval(function(){
			_percent ++;
			
			if(_percent == 100){
				console.log('demo imgpreload ' + (demoPreloadRate * 100) + 'ms');
				window.clearInterval(myApp.preloadInterval);
				myApp.animationLoading();
			}
			
			$loaded.css('width', _percent + '%');
			$percent.html(_percent + '%');
		}, demoPreloadRate);
	},
	
	animationLoadingImg: function(){
		var loadingImgObj = $('.loading-m');
		var _loadingImg = 1;
		this.loadingInterval = window.setInterval(function(){
			//_loadingImg = _loadingImg == 1 ? 2 : 1;
			//loadingImgObj.style.backgroundImage = 'url(' + APP_URL + 'images/mojito' + _loadingImg + '.png)';
			
			if(_loadingImg == 1){
				_loadingImg = 2;
				loadingImgObj.addClass('loading-m-2');
			}
			else{
				_loadingImg = 1;
				loadingImgObj.removeClass('loading-m-2');
			}
		}, 300);
	},
	
	animationLoading: function(){
		myApp.$panelLoading.find('.loading-copy, .btn01, .btn02').show().velocity({
			opacity: 1
		}, 500);
	},
	animationGameTop: function(){
		if(myApp.isIphone4 == true){
			myApp.$panelGame.find('.word01, .arrow-key').show().css('opacity', 1);
		}
		else{
			myApp.$panelGame.find('.word01, .arrow-key').show().velocity({
				opacity: 1
			}, 500);
		}
	},
	animationFormSucc: function(){
		myApp.$panelQrcode.find('.code-word').css('top', '53%').velocity({
			top: '18%',
			opacity: 1
		}, 1000);
		
		myApp.$panelQrcode.find('.qr-code').css('top', '82%').velocity({
			top: '42%',
			opacity: 1
		}, {
            duration: 1000,
            complete: function(){

            }
        });
	},
	
    moveToSectionMain: function(){
		if(myApp.isIphone4 == true){
			//myApp.elements.page.css('top', (-myApp.pageHeight) + 'px');
			myApp.elements.page[0].style.webkitTransform = 'translate3d(0, ' + (-myApp.pageHeight) + 'px, 0)';
			
			myApp.startClock();
			
			myApp.isToSectionGame = true;
			myApp.elements.sectionMain.show();
			myApp.elements.meter.show();
		}
		else{
			myApp.elements.page.velocity({
	            top: -myApp.pageHeight
	        }, {
	            duration: 500,
				//easing: 'easeOutSine',
				complete: function(){
					myApp.startClock();
					
					myApp.isToSectionGame = true;
					myApp.elements.sectionMain.show();
					myApp.elements.meter.show();
				}
	        });
		}
    },
    moveToSectionBottom: function(){
		myApp.stopClock();
		myApp.postCollect(1);
		
		myApp.elements.btn03.addClass('animation_party');
		
		if(myApp.isIphone4 == true){
			//myApp.elements.page.css('top', (-myApp.pageHeight * 2) + 'px');
			myApp.elements.page[0].style.webkitTransform = 'translate3d(0, ' + (-myApp.pageHeight * 2) + 'px, 0)';
			
			myApp.elements.pageMain.hide();
			myApp.elements.meter.hide();

            myApp.mySkrollr.destroy();
		}
		else{
			myApp.elements.page.velocity({
	            top: -myApp.pageHeight * 2
	        }, {
	            duration: 500,
	            easing: 'easeOutSine',
	            complete: function() {
					myApp.elements.pageMain.hide();
					myApp.elements.meter.hide();

                    myApp.mySkrollr.destroy();
				}
	        });
		}
    },
    
	getClockTime: function(){
		var _text = myApp.clockTimes;
		if(myApp.clockTimes >= 60){
			var _rem = myApp.clockTimes % 60;
			_text = Math.floor(myApp.clockTimes / 60) + ':' + (_rem < 10 ? ('0' + _rem) : _rem);
		}else{
			_text = _text < 10 ? ('0' + _text) : _text;
			_text = '00:' + _text;
		}
		return _text;
	},
	startClock: function(){
		this.clockInterval = window.setInterval(function(){
			if(myApp.isLandscape == true){
				return;
			}
			myApp.clockTimes ++;
			myApp.elements.timer.text(myApp.getClockTime());
		}, 1000);
	},
	stopClock: function(){
		window.clearInterval(this.clockInterval);
		myApp.elements.time.text(myApp.getClockTime());
	},
	
	updateOrientation: function(callback){
		var orientation;
	    if(myApp.supportOrientation){
	        orientation = window.orientation;
			//alert(orientation);
	        switch(orientation){
				case 0:
					if (Utils.isAndroid()) { //window.orientation The samsung always return 0
						orientation = (window.innerWidth > window.innerHeight) ? 'landscape' : 'portrait';
					}else{ //IOS default option
						orientation = 'portrait';
					}
	                break;
	            case 90:
					/*if (Utils.isAndroid()) {
						orientation = 'landscape';
					}
					break;*/
	            case -90:
	                orientation = 'landscape';
	                break;
	            default:
	                orientation = 'portrait';
	                break;
	        }
	    }else{
	        orientation = (window.innerWidth > window.innerHeight) ? 'landscape' : 'portrait';
	    }
		
		myApp.isLandscape = (orientation == 'landscape') ? true : false;
		//alert(myApp.isLandscape);
		if(myApp.isLandscape == true){
			myApp.$panelRotate.show();
		}else{
			myApp.$panelRotate.hide();
		}
		
		if(myApp.isInitOnLandscape == true){
			myApp.mySwiper.update(); //Update swiper height
		}
		
		if(typeof(callback) == 'function'){
			callback(myApp.isLandscape);
		}
		
		return myApp.isLandscape;
	},
	
	bindOrientation: function(callback){
	    if(myApp.supportOrientation){
	        window.addEventListener('orientationchange', myApp.updateOrientation, false);
	    }else{
			window.addEventListener('resize', myApp.updateOrientation, false);
	    }
		myApp.updateOrientation(callback);
	}
	
};