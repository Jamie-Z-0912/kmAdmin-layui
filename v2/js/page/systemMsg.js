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
        myform: $('#myform').clone(),
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
            $('#updateBtn').hide();
            tool.getJspData({
                url:'/km_task/admin/systemMsg/add'
            },function(data){
                console.log(data)
                tool.handleSelect($('#versions'),data.versions);
                $('#versions option:first-child').before($('<option value="" selected>所有版本</option>'))
                tool.handleSelect($('#platform'),data.platforms);
                tool.handleSelect($('#clickActionType'),data.msgActions,'type','desc');
                $('#clickActionType').val('2')
                tool.handleSelect($('#application'),data.applications);
                layform.render('select');
    			layer.open({
    				title:'新增系统通知',
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
                url:'/km_task/admin/systemMsg/update',
                data:{id:id}
            },function(data){
                var sysMsg = data.systemMsg;
                tool.handleSelect($('#versions'),data.versions);
                $('#versions option:first-child').before($('<option value="" selected>所有版本</option>'))
                tool.handleSelect($('#platform'),data.platforms);
                tool.handleSelect($('#clickActionType'),data.msgActions,'type','desc');
                tool.handleSelect($('#application'),data.applications);
                $('#versions').val(sysMsg.versions);
                $('#application').val(data.application);
                $('#platform').val(sysMsg.platform);
                $('#clickActionType').val(sysMsg.clickActionType);
                layform.render('select');
                $('#myform input[name="id"]').val(sysMsg.id).attr('disabled',false);
                $('#msg').val(sysMsg.msg);
                $('#action').val(sysMsg.action);
                if(sysMsg.needLogin=="true"){
                    $('#needLogin').val(1);
                    $('#needLoginShow').attr('checked',true);
                }else{
                    $('#needLogin').val(0);
                }
                if(sysMsg.image&&sysMsg.image!=''){
                    $('#image').val(sysMsg.image);
                    $('.img img').attr('src',sysMsg.image).removeClass('hide');
                }
                if(sysMsg.sendTime=='0'){
                    $('#send_time').val('').next().val(0);
                }else{
                    $('#send_time').val(tool.formatDate(sysMsg.sendTime, 'yyyy-MM-dd hh:mm:ss'))
                        .next().val(sysMsg.sendTime);
                }

    			layer.open({
    				title:'修改系统通知',
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
    	del: function() {
            layer.load(2);
            var id = $(this).data('id');
            window.location = '/km_task/admin/systemMsg/delete?id='+id;
    	},
    	send: function() {
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
        /* 增加修改的时间设置 */
    var dt = {
        send:{
            min: laydate.now(),
            max: '2099-06-16 00:00:00',
            isTime: true,
            format: 'YYYY-MM-DD hh:mm:ss',
            choose: function(d){
                $('#send_time').next().val(tool.getTimestamp(d,true));
            }
        }
    }
    $('#send_time').on('click', function(){
        dt.send.elem = this; laydate(dt.send);
    });
	/* 增加和操作处的点击 e */
	$('#clearSendTime').on('click', function(){
        $('#send_time').val('').next().val('0');
    })
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