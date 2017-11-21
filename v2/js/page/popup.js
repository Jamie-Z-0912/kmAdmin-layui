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

	var tDay = new Date(),
		q_stime = tool.getQueryValue('start_time'),
		q_etime = tool.getQueryValue('end_time');

	if(q_stime == ""){
		// var today = tDay.toLocaleDateString().split('/');
		// $('#q_startTime').val(today[0]+'-'+today[1]+'-01');
	}else{
		$('#q_startTime').val(tool.formatDate(q_stime, 'yyyy-MM-dd'));
	}
	if(q_etime == ""){
		// $('#q_endTime').val(tDay.toLocaleDateString().replace(/\//g,'-'));
	}else{
		$('#q_endTime').val(tool.formatDate(q_etime , 'yyyy-MM-dd'));
	}
	/* 查询的 开始和结束时间 */
	var query = {
		start:{
			max: laydate.now(),
			min: '2016-10-01',
			value: new Date(),
			istime: false,
			format: 'YYYY-MM-DD',
			choose: function(datas){
				query.end.min = datas;
				query.end.start = datas;
			}
		},
		end:{
			min: '2016-10-01',
			max: laydate.now(),
			value: laydate.now(),
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
	/* 查询的 开始和结束时间 e */
    
    /* 增加和操作处的点击 s */
    var operation = {
    	con_size: {
    		h:(innerHeight-60)+'px',
    		w:innerWidth<480?(innerWidth-20)+'px':'480px'
    	},
    	add: function() {
    		var size = operation.con_size;
    		$('#updateBtn').hide();
    		//admin/popup/add?application=" + v;
			layer.open({
				title:'新增弹窗',
				type: 1,
				skin: 'layui-layer-rim', 
				area: [ size.w, size.h], 
				content: $('#formPane'),
				cancel: function(){ 
					$('#reset').click();
					editDate.end.min = laydate.now();
					editDate.end.start = '2099-06-16 23:59:59';
					query.start.max = '2099-06-16 23:59:59';
				}
			});
    	},
    	edit: function() {
    		//admin/popup/update/${popup.id}
    		var size = operation.con_size;
    		$('#addBtn').hide();
			layer.open({
				title:'修改弹窗',
				type: 1,
				skin: 'layui-layer-rim', 
				area: [ size.w, size.h], 
				content: $('#formPane'),
				cancel: function(){ 
					$('#reset').click();
					editDate.end.min = laydate.now();
					editDate.end.start = '2099-06-16 23:59:59';
					query.start.max = '2099-06-16 23:59:59';
				}
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
				btn: ['确定','取消'] //按钮
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
	/* 增加和操作处的点击 e */
	var editDate = {
		start:{
			min: laydate.now(),
			max: '2099-06-16 23:59:59',
			start: '2014-6-15 23:00:00',
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
			choose: function(datas){
				editDate.end.min = datas; //开始日选好后，重置结束日的最小日期
				editDate.end.start = datas //将结束日的初始值设定为开始日
			}
		},
		end:{
	    	min: laydate.now(),
	    	max: '2099-06-16 23:59:59',
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
	    	choose: function(datas){
	      		editDate.start.max = datas; //结束日选好后，重置开始日的最大日期
	    	}
  		}
	}
	$('#startTime').on('click', function(){
	    editDate.start.elem = this;
	    laydate(editDate.start);
	});
	$('#endTime').on('click', function(){
	    editDate.end.elem = this
	    laydate(editDate.end);
	})
	
	/* 查询的 开始和结束时间 */
	var query = {
		start:{
			min: laydate.now(),
			max: '2099-06-16 23:59:59',
			start: '2014-6-15 23:00:00',
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
			choose: function(datas){
				query.end.min = datas; //开始日选好后，重置结束日的最小日期
				query.end.start = datas //将结束日的初始值设定为开始日
			}
		},
		end:{
	    	min: laydate.now(),
	    	max: '2099-06-16 23:59:59',
			istime: true,
			format: 'YYYY-MM-DD hh:mm:ss',
	    	choose: function(datas){
	      		query.start.max = datas; //结束日选好后，重置开始日的最大日期
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
	/* 查询的 开始和结束时间 e */
	/* 上传图片方法 s */
	layui.upload({
		elem:'input[type="file"]',
        before: function(input){
        	console.log('文件上传中');
        },
        after: function(d){
        	console.log(d);
        	var imgs = $('#images').val();
        	if(imgs == ''){
        		$('#images').val(d.data.url);
        	}else{
        		$('#images').val(imgs+','+d.data.url);
        	}
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
	    	e_time =  tool.getTimestamp(d.endTime);
		window.location = '/km_task/admin/popup/list?platform='+platform+'&location='+location+'&status='+status+'&startTime='+s_time+'&endTime='+e_time;
	    return false;
	});
	layform.on('submit(add)', function(data){
	    console.log(data)
	    return false;
	});
	layform.on('submit(update)', function(data){
	    console.log(data)
	    return false;
	});
		
	exports('popup', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    