/*
 * @parameter 
 * option = {
        elem:元素,
        ext:扩展名,
        type:'image(默认)|video|file|audio',
        before: function(){},
        after: function(){}
    }
 * 
 */
layui.define('layer' , function(exports){
    "use strict";
    
    var $ = layui.jquery;
    var layer = layui.layer;
   
    var msgConf = { icon: 2, shift: 6 }, 
        fileType = { file: '文件', video: '视频', audio: '音频'};

    /* 上传图片前方法 */
    function getAuth(isCross,callback,type){
        if(!type) type = 'image_req';
        var url = "http://test.kuaima.cn/km_task/upload_preparing?"+type+"=1";
        if(isCross) { url = url + "&cross=1"; }
        $.ajax({
            url:url,
            type: "get",
            dataType: "json",
            success: function(d){
                !!callback&&$.isFunction(callback)&&callback(d);
            }
        });
    }
    function Upload(options){
        this.options = options;
    }      
    Upload.prototype.init = function(){
        var that = this, opt = that.options;
        var elem = opt.elem || 'input[name="file"]',
            type = $(elem).attr('lay-type') || opt.type,
            ext = $(elem).attr('lay-ext') || opt.ext || '';
        getAuth(true,function(d){
            var uploadUrl = 'http://v0.api.upyun.com/'+ d.data.IMAGE.path +'/';
            var uploadData = {
                "expire_at": d.data.IMAGE.policy,
                "policy": d.data.IMAGE.policy,
                "signature": d.data.IMAGE.signature
            };

            //文件上传
            $('form').on('change', elem, function() {
                var _file = this, val = _file.value;
                console.log(_file.files)
                // if (_file.files.length == 0) {
                //     return;
                // }

                var that = $(_file), formData = new FormData();
                formData.append('file', this.files[0]);
                //校验文件
                switch(type){
                    case 'file': //一般文件
                        if(ext && !RegExp('\\w\\.('+ ext +')$', 'i').test(escape(val))){
                            layer.msg('不支持该文件格式', msgConf);
                            return _file.value = '';
                        }
                    break;
                    case 'video': //视频文件
                        if(!RegExp('\\w\\.('+ (ext||'avi|mp4|wma|rmvb|rm|flash|3gp|flv') +')$', 'i').test(escape(val))){
                            layer.msg('不支持该视频格式', msgConf);
                            return _file.value = '';
                        }
                    break;
                    case 'audio': //音频文件
                        if(!RegExp('\\w\\.('+ (ext||'mp3|wav|mid') +')$', 'i').test(escape(val))){
                            layer.msg('不支持该音频格式', msgConf);
                            return _file.value = '';
                        }
                    break;
                    default: //图片文件
                        if(!RegExp('\\w\\.('+ (ext||'jpg|png|gif|bmp|jpeg') +')$', 'i').test(escape(val))){
                            layer.msg('不支持该图片格式', msgConf);
                            return _file.value = '';
                        }
                    break;
                }
    
                opt.before && opt.before(elem);

                for(var i in uploadData){
                    formData.set(i, uploadData[i]);
                }

                $.ajax({
                    url: uploadUrl,  
                    type: 'POST',  
                    data: formData,  
                    contentType: false,  
                    processData: false,  
                    success: function (res) {
                        function flightHandler(data){
                            $(_file).parent().find('img').attr('src',data.data.url).removeClass('hide');
                            $.isFunction(opt.after)&&opt.after(data);
                        }
                        eval(res);
                    },  
                    error: function (returndata) {  
                        console.log(returndata);  
                    }  
                });
            });
        });
    }

    //暴露接口
    exports('upload', function(options){
        var upload = new Upload(options = options || {});
        upload.init();
    });
});

