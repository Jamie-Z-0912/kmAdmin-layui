var navs = [
	{
		"title": "Dashboard",
		"icon": "&#xe62c;",
		"spread": true,
		"children": [{
			"title": "汇总统计",
			"href": "/km_task/admin/dashboard/list"
		}, {
			"title": "任务情况",
			"href": "/km_task/admin/dashboard/read"
		}, {
			"title": "收入",
			"href": "/km_task/admin/dashboard/income"
		}, {
			"title": "花费",
			"href": "/km_task/admin/dashboard/cost"
		}, {
			"title": "用户",
			"href": "/km_task/admin/dashboard/user"
		}]
	}, 
	{
		"title": "应用管理",
		"icon": "&#xe857;",
		"spread": true,
		"children": [{
			"title": "应用版本",
			"href": "/km_task/admin/appVersion/list"
		}, {
			"title": "广告位",
			"href": "/km_task/admin/adLocation/list"
		}, {
			"title": "广告位开关",
			"href": "/km_task/admin/adLocationConfig/list"
		}, {
			"title": "广告管理",
			"href": "/km_task/admin/ads/list?adsLocation=timeline_first"
		}, {
			"title": "弹窗管理",
			"href": "/km_task/admin/popup/list"
		}, {
			"title": "系统通知",
			"href": "/km_task/admin/systemMsg/list"
		}, {
			"title": "搜索补量",
			"href": "/km_task/admin/searchKeywords/list"
		}]
	}, 
	{
		"title": "文章管理",
		"icon": "&#xe705;",
		"spread": true,
		"children": [{
			"title": "分类管理",
			"href": "/km_task/admin/category/list"
		}, {
			"title": "文章管理",
			"href": "/km_task/admin/article/list"
		}, {
			"title": "文章抓取",
			"href": "/km_task/admin/article/fetch"
		}, {
			"title": "文章排行榜",
			"href": "/km_task/admin/article/toplist"
		}]
	},
	{
		"title": "值得看",
		"icon": "&#xe735;",
		"spread": true,
		"children": [{
			"title": "采集用户",
			"href": "/km_task/admin/initialUsers/list"
		}, {
			"title": "采集用户申请",
			"href": "/km_task/admin/initialUsers/apply"
		}, {
			"title": "标签列表",
			"href": "/km_task/admin/tag/list"
		}, {
			"title": "采集列表",
			"href": "/km_task/admin/post/list"
		}, {
			"title": "昨日采集推荐",
			"href": "/km_task/admin/post/topListYesterday"
		}, {
			"title": "用户采集",
			"href": "/km_task/admin/post/userlist"
		}, {
			"title": "采集排行榜",
			"href": "/km_task/admin/post/toplist"
		}, {
			"title": "有效阅读记录",
			"href": "/km_task/admin/post/readlist"
		}, {
			"title": "文章抓取",
			"href": "/km_task/admin/post/fetch"
		}, {
			"title": "举报管理",
			"href": "/km_task/admin/report/processList"
		}, {
			"title": "举报记录",
			"href": "/km_task/admin/report/list"
		}]
	},
	{
		"title": "评论管理",
		"icon": "&#xe63a;",
		"spread": true,
		"children": [{
			"title": "评论列表",
			"href": "/km_task/admin/comment/list"
		}]
	},
	{
		"title": "分享任务",
		"icon": "&#xe641;",
		"spread": true,
		"children": [{
			"title": "任务管理",
			"href": "/km_task/admin/browserTask/list"
		}, {
			"title": "任务订单",
			"href": "/km_task/admin/socialTaskOrders"
		}, {
			"title": "阅读记录",
			"href": "/km_task/admin/viewLogs"
		}]
	},
	{
		"title": "运营活动",
		"icon": "&#xe61d;",
		"spread": true,
		"children": [{
			"title": "活动列表",
			"href": "/km_task/admin/optActivity/list"
		}, {
			"title": "活动奖励记录",
			"href": "/km_task/admin/optActivity/rewardLogs"
		}]
	},
	{
		"title": "红包管理",
		"icon": "&#xe62e;",
		"spread": true,
		"children": [{
			"title": "红包列表",
			"href": "/km_task/admin/redpack/list"
		}, {
			"title": "红包配置",
			"href": "/km_task/admin/redpack/setting"
		}]
	},
	{
		"title": "卡券管理",
		"icon": "&#xe638;",
		"spread": true,
		"children": [{
			"title": "虚拟卡券",
			"href": "/km_task/admin/cards/list"
		}, {
			"title": "用户卡券列表",
			"href": "/km_task/admin/cards/user"
		},{
			"title": "阅读加速状态",
			"href": "/km_task/admin/cards/readAccelerate"
		}]
	},
	{
		"title": "金币管理",
		"icon": "&#xe659;",
		"spread": true,
		"children": [{
			"title": "金币规则",
			"href": "/km_task/admin/coinRule/list"
		}, {
			"title": "每日汇率",
			"href": "/km_task/admin/coinExchange/list"
		},{
			"title": "金币活动管理",
			"href": "/km_task/admin/activity/show"
		}]
	},
	{
		"title": "首页推送管理",
		"icon": "&#xe609;",
		"spread": true,
		"children": [{
			"title": "推送规则",
			"href": "/km_task/admin/pushRule/list"
		}, {
			"title": "内容推荐队列",
			"href": "/km_task/admin/recommendQueue/list"
		}]
	},
	{
		"title": "用户召回",
		"icon": "&#xe606;",
		"href": "/km_task/admin/recallPlan/list",
		"spread": false
	},
	{
		"title": "用户数据查询",
		"icon": "&#xe612;",
		"spread": true,
		"children": [{
			"title": "基本信息",
			"href": "/km_task/admin/users/base"
		}, {
			"title": "金币数据",
			"href": "/km_task/admin/users/coin"
		}, {
			"title": "现金流水",
			"href": "/km_task/admin/users/cash"
		}, {
			"title": "好友列表",
			"href": "/km_task/admin/inviteRelation/friends"
		}, {
			"title": "登录日志",
			"href": "/km_task/admin/users/loginLog"
		}, {
			"title": "搜索记录",
			"href": "/km_task/admin/users/searchLog"
		}, {
			"title": "资源兑换",
			"href": "/km_task/admin/post/exchangeOrders"
		}, {
			"title": "收徒/收益排行榜",
			"href": "/km_task/admin/top/list"
		}, {
			"title": "验证码",
			"href": "/km_task/admin/admin/verifyCode"
		}]
	},
	{
		"title": "数据统计",
		"icon": "&#xe629;",
		"spread": true,
		"children": [{
			"title": "签到",
			"href": "/km_task/admin/tj/checkin"
		}, {
			"title": "红包",
			"href": "/km_task/admin/tj/common.html?eventType=receiveRedPack"
		}, {
			"title": "邀请好友",
			"href": "/km_task/admin/tj/common.html?eventType=inviteFriend"
		}, {
			"title": "阅读文章",
			"href": "/km_task/admin/tj/common.html?eventType=readArticle"
		}, {
			"title": "采集",
			"href": "/km_task/admin/tj/post"
		}, {
			"title": "分享任务",
			"href": "/km_task/admin/tj/browserTask"
		},{
			"title": "评论",
			"href": "/km_task/admin/tj/comment"
		},{
			"title": "评论点赞",
			"href": "/km_task/admin/tj/common?eventType=commentIsLiked"
		}, {
			"title": "搜索",
			"href": "/km_task/admin/tj/searchLog"
		}, {
			"title": "金币汇总",
			"href": "/km_task/admin/tj/coin"
		}]
	},
	{
		"title": "财务数据",
		"icon": "&#xe62d;",
		"href": "/km_task/admin/tj/date",
		"spread": false
	},
	{
		"title": "提现充值",
		"icon": "&#xe65e;",
		"spread": true,
		"children": [{
			"title": "提现",
			"href": "/km_task/admin/withdraw/list?status=6&type=2&isFast=1"
		}, {
			"title": "充值",
			"href": "/km_task/admin/cz/list?status=7"
		}, {
			"title": "兑吧订单列表",
			"href": "/km_task/admin/duibaOrders/list"
		}, {
			"title": "提现/充值记录",
			"href": "/km_task/admin/withdraw/list_find"
		}, {
			"title": "提现账号查询",
			"href": "/km_task/admin/withdraw/account"
		}]
	},
	{
		"title": "黑名单管理",
		"icon": "&#xe69c;",
		"spread": true,
		"children": [{
			"title": "黑名单",
			"href": "/km_task/admin/blackUsers"
		},{
			"title": "白名单",
			"href": "/km_task/admin/whiteUser/list"
		}]
	},
	{
		"title": "敏感词管理",
		"icon": "&#xe6b2;",
		"href": "/km_task/admin/sensitiveWords/list",
		"spread": false
	},
	{
		"title": "系统配置/监控",
		"icon": "&#xe631;",
		"spread": true,
		"children": [{
			"title": "配置管理",
			"href": "/km_task/admin/systemSetting/list"
		}, {
			"title": "后台操作日志",
			"href": "/km_task/admin/optLogs"
		}, {
			"title": "Redis监控",
			"href": "/km_task/admin/monitor/redis"
		}, {
			"title": "DB监控",
			"href": "/km_task/admin/monitor/db"
		}]
	}
];