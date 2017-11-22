layui.define(['global', 'form', 'upload'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer,
		layform = layui.form(), 
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
    			url:'/km_task/admin/adLocation/add'
    		},function(data){
    			console.log(data);
				//将数据写入form
				tool.handleSelect($('#application'),data.applications);
				var str = '';
				for (var i = 0; i < data.platforms.length; i++) {
					i===0&&(str='');
					var cur_v = data.platforms[i];
					str += '<input type="checkbox" title="'+cur_v+'" value="'+cur_v+'" lay-filter="platform">';
				};
				$('#platforms').html(str);
				for (var i = 0; i < data.layouts.length; i++) {
					i===0&&(str='');
					var cur_v = data.layouts[i];
					str += '<input type="checkbox" title="'+cur_v+'" value="'+cur_v+'" lay-filter="layout" lay-skin="primary">';
				};
				$('#layouts').html(str);
				for (var i = 0; i < data.versions.length; i++) {
					i===0&&(str='');
					var cur_v = data.versions[i];
					str += '<input type="checkbox" title="'+cur_v+'" value="'+cur_v+'" lay-filter="version" lay-skin="primary">';
				};
				$('#versions').html(str);
				for (var i = 0; i < data.adChannels.length; i++) {
					i===0&&(str='');
					var cur_v = data.adChannels[i];
					str += '<input type="checkbox" title="'+cur_v+'" value="'+cur_v+'" lay-filter="adsType" lay-skin="primary">';
				};
				$('#adsTypes').html(str);
				layform.render();
				layer.open({
					title:'新增',
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
    		var size = operation.con_size;
    		var id = $(this).data('id');
    		$('#addBtn').hide();
    		//加载新增所需数据
    		tool.getJspData({
    			url:'/km_task/admin/adLocation/update',
    			data:{id:id}
    		},function(data){
				tool.handleSelect($('#application'),data.applications);
				$('#application').val(data.application);
				layform.render('select');

				$('#platforms,#versions,#layouts,#adsTypes').hide();
				$('#location').val(data.adLocation.location).attr('disabled',true);
				$('#desc').val(data.adLocation.desc);
				$('#platform,#version,#layout,#adsType').attr('type','text').parent().removeClass('layui-hide');
				$('#platform').val(data.adLocation.platform);
				$('#version').val(data.adLocation.version);
				$('#layout').val(data.adLocation.layout);
				$('#adsType').val(data.adLocation.adsType);
				if(data.adLocation.img!=''){
					$('#img').val(data.adLocation.img);
					$('.img img').attr('src',data.adLocation.img).removeClass('hide');
				}
				$('#remarks').val(data.remarks);
				layer.open({
					title:'修改',
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
    	del: function(){
    		var id = $(this).data('id');
    		window.location = '/km_task/admin/adLocation/delete?id='+id;
    	},
    	onOff: function(){
			var loc = $(this).attr('data-location'),
				app = $(this).attr('data-application');
    		tool.getJspData({
    			url:'/km_task/admin/adLocationConfig/list',
    			data:{
    				location: loc,
    				application: app
    			}
    		},function(data){
    			console.log(data);
    		});
    	}
    }
	$('.js-operation').on('click', function(){
	    var type = $(this).data('type');
	    operation[type].call(this);
	});
	/* 增加和操作处的点击 e */

	layui.upload({
		elem:'input[type="file"]',
        before: function(input){
        	console.log('文件上传中');
        },
        after: function(d){
        	console.log(d);
        	$('#img').val(d.data.url);
        }
	})

    /* 显示图片 */
	$('.ad_position img').on('click', function(){
		var _self = $(this), img = '<img src="'+ _self.attr('src')+ '" class="ad_position_show" />';
		layer.open({
			type:4,
			shadeClose: true,
			content:[img, _self.parent()]
		})
	})
    /* 复选框方法 */
	function checkbox_val(plat, cruVal, isCheck){
		var value = $('input[name="'+ plat +'"]').val();
	    if(isCheck){
	    	if(value==''){
				$('input[name="'+ plat +'"]').val(cruVal)
	    	}else{ 
	    		$('input[name="'+ plat +'"]').val(value+','+cruVal)
	    	}
	    }else{
	    	var _v = value.split(','),v=[];
	    	if(_v.length==1) $('input[name="'+ plat +'"]').val('');
	    	else{
	    		for (var i = 0; i < _v.length; i++) {
	    			if(_v[i] != cruVal){
	    				v.push(_v[i]);
	    			}
	    		};
	    		$('input[name="'+ plat +'"]').val(v.join(','));
	    	}
	    }
	    console.log($('input[name="'+ plat +'"]').val());
	}

	layform.on('checkbox(platform)', function(data){
	    checkbox_val('platform',data.value,data.elem.checked)
	});

	layform.on('checkbox(version)', function(data){
	    checkbox_val('version',data.value,data.elem.checked)
	});

	layform.on('checkbox(layout)', function(data){
	    checkbox_val('layout',data.value,data.elem.checked)
	});

	layform.on('checkbox(adsType)', function(data){
	    checkbox_val('adsType',data.value,data.elem.checked)
	});
	//监听提交
	layform.on('submit(check)', function(data){
		var d = data.field, application = d.application;
		window.location = '/km_task/admin/adLocation/list?application='+application;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/adLocation/add',
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
		$('#location').attr('disabled',false);
		tool.submit({
            url: '/km_task/admin/adLocation/update',
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
		
	exports('adLocation', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    