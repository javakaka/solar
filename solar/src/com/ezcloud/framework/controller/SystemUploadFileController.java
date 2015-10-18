package com.ezcloud.framework.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ezcloud.framework.service.system.SystemUpload;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.utility.DateUtil;
import com.ezcloud.utility.FileUtil;
import com.ezcloud.utility.StringUtil;

/**
 * 框架统一上传文件服务
 * @author JianBoTong
 *
 */
@Controller("frameworkSysUploadController")
@RequestMapping("/sysupload")
public class SystemUploadFileController  extends BaseController{

	@Resource(name = "frameworkUploadService")
	private SystemUpload systemUpload;
	
	/**
	 * 相关联的deal_code已经存在时，上传文件
	 * @param file
	 * @param fileFileName
	 * @param fileContentType
	 * @param deal_type
	 * @param deal_code
	 * @param type
	 * @param sub_type
	 * @param cover
	 * @param staff_id
	 * @throws IOException 
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/upload")
	public String upload(MultipartFile file,String deal_type,String deal_code,String type,String sub_type,String cover, String staff_id,ServletRequest request,ModelMap model) throws IOException
	{
				//实现上传
//				InputStream is = new FileInputStream(file);
				InputStream is = file.getInputStream();
				String root =request.getRealPath("/resources");
				String file_name =file.getOriginalFilename();
//				String oname = file.getOriginalFilename();
				String file_type ="";
//				String fileContentType =file.getContentType();
				int iPos =file_name.lastIndexOf(".");
				String file_title =file_name.substring(0,iPos);
				file_type =file_name.substring(iPos+1);
				Row controlRow =new Row();
				controlRow.put("file_title", file_title);
				controlRow.put("file_name", file_title);
				controlRow.put("file_type", file_type);
				controlRow.put("deal_type", deal_type);
				controlRow.put("deal_code", deal_code);
				if(type!= null){
					controlRow.put("type",type);
				}
				if( sub_type!= null){
					controlRow.put("sub_type",sub_type);
				}
				if(staff_id == null ){
					staff_id="";
				}
				controlRow.put("upload_user",staff_id );
				controlRow.put("upload_user_name", "admin");
				controlRow.put("deleted","0");
				controlRow.put("upload_date",DateUtil.getCurrentDateTime());
				
				String file_path ="";
				file_path =root+"/";
				if(deal_type !=null){
					file_path +=deal_type+"/";
				}
				if(deal_code != null){
					file_path +=deal_code+"/";
				}
//				System.out.println("====file path===="+file_path);
				FileUtil.mkdir(file_path);
				
				Row attachRow =new Row();
				String file_code =StringUtil.getRandKeys(12);
				String newFileName =file_code+"."+file_type;
				String newFilePath =file_path+"\\"+newFileName;
				newFilePath =newFilePath.replace("\\\\", "/");
				newFilePath =newFilePath.replace("\\", "/");
				newFilePath =newFilePath.replace("//", "/");
//				System.out.println("====newFilePath===="+newFilePath);
				attachRow.put("file_path", newFilePath);
//				File deskFile = new File(file_path,this.getFileFileName());
				File deskFile = new File(file_path,newFileName);
				OutputStream os = new FileOutputStream(deskFile);
				byte [] bytefer = new byte[1024];
				int length = 0 ;
				int file_size =0;
				while((length = is.read(bytefer) )>0)
				{
					os.write(bytefer,0,length);
					file_size +=length;
				}
				os.close();
				is.close();
				attachRow.put("file_code", file_code);
				attachRow.put("file_size", file_size);
//				System.out.print("controller row ===>>"+controlRow);
//				System.out.print("attach row ===>>"+attachRow);
				
				systemUpload.swfUpload(controlRow, attachRow);
				return "/sysupload/Upload";
	}
	
	/**
	 * 相关联的deal_code不存在，上传文件
	 * @param file
	 * @param fileFileName
	 * @param fileContentType
	 * @param deal_type
	 * @param type
	 * @param sub_type
	 * @param cover
	 * @param staff_id
	 */
	public void ajaxUpload(File file,String fileFileName,String fileContentType,String deal_type,String type,String sub_type,String cover, String staff_id)
	{
		
	}

	@RequestMapping("/getAttachList")
	public @ResponseBody 
	ResponseVO getAttachList(String deal_code ,String deal_type)
	{
		ResponseVO ovo =new ResponseVO();
		DataSet ds =systemUpload.getAttachList(deal_code, deal_type);
		ovo.oForm.put("attach_list", ds);
		return ovo;
	}
	
	@RequestMapping("/deleteAttach")
	public @ResponseBody ResponseVO deleteAttach(String id)
	{
		ResponseVO ovo =new ResponseVO();
		int num =systemUpload.deleteAttach(id);
		if(num ==0)
		{
			ovo.setCode(-1);
		}
		return ovo;
	}
}
