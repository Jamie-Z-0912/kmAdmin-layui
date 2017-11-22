layui.define(['global', 'form', 'laydate'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer,
		layform = layui.form(), 
		laydate = layui.laydate, 
		tool = layui.global;
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
    		//加载新增所需数据
    		tool.getJspData({
    			url:'/km_task/admin/appVersion/add'
    		},function(data){
    			console.log(data);
				//将数据写入form
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#platform'),data.platforms);
				layform.render('select');
				layer.open({
					title:'广告位开关添加',
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
    	edit: function() {
    		var size = operation.con_size,
    			_self = $(this);
    		$('#addBtn').hide();
    		tool.getJspData({
    			url:'/km_task/admin/appVersion/update',
				data:{id:_self.data('id')}
    		},function(data){
    			console.log(data);
				//将数据写入form
				tool.handleSelect($('#application'),data.applications);
				tool.handleSelect($('#platform'),data.platforms);
				$('#application').val(data.application);
				$('#platform').val(data.platform);
				layform.render('select');

				$('#id').val(data.id);
				$('#added_time').val(tool.formatDate(data.addedTime, 'yyyy-MM-dd'))
					.next().val(data.addedTime);
				$('#version').val(data.version);
				//将数据写入form end
				//写入完毕
				layer.open({
					title:'广告位开关修改',
					type: 1,
					skin: 'layui-layer-rim', 
					area: [ size.w, size.h], 
					content: $('#formPane'),
					success: function(layero, index){ },
					cancel: function(){ 
						var original = operation.myform.clone();
                        $('#formPane').html(original);
					}
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
			application = d.application,
	    	platform = d.platform;
		window.location = '/km_task/admin/appVersion/list?application='+application+'&platform='+platform;
	    return false;
	});

	var addTime = {
			max: laydate.now(),
			min: '2016-10-01',
			format: 'YYYY-MM-DD',
			choose: function(d){
				$('#added_time').next().val(tool.getTimestamp(d));
			}
		};

	$('#added_time').on('click', function(){
		addTime.elem = this;
	    laydate(addTime);
	});

	layform.on('submit(update)', function(data){
		tool.submit({
            url: '/km_task/admin/appVersion/update',
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

	layform.on('submit(add)', function(data){
	    // console.log(data);
	    $('#id').attr('disabled',true);
		tool.submit({
            url: '/km_task/admin/appVersion/add',
            type: 'post',
            data: $('#myform')
        }, function(data){
        	if(/<div class="admin-main">/.test(data)){
        		location.reload();
        	}
        });	
	    return false;
	});

	exports('appVersion', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    