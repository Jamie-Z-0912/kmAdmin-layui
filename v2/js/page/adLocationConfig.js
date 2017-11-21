layui.define(['global', 'form'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer,
		layform = layui.form(), 
		tool = layui.global;

    /* 增加和操作处的点击 s */
    var operation = {
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
    		//加载新增所需数据
    		tool.getJspData({
    			url:'/km_task/admin/adLocationConfig/add'
    		},function(data){
    			console.log(data);
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#platform'),data.platforms);
				tool.handleSelect($('#version'),data.versions);
				tool.handleSelect($('#location'),data.locations,'location','desc');
				tool.handleSelect($('#layout'),data.layouts,'layout','desc');
				tool.handleSelect($('#adsType'),data.adChannels,'type','desc');
				layform.render('select');

				layer.open({
					title:'添加',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#updateBtn').show();
						$('#reset').click();
					}
				});
    		});
    	},
    	edit: function() {
    		var size = operation.con_size;
    		var id = $(this).data('id');
    		$('#addBtn').hide();
    		//加载新增所需数据
    		tool.getJspData({
    			url:'/km_task/admin/adLocationConfig/update',
    			data:{id:id}
    		},function(data){
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#location'),data.locations,'location','desc');
				tool.handleSelect($('#layout'),data.layouts,'layout','desc');
				tool.handleSelect($('#adsType'),data.adChannels,'type','desc');

				var adConfig = data.adLocationConfig;
				$('#application').val(adConfig.application);
				$('#platform').html('<option value="'+ adConfig.platform +'" selected>'+ adConfig.platform +'</option>').attr('disabled',true);
				$('#version').html('<option value="'+ adConfig.version +'" selected>'+ adConfig.version +'</option>').attr('disabled',true);
				$('#location').val(adConfig.location);
				$('#layout').val(adConfig.layout);
				$('#adsType').val(adConfig.adsType);
				layform.render('select');
				$('#adAppId').val(adConfig.adAppId);
				$('#thirdLocationId').val(adConfig.thirdLocationId);
				$('#remarks').val(adConfig.remarks);
				$('#platform, #version, #location').attr('disabled',true);
				layer.open({
					title:'修改',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					cancel: function(){ 
						$('#addBtn').show();
						$('#reset').click();
					}
				});
    		});
    	},
    	up: function(){
    		var id = $(this).data('id');
    		layer.confirm('您确认要打开此广告位开关吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
			    tool.baseAjax({
	        		url: '/km_task/admin/adLocationConfig/updateStatus',
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
    		layer.confirm('您确认要关闭此广告位开关吗？', {
				btn: ['确定','取消'] //按钮
			}, function(){
	        	tool.baseAjax({
	        		url: '/km_task/admin/adLocationConfig/updateStatus',
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
	/* 增加和操作处的点击 e */

	//事件监听
	// layform.on('select', function(data){
	//     console.log(data);
	// });

	//监听提交
	layform.on('submit(check)', function(data){
		var d = data.field, 
			app = d.application,
			pla = d.platform,
			loc = d.location,
			ver = d.version;
		window.location = '/km_task/admin/adLocationConfig/list?application='+app+'&platform='+pla+'&location='+loc+'&version='+ver;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/adLocationConfig/add',
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
		$('#platform, #version, #location').attr('disabled',false);
		tool.submit({
            url: '/km_task/admin/adLocationConfig/update',
            type: 'post',
            data: $('#myform')
        }, function(data){
        	if(/<div class="admin-main">/.test(data)){
        		location.reload();
        	}else{
        		layer.msg(data, { icon: 2, shift: 6});
        	}

        });	
	})
		
	exports('adLocationConfig', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    