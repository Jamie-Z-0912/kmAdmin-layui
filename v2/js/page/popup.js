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

	var q_stime = tool.getQueryValue('startTime'),
		q_etime = tool.getQueryValue('endTime');
	if(q_stime == ""){
		$('#q_startTime').val(laydate.now());
	}else{
		$('#q_startTime').val(tool.formatDate(q_stime, 'yyyy-MM-dd'));
	}
	if(q_etime == ""){
		$('#q_endTime').val(laydate.now());
	}else{
		$('#q_endTime').val(tool.formatDate(q_etime , 'yyyy-MM-dd'));
	}
	/* 查询的 开始和结束时间 */
	var query = {
		start:{
			min: '2016-10-01',
			format: 'YYYY-MM-DD',
			choose: function(datas){
				query.end.min = datas;
				query.end.start = datas;
			}
		},
		end:{
			min: '2016-10-01',
			istime: false,
			format: 'YYYY-MM-DD',
	    	choose: function(datas){
	      		query.start.max = datas;
	    	}
  		}
	}
	$('#q_startTime').on('click', function(){
		query.start.elem = this;
	    laydate(query.start);
	})
	$('#q_endTime').on('click', function(){
		query.end.elem = this;
	    laydate(query.end);
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
    
    /* 增加和操作处的点击 s */
    var operation = {
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/popup/add'
    		},function(data){
    			console.log(data)
				tool.handleSelect($('#platform'),data.platforms);
				tool.handleSelect($('#location'),data.popupLocations,'location','desc');
				tool.handleSelect($('#userGroups'),data.userGroups,'group','groupName');
				layform.render('select');
				layer.open({
					title:'新增弹窗',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#reset').click();
						dt.start.max = dt.end.max = '2099-06-16';
						dt.end.min = dt.end.start = laydate.now();
					}
				});
    		})
    	},
    	edit: function() {
    		var id = $(this).data('id');
    		var size = operation.con_size;
    		$('#addBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/popup/update/'+id,
    		},function(data){
    			console.log(data);
    			var pop = data.popup;
				tool.handleSelect($('#platform'),data.platforms);
				tool.handleSelect($('#location'),data.popupLocations,'location','desc');
				tool.handleSelect($('#userGroups'),data.userGroups,'group','groupName');
				if(pop.needLogin=="true"){
					$('#needLogin').val(1);
					$('#needLoginShow').attr('checked',true);
				}else{
					$('#needLogin').val(0);
				}
				layform.render();
				$('#myform input[name="id"]').val(pop.id).attr('disabled',false);
				$('#title').val(pop.title);
				$('#image').val(pop.image);
				$('.img img').attr('src',pop.image).removeClass('hide');
				$('#platform').val(pop.platform);
				$('#location').val(pop.location);
				$('#userGroups').val(pop.userGroups);
				$('#url').val(pop.url);
				$('#num').val(pop.num);
				$('#startTime').val(tool.formatDate(pop.startTime, 'yyyy-MM-dd'))
					.next().val(pop.startTime);
				$('#endTime').val(tool.formatDate(pop.endTime, 'yyyy-MM-dd'))
					.next().val(pop.endTime);

				layer.open({
					title:'修改弹窗',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#reset').click();
						$('#myform input[name="id"]').attr('disabled',true);
						$('.img img').attr('src','').addClass('hide');
						dt.start.max = dt.end.max = '2099-06-16';
						dt.end.min = dt.end.start = laydate.now();
					}
				});
			});
    	},
    	up: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要上架此弹窗吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
			    tool.baseAjax({
	        		url: '/km_task/admin/popup/up',
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
    		layer.confirm('您确认要下架此弹窗吗？', {
				btn: ['确定','取消']
			}, function(){
	        	tool.baseAjax({
	        		url: '/km_task/admin/popup/down',
	        		data:{
	        			id: id,
	        			status:'0'
	        		},
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("操作失败！");
	        	});
			});
    	}
    }
	$('.js-operation').on('click', function(){
	    var type = $(this).data('type');
	    operation[type].call(this);
	});
	layform.on('switch(needLogin)', function(data){
		if(this.checked){
			$('#needLogin').val('1');
		}else{
			$('#needLogin').val('0');
		}
  	});

	/* 上传图片方法 s */
	layui.upload({
		elem:'input[type="file"]',
        before: function(input){
        	console.log('文件上传中');
        },
        after: function(d){
        	$('#image').val(d.data.url);
        }
	});
    /* 上传图片方法 end */

	//监听提交
	layform.on('submit(check)', function(data){
		var d = data.field,
	    	platform = d.platform,
	    	location = d.location,
	    	status = d.status,
	    	s_time =  tool.getTimestamp(d.startTime),
	    	e_time =  tool.getTimestamp(d.endTime,' 23:59:59');
		window.location = '/km_task/admin/popup/list?platform='+platform+'&location='+location+'&status='+status+'&startTime='+s_time+'&endTime='+e_time;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/popup/add',
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
            url: '/km_task/admin/popup/update',
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
		
	exports('popup', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    