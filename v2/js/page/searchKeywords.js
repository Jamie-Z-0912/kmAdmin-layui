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
	var source = tool.getQueryValue('source'),url = tool.getQueryValue('url');
	$('#queryForm input[name="source"]').val(source);
	$('#queryForm input[name="url"]').val(url);
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
        myform: $('#myform').clone(),
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/searchKeywords/add'
    		},function(data){
    			console.log(data);
				tool.handleSelect($('#platform'),data.platforms);
				layform.render('select');
				layer.open({
					title:'新增搜索',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						var original = operation.myform.clone();
	                    $('#formPane').html(original);
					}
				});
			})
    	},
    	edit: function() {
    		var id = $(this).data('id');
    		var size = operation.con_size;
    		$('#addBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/searchKeywords/update',
    			data:{id:id}
    		},function(data){
    			console.log(data);
				$('#myform input[name="id"]').val(id).attr('disabled',false);
				tool.handleSelect($('#platform'),data.platforms);
				$('#platform').val(data.ad.platform);
				layform.render('select');
				var kw = data.keyword;
				$('#keyword').val(kw.keyword);
				$('#url').val(kw.url);
				$('#source').val(kw.source);
				$('#putNum').val(kw.putNum);
				$('#startTime').val(tool.formatDate(kw.startTime, 'yyyy-MM-dd'))
					.next().val(kw.startTime);
				$('#endTime').val(tool.formatDate(kw.endTime, 'yyyy-MM-dd'))
					.next().val(kw.endTime);

				layer.open({
					title:'修改搜索',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						var original = operation.myform.clone();
	                    $('#formPane').html(original);
					}
				});
			});
    	},
    	up: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要执行此操作？', {
				btn: ['确定','取消'] //按钮
			}, function(){
            	layer.load(2);
			    tool.baseAjax({
	        		url: '/km_task/admin/searchKeywords/show',
	        		data:{id: id},
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("操作失败！");
	        	});
			});
    	},
    	down: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要执行此操作？', {
				btn: ['确定','取消']
			}, function(){
            	layer.load(2);
	        	tool.baseAjax({
	        		url: '/km_task/admin/searchKeywords/shutdown',
	        		data:{id: id},
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
	/* 增加和操作处的点击 e */

	//监听提交
	layform.on('submit(check)', function(data){
		var d = data.field,
	    	source = d.source,
	    	url = d.url,
	    	s_time =  tool.getTimestamp(d.startTime),
	    	e_time =  tool.getTimestamp(d.endTime,' 23:59:59');
		window.location = '/km_task/admin/searchKeywords/list?startTime='+s_time+'&endTime='+e_time+'&url='+url+'&source='+source;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/searchKeywords/add',
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
            url: '/km_task/admin/searchKeywords/update',
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
		
	exports('searchKeywords', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    