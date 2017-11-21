layui.define(['global', 'form', 'laypage', 'laydate', 'upload'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer,
        laypage = layui.laypage,
		layform = layui.form(), 
		laydate = layui.laydate,
		tool = layui.global;

	var totalPage = parseInt($('#totalPage').text()),
		curPage = parseInt($('#curPage').text());
	laypage({
		cont: 'page', pages: totalPage, groups: 5, skip: true, curr: curPage,
        jump: function(obj){
            var page = tool.getQueryValue('page');
            var cur_href =  window.location.href;
            if(page==""){ page=1; }
            if(obj.curr!=page){
            	if(/\?/.test(cur_href)){
            		if(/page=/.test(cur_href)){
            			window.location = cur_href.split('page=')[0] +'page='+obj.curr;
            		}else{
            			window.location = cur_href+'&page='+obj.curr;
            		}
            	}else{
            		window.location = cur_href +'?page='+obj.curr;
            	}
            }
        }
    });

	/** 查询的时间设置 **/
	var q_stime = tool.getQueryValue('startTime');
	if(q_stime == ""){
		$('#q_startTime').val(laydate.now());
	}else{
		$('#q_startTime').val(tool.formatDate(q_stime, 'yyyy-MM-dd'));
	}
	$('#q_startTime').on('click', function(){
		var self = this;
	    laydate({
	    	elem: self,
			max: laydate.now(),
			min: '2016-10-01',
			value: new Date(),
			istime: false,
			format: 'YYYY-MM-DD',
			choose: function(datas){ }
		});
	});
		/* 增加修改的时间设置 */
	var dt = {
		start:{
			min: laydate.now(),
			max: '2099-06-16',
			istoday: false,
			format: 'YYYY-MM-DD',
			choose: function(d){
				dt.end.min = d; //开始日选好后，重置结束日的最小日期
				dt.end.start = d; //将结束日的初始值设定为开始日
				$('#startTime').next().val(tool.getTimestamp(d));
			}
		},
		end:{
	    	min: laydate.now(),
	    	max: '2099-06-16',
	    	istoday: false,
			format: 'YYYY-MM-DD',
	    	choose: function(d){
	      		dt.start.max = d; //结束日选好后，重置开始日的最大日期
				$('#endTime').next().val(tool.getTimestamp(d,'23:59:59'));
	    	}
	  	}
	}
	$('#startTime').on('click', function(){
		dt.start.elem = this; laydate(dt.start);
	});
	$('#endTime').on('click', function(){
	    dt.end.elem = this; laydate(dt.end);
	});
		/* 统计查询的时间设置 */
	var tj = {
		start:{
			min: '2016-10-01 00:00:00',
			max: laydate.now(),
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
			choose: function(d){
				tj.end.min = d;
				tj.end.start = d;
			}
		},
		end:{
			min: '2016-10-01 00:00:00',
			max: laydate.now(),
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
	    	choose: function(d){
	      		tj.start.max = d;
	    	}
  		}
	}
	$('#startTimeTj').on('click', function(){
		tj.start.elem = this; laydate(tj.start);
	})
	$('#endTimeTj').on('click', function(){
		tj.end.elem = this; laydate(tj.end);
	});
	/******* 时间设置结束 **********/

    
    /* 新增和操作处的点击 s */
    var operation = {
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/ads/add'
    		},function(data){
				//将数据写入form
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#platform'),data.platforms);
				tool.handleSelect($('#layout'),data.layouts,'layout','desc');
				tool.handleSelect($('#adsLocation'),data.adsLocations,'location','desc');
				layform.render('select');
				layer.open({
					title:'新增广告位',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#reset').click();
						$('#fileWrap .img').remove();
						$('#addTuPian').click();
						dt.start.max = dt.end.max = '2099-06-16';
						dt.end.min = dt.end.start = laydate.now();
					}
				});
			});
    	},
    	edit: function() {
    		var id = $(this).data('id');
    		var size = operation.con_size;
    		$('#addBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/ads/update/'+id,
    		},function(data){
    			console.log(data);
    			var ad = data.ad;
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#platform'),data.platforms);
				tool.handleSelect($('#layout'),data.layouts,'layout','desc');
				tool.handleSelect($('#adsLocation'),data.adsLocations,'location','desc');
				if(ad.needLogin=="true"){
					$('#needLogin').val(1);
					$('#needLoginShow').attr('checked',true);
				}else{
					$('#needLogin').val(0);
				}
				layform.render();
				$('#myform input[name="id"]').val(ad.id).attr('disabled',false);
				$('#title').val(ad.title);
				$('#images').val(ad.imagesList.join(','));
				for (var i = 0; i < ad.imagesList.length; i++) {
					$('#fileWrap .img').eq(i).find('img').attr('src',ad.imagesList[i]).removeClass('hide');
					if(i+1 < ad.imagesList.length) $('#addTuPian').click();
				};
				$('#source').val(ad.source);
				$('#originUrl').val(ad.originUrl);
				$('#adsLocation').val(ad.adsLocation);
				$('#application').val(data.application);
				$('#platform').val(ad.platform);
				$('#layout').val(ad.layout);
				$('#startTime').val(tool.formatDate(ad.startTime, 'yyyy-MM-dd'))
					.next().val(ad.startTime);
				$('#endTime').val(tool.formatDate(ad.endTime, 'yyyy-MM-dd'))
					.next().val(ad.endTime);
				$('#tips').val(ad.tips);
				layer.open({
					title:'修改广告位',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#reset').click();
						$('#myform input[name="id"]').attr('disabled',true);
						$('#fileWrap .img').remove();
						$('#addTuPian').click();
						dt.start.max = dt.end.max = '2099-06-16';
						dt.end.min = dt.end.start = laydate.now();
					}
				});
			});
    	},
    	toTop: function() {
    		var id = $(this).data('id');
    		layer.confirm('您确认要置顶此广告吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
			    tool.baseAjax({
	        		url: '/km_task/admin/ads/top',
	        		data:{ id: id },
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("操作失败！");
	        	});
			});
    	},
    	up: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要上架此广告吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
			    tool.baseAjax({
	        		url: '/km_task/admin/ads/up',
	        		data:{
	        			id: id,
	        			status:'1'
	        		},
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("操作失败！");
	        	});
			});
    	},
    	down: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要下架此广告吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
	        	tool.baseAjax({
	        		url: '/km_task/admin/ads/down',
	        		data:{
	        			id: id,
	        			status:'0'
	        		},
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("操作失败！");
	        	});
			});
    	},
    	viewTj: function(hasOpen,opt){
    		var size = operation.con_size;
    		tool.getJspData({
    			url:'/km_task/admin/ads/tj',
    			data:opt
    		},function(data){
    			var ad = data.ad,str='';
    			$('#tjAdTitle').html('<a href="'+ad.originUrl+'">'+ad.title+'</a>');
    			if(data.tjData.length==0){
    				str = '<tr><td colspan="5">暂时没有数据</td></tr>';
    			}else{
	    			for (var i = 0; i < data.tjData.length; i++) {
	    				var d = data.tjData[i];
	    				str+='<tr><td>'+d.date+'</td><td>'+d.uv+'</td><td>'+d.viewNum+'</td><td>'+d.click+'</td><td>'+d.clickUser+'</td></tr>'
	    			};
    			}
    			$('#tjAdData').html(str);
    			if(!hasOpen){
	    			var t_day = new Date().toLocaleDateString().replace(/\//g,'-');
	    			$('#startTimeTj').val(t_day+' 00:00:00');
	    			$('#endTimeTj').val(t_day+' 23:59:59');
	    			$('#id').val(opt.id);
					layer.open({
						title:'统计',
						type: 1,
						skin: 'layui-layer-rim', 
						area: [ size.w, size.h], 
						content: $('#formPane2'),
						cancel: function(){ 
							$('#reset').click()
						}
					});
    			}
    		});
    	},
    	tongji: function() {
    		var id = $(this).data('id');
    		operation.viewTj(false,{id:id});
    	}
    }
	$('.js-operation').on('click', function(){
	    var type = $(this).data('type');
	    operation[type].call(this);
	});	
	/* 上传图片方法 s */
	var imgNum = 0;
	layui.upload({
		elem:'input[type="file"]',
        before: function(input){
        },
        after: function(d,input){
        	console.log(d);
        	var imgs = $('#images').val();
        	if(imgs == ''){
        		$('#images').val(d.data.url);
        	}else{
        		var arr = imgs.split(',');
        		var cur_n = $(input).parent().index();
        		if(cur_n < arr.length){
        			$('#images').val(imgs+','+d.data.url);
        		}else{
        			arr[cur_n] = d.data.url;
        			$('#images').val(arr.join(','));
        		}

        	}
        }
	});
	//多图添加
	var upimg = $('#fileWrap .layui-upimg:first-child').clone();
	$('#addTuPian').on('click', function(){
		if($('#fileWrap .layui-upimg img').hasClass('hide')){
        	layer.msg("有未上传图片的空位！", {time:1500, icon: 2});
		}else{
			var $el = $(this), file = upimg.clone();
			$el.before(file);
		}
	});
	//多图删除
	$('#fileWrap').on('click', '.js-del', function(){
		var del = $(this), par = del.parent();
		if(par.find('.hide').length>0){
			par.remove();
		}else{
			var imgs = $('#images').val(),arr = imgs.split(',');
    		var cur_n = par.index();
    		if(cur_n < arr.length){
    			arr.remove(cur_n);
    			$('#images').val(arr.join(','));
				par.remove();
    		}else{
				par.remove();
    		}
		}
	})

	$('#sogouLink').on('click', function(){
        var txt = $('#originUrl').val();
        var url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=https://wap.sogou.com/web/sl?bid=sogou-mobb-b4892f808f9efbd5&keyword=';
        $('#originUrl').val(url+encodeURI(txt));
	})
	layform.on('select(adsLocation)', function(data){
		var v = data.value;
        console.log(v);
        if(v == 'timeline_first'){
            $('#sogouLink').show();
        }else{
            $('#sogouLink').hide();
            var url;
            var txt = $('#originUrl').val();
            switch(v){
                case 'related_recom_first': //相关推荐第一位
                    url = 'http://browser.kuaima.cn/tongji/2feedFirstAD.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
                case 'checkin_alert': //签到弹窗
                    url = 'http://browser.kuaima.cn/tongji/4qianDao.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
                case 'km_zq_banner': //我的tab 的banner
                    url = 'http://browser.kuaima.cn/tongji/3zhuanQian.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
                case 'announcement': //小喇叭
                    url = 'http://browser.kuaima.cn/tongji/6taskTrumpet1_3_0.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
                case 'km_task_banner': //任务tab的banner
                    url = 'http://browser.kuaima.cn/tongji/5taskBanner1_3_0.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
                case 'task_tab_upper_right_icon': //任务tab的右上角
                    url = 'http://browser.kuaima.cn/tongji/7taskTopRight1_3_0.html?url=';
                    $('#originUrl').val(url+encodeURI(txt));
                    break;
            }
        }
	});
	
	layform.on('switch(needLogin)', function(data){
		if(this.checked){
			$('#needLogin').val('1');
		}else{
			$('#needLogin').val('0');
		}
  	});

	//监听提交
	layform.on('submit(check)', function(data){
		var d = data.field,
			application = d.application,
			keyword = d.keyword,
	    	platform = d.platform,
	    	adsLocation = d.adsLocation,
	    	status = d.status,
	    	s_time =  tool.getTimestamp(d.startTime);
	    window.location = '/km_task/admin/ads/list?application='+application+'&keyword='+keyword+'&platform='+platform+'&adsLocation='+adsLocation+'&status='+status+'&startTime='+s_time;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/ads/add',
            type: 'post',
            data: $('#myform')
        }, function(data){
        	if(/<div class="admin-main">/.test(data)){
        		location.reload();
        	}else{
        		layer.msg(data, { icon: 2, shift: 6});
        	}
        });	
	    return false;
	});
	layform.on('submit(update)', function(data){
		tool.submit({
            url: '/km_task/admin/ads/update',
            type: 'post',
            data: $('#myform')
        }, function(data){
        	if(/<div class="admin-main">/.test(data)){
        		location.reload();
        	}else{
        		layer.msg(data, { icon: 2, shift: 6});
        	}
        });	
	    return false;
	});
	layform.on('submit(showTj)', function(data){
		var d = data.field,
			id = d.id,
	    	s_time = tool.getTimestamp(d.startTime, true),
	    	e_time = tool.getTimestamp(d.endTime, true);
	    operation.viewTj(true,{id:id,startTime:s_time,endTime:e_time});
		return false;
	})
		
	exports('ads', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    