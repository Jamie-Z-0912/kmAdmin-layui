layui.define(['layer'], function(exports){
    var $ = layui.jquery,
        layer = layui.layer;

    var obj = {
    	formatDate: function(nS,type){
	    	var pattern = type || "yyyy-MM-dd hh:mm";
	    	var that = new Date(parseInt(nS));
	        var o = {
	            "M+": that.getMonth() + 1,
	            "d+": that.getDate(),
	            "h+": that.getHours(),
	            "m+": that.getMinutes(),
	            "s+": that.getSeconds(),
	            "q+": Math.floor((that.getMonth() + 3) / 3),
	            "S": that.getMilliseconds()
	        };
	        if (/(y+)/.test(pattern)) {
	            pattern = pattern.replace(RegExp.$1, (that.getFullYear() + "")
	                .substr(4 - RegExp.$1.length));
	        }
	        for (var k in o) {
	            if (new RegExp("(" + k + ")").test(pattern)) {
	                pattern = pattern.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
	            }
	        }
	        return pattern;
	    },
	    getTimestamp:function(data,hasTime,t){
	    	if(hasTime){
	    		return new Date(data).getTime();
	    	}else{
	    		return new Date(data+(t?' '+t:' 00:00:00')).getTime();
	    	}
	    },
	    getQueryValue: function(key) {
	        var q = location.search, keyValuePairs = new Array();
	        if (q.length > 1) {
	            var idx = q.indexOf('?');
	            q = q.substring(idx + 1, q.length);
	        } else {
	            q = null;
	        }
	        if (q) {
	            for (var i = 0; i < q.split("&").length; i++) {
	                keyValuePairs[i] = q.split("&")[i];
	            }
	        }
	        for (var j = 0; j < keyValuePairs.length; j++) {
	            if (keyValuePairs[j].split("=")[0] == key) {
	                // 这里需要解码，url传递中文时location.href获取的是编码后的值
	                // 但FireFox下的url编码有问题
	                return decodeURI(keyValuePairs[j].split("=")[1]);
	            }
	        }
	        return '';
	    },
	    baseAjax:function(options, callback){
    		if (options.showLoading) {
                layer.load(2);
	        }
	        console.log(options.data)
    		$.ajax({
		        url: options.url,
		        data: options.data||{},
		        type: options.type||'get',
		        // dataType: "json",
		        // contentType: false,
		        success: function(data){
		            if (options.showLoading) {
                        layer.closeAll('loading');
		            }
		            // if(preCheck(data)){
		                callback(data)
		            // }
		        },
		        error: function(xhr,errorType , error) {
		            console.log(xhr);
		            if(options.showLoading){
                        layer.closeAll('loading');
		            }
		        }
		    });
    	},
    	getJspData: function(options, callback){
			var _self = this, result;
			if(!options.url || options.url==''){
				alert('请写数据请求地址');
				return;
			}
			_self.baseAjax({
				url: options.url,
				data: options.data||{},
				type: 'get'
			}, function(data){
				var jsonstr = data.split('<em>')[1];
					jsonstr = jsonstr.split('</em>')[0];
					jsonstr = jsonstr.replace(/\s/ig,'');
				var json = JSON.parse(jsonstr);
				
				$.isFunction(callback) && callback(json);
			});
    	},
	    submit: function(options, callback){
	    	var _self = this;
	        var formData,
	            isForm = typeof options.data != 'string' && !! options.data.length;
	            console.log("isForm:"+isForm)
	        if (isForm) {
	            formData = options.data.serializeArray();
	        } else {
	            formData = options.data;
	        }
	        $.each(formData, function(){
	            this.value = this.value.replace(/\s/ig,'');
	        })

	        options.showLoading = true;
	        options.data = formData;

	        options.type = options.type || 'GET';
	        options.logtype = 'submit';

	        _self.baseAjax(options, function(response, textStatus, jqXHR) {
	            if (typeof callback == 'function') {
	                callback(response);
	            }
	        }, function(jqXHR, textStatus, errorThrown) {
	            console.log(jqXHR.statusText);
	            if (typeof callbackError == 'function') {
	                callbackError(jqXHR, textStatus, errorThrown);
	            }
	        });
	    }
    }


    exports('global', obj);
});