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
    /* 增加和操作处的点击 s */
    var operation = {
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
			layer.open({
				title:'新增系统通知',
				type: 1,
				skin: 'layui-layer-rim', 
				area: [ size.w, size.h], 
				content: $('#formPane'),
				cancel: function(){ 
					$('#reset').click()
				}
			});
    	},
    	edit: function() {
    		//admin/systemMsg/update?id=${systemMsg.id}
    		var size = operation.con_size;
    		$('#addBtn').hide();
			layer.open({
				title:'修改系统通知',
				type: 1,
				skin: 'layui-layer-rim', 
				area: [ size.w, size.h], 
				content: $('#formPane'),
				cancel: function(){ 
					$('#reset').click()
				}
			});
    	},
    	del: function() {
    		//admin/systemMsg/delete?id=${systemMsg.id}
    		console.log('删除')
    	},
    	send: function() {
    		console.log('发送')
    		var id = $(this).data('id'),
    			app =  $(this).data('app'),
    			pla =  $(this).data('pla'),
    			ver =  $(this).data('ver');
    		var str = '确认要给应用：'+(app==''?'默认':app)+ ",平台: " + pla + ",版本:" + ver + "发送通知?";
    		layer.confirm(str, {
				btn: ['确定','取消'] //按钮
			}, function(){
			    tool.baseAjax({
	        		url: '/km_task/admin/systemMsg/push',
	        		data:{id:id},
	        		type:'post'
	        	},function(d){
	        		d.status==1000?location.reload():alert("发送失败！");
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
	    window.location = '/km_task/admin/systemMsg/list?application='+application+'&platform='+platform;
	    return false;
	});
	layform.on('submit(add)', function(data){
		tool.submit({
            url: '/km_task/admin/systemMsg/add',
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
            url: '/km_task/admin/systemMsg/update',
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
		
	exports('systemMsg', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    