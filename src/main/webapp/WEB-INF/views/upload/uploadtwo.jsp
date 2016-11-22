<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/common/jquery.jsp"%>
<!-- webuploader资源 依赖jquery.js -->
<%@ include file="/common/webuploader.jsp"%>
<title></title>
<style type="text/css">
	#dndArea{
		width:200px;
		height:100px;
		border-color: red;
		border-style:dashed;
	}
</style>
</head>
<body>
	<!-- 设计一个页面元素 -->
	<div id="uploader">
		<div id="dndArea"></div>
		<!-- 用于显示文件列表 -->
		<div id="fileList"></div>
		<!-- 用于选择文件 -->
		<div id="filePicker">点击选择文件</div>
	</div>
</body>
<script type="text/javascript">
	//获取到了文件的标记
	var uniqueFileTag;
	//监听上传过程中的三个时间点
	WebUploader.Uploader.register({
			"before-send-file":"beforeSendFile",
			"before-send":"beforeSend",
			"after-send-file":"afterSendFile"
		},{
			//时间点1:所有分块进行上传之前调用此函数
			beforeSendFile:function(){
				//创建一个deferred
				var deferred=WebUploader.Deferred();
				//1.计算文件的唯一标记,用于断点续传和秒传
				(new WebUploader.Uploader()).md5File(file,0,5*1024*1024)
											.progress(function(percentage){
												$("#"+file.id).find("span.state").text("正在获取文件信息......");
											})
											.then(function(val){
												uniqueFileTag=val;
												$("#"+file.id).find("span.state").text("成功获取文件信息");
												//只有文件信息获取成功,才进行下一步操作
												deferred.resolve();
											});
				//2.请求后台是否保存过该文件，如果存在，则跳过该文件，实现秒传功能
				//返回deferred
				return deferred.promise();
			},
			//时间点2：如果有分块上传，则每个分块上传之前调用此函数
			beforeSend:function(){
				//创建一个deferred
				var deferred=WebUploader.Deferred();
				this.owner.options.formData.fileMd5=fileMd5;
				return deferred.promise();
				//1.请求后台是否保存过当前分块，如果存在，则跳过该分块文件，实现断点续传功能
			},
			//时间点3:所有分块上传成功之后调用此函数
			afterSendFile:function(){
				//1.如果分块上传，则通过后台合并所有分块文件
			}
		});
	//使用webuploader进行渲染
	var uploader=WebUploader.create(
		{
			//flash的地址
			swf:"${ctx}/static/webuploder/Uploader.swf",
			//设置提交服务的地址
			server:"${ctx}/upload/uploadOne",
			//渲染文件上传元素
			pick:"#filePicker",
			//自动上传
			auto:true,
			//开启拖拽功能
			dnd:"#dndArea",
			//屏蔽拖拽区域外的功能
			disableGlobalDnd:true,
			//开启黏贴功能
			paste:"#uploader",
			//分块上传设置
			//开启分块上传
			chunked:true,
			//每块文件大小（默认是5M）
			chunkSize:5*1024*1024,
			//开启几个并发线程(默认是3个)
			threads:3,
			//再上传当前文件时，准备好下一个文件
			prepareNextFile:true
		}
	);
	//实现选择文件，并提示文件的功能
	//file:代表选择到的哪个文件
	uploader.on("fileQueued",function(file){
		$("#fileList").append("<div id="+file.id+"><img/><span>"+file.name+"</span><div><span class='percentage'></span></div><span class='state'></span></div>");	
		//制作缩略图
		//file
		//error:不是图片，则有error
		//src:代表生成后的缩略图的地址
		uploader.makeThumb(file,function(error,src){
			//判断是否已经成功生成缩略图
			if(error){
				$("#"+file.id).find("img").replaceWith("无法预览");
			}else{
				//成功
				$("#"+file.id).find("img").attr("src",src);
			}
		});
	});
	//实现上传文件过程中的上传监控
	//percentage 代表文件上传的百分比 0.15 最大是1
	uploader.on("uploadProgress",function(file,percentage){
		$("#"+file.id).find("span.percentage").text(Math.round(percentage*100)+"%");
	});
</script>
</html>