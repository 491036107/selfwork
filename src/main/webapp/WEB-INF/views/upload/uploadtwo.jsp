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
</head>
<body>
	<!-- 设计一个页面元素 -->
	<div id="uploader">
		<!-- 用于显示文件列表 -->
		<div id="fileList"></div>
		<!-- 用于选择文件 -->
		<div id="filePicker">点击选择文件</div>
	</div>
</body>
<script type="text/javascript">
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
			auto:true
		}
	);
	//实现选择文件，并提示文件的功能
	//file:代表选择到的哪个文件
	uploader.on("fileQueued",function(file){
		$("#fileList").append("<div id="+file.id+"><span>"+file.name+"</span></div><div><span class='percentage'></span></div>");	
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