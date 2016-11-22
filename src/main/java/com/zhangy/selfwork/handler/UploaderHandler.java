package com.zhangy.selfwork.handler;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * 
 * Description:没啥卵用，测试webuploader使用
 * @author zhangyu
 * @date 2016年11月21日
 */
@Controller
@RequestMapping("/upload")
public class UploaderHandler {
	@RequestMapping(value="index")
	public String index(){
		return "upload/uploadtwo";
	}
	@RequestMapping(value="uploadOne",method=RequestMethod.POST)
	public String uploadOne(HttpServletRequest request){
		//创建DiskFileItemFactory对象，配置缓存信息
		DiskFileItemFactory factory=new DiskFileItemFactory();
		ServletFileUpload sfu=new ServletFileUpload(factory);
		//设置文件名称编码
		sfu.setHeaderEncoding("utf-8");
		String fileMd5=null;
		try {
			//获取文件信息
			List<FileItem> items =sfu.parseRequest(request);
			for(FileItem item :items){
				//判断是文件还是普通字段
				if(item.isFormField()){
					//普通数据
					String fieldName=item.getFieldName();
					if("describe".equals(fieldName)){
						//获取信息
						String describe=item.getString("utf-8");
						System.out.println("des："+describe);
					}
					if("fileMd5".equals(fieldName)){
						//获取信息
						fileMd5=item.getString("utf-8");
						System.out.println("fileMd5："+fileMd5);
					}
				}else{//文件
					/*String fileName=item.getName();
					InputStream is=item.getInputStream();
					FileUtils.copyInputStreamToFile(is, new File("e:/"+fileName));*/
					//保存分块文件
				}
			}
		} catch (FileUploadException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
}
