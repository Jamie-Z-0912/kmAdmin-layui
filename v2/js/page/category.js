layui.define(['global', 'form', 'laypage', 'laydate'], function(exports){
	var $ = layui.jquery, 
		layer = layui.layer, 
        laypage = layui.laypage;
    
    /*分页*/
    laypage({
        cont: 'page', pages: 100, groups: 5, skip: true, curr: 1,
        jump: function(obj){
            var that = this;
            console.log(obj.curr) //当前查询的页数
            //数据查询
                //查询结果中的总页数是total
                var total=100;
                that.pages = total;
        }
    });
    
    /* 增加和操作处的点击 s */
    var operation = {
    	shelves: function() {
    		console.log($(this).data('id')+'上架下架')
    	},
    	toTop: function() {
    		console.log('置顶')
    	},
    	del: function(){
    		console.log('删除')
    	}
    }
	$('.js-operation').on('click', function(){
	    var type = $(this).data('type');
	    operation[type].call(this);
	});
	/* 增加和操作处的点击 e */
		
	exports('category', {}); //注意，这里是模块输出的核心，模块名必须和use时的模块名一致
});    