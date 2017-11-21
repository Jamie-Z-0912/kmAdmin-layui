layui.define(['global', 'form', 'laydate'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer,
		layform = layui.form(),
		laydate = layui.laydate, 
		tool = layui.global;

	var tDay = new Date(),
		q_stime = tool.getQueryValue('start_time'),
		q_etime = tool.getQueryValue('end_time');

	if(q_stime == ""){
		var today = tDay.toLocaleDateString().split('/');
		$('#q_startTime').val(today[0]+'-'+today[1]+'-01');
	}else{
		$('#q_startTime').val(tool.formatDate(q_stime, 'yyyy-MM-dd'));
	}
	if(q_etime == ""){
		$('#q_endTime').val(tDay.toLocaleDateString().replace(/\//g,'-'));
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
    	derived: function(){
    		var starttime = tool.getTimestamp($('#q_startTime').val()),
    			endtime = tool.getTimestamp($('#q_endTime').val(),'23:59:59');
    		window.location = "/km_task/admin/dashboard/export?start_time=" + starttime + "&end_time=" + endtime;
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
			starttime = tool.getTimestamp(d.startTime),
	    	endtime = tool.getTimestamp(d.endTime,'23:59:59');
	    window.location = '/km_task/admin/dashboard/read?start_time=' + starttime + '&end_time=' + endtime;
	    return false;
	});
	
		
	exports('daRead', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    