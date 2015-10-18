package com.ezcloud.framework.controller;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.common.Setting;
import com.ezcloud.framework.service.system.SystemZoneService;
import com.ezcloud.framework.util.AesUtil;
import com.ezcloud.framework.util.ResponseVO;
import com.ezcloud.framework.util.SettingUtils;
import com.ezcloud.framework.util.StringUtils;
import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.OVO;
import com.ezcloud.framework.vo.Row;
import com.ezcloud.framework.vo.VOConvert;
import com.ezcloud.utility.DateUtil;
import com.ezcloud.utility.FileUtil;

@Controller("frameworkSystemZoneController")
@RequestMapping("/system/zone")
public class SystemZoneController extends BaseController {
	
	private static Logger logger = Logger.getLogger(SystemZoneController.class); 
	@Resource(name = "frameworkSystemZoneService")
	private SystemZoneService zoneService;
	
	/**
	 * 查询全部城市以及城市区域列表
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/CityAndZone")
	public @ResponseBody
	String queryCityAndZone(HttpServletRequest request) throws Exception
	{
		logger.info("查询城市以及区域");
		Row row =zoneService.queryAllCityAndZone();
		DataSet cityDataSet =(DataSet)row.get("city");
		DataSet zoneDataSet =(DataSet)row.get("zone");
		OVO ovo =new OVO(0,"","");
		ovo.set("city_list", cityDataSet);
		ovo.set("zone_list", zoneDataSet);
		return AesUtil.encode(VOConvert.ovoToJson(ovo));
	}
	
	@RequestMapping(value ="/update")
	public 
	String updateGeograhpyFiles(ModelMap model) 
	{
		Setting setting =SettingUtils.get();
		String siteUrl =setting.getSiteUrl();
		String geo_file_path =siteUrl +"/resources/geography_files/geography.json";
		String version_file_path =siteUrl +"/resources/geography_files/version.json";
		String version_file_phy_path =setting.getPhysicalPath()+"/resources/geography_files/version.json";
		String version_content ="";
		String file_existed ="1";
		try{
			version_content =FileUtil.readText(version_file_phy_path);
			JSONObject jsonObj =JSONObject.fromObject(version_content);
			String timestamp =jsonObj.getString("VERSION");
			model.addAttribute("version", timestamp);
		}catch(Exception exp){
			geo_file_path ="";
			version_file_path ="";
			file_existed ="0";
		}
		model.addAttribute("geo_file_path", geo_file_path);
		model.addAttribute("version_file_path", version_file_path);
		model.addAttribute("file_existed", file_existed);
		return "/system/zone/update";
	}
	
	/**
	 * 查询全部城市以及城市区域列表
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/cityOfProvince")
	public @ResponseBody
	ResponseVO queryCityByProvinceId(String id) throws Exception
	{
		Assert.notNull(id, "省份编号不能为空");
		DataSet zoneDataSet =zoneService.findOpenedCitiesByProId(id);
		ResponseVO vo =new ResponseVO(0, "");
		vo.put("city_list", zoneDataSet);
		return vo;
	}
	
	/**
	 * 查询城市区域列表
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/zoneOfCity")
	public @ResponseBody
	ResponseVO queryZoneByCityId(String id) throws Exception
	{
		Assert.notNull(id, "城市编号不能为空");
		DataSet zoneDataSet =zoneService.findZoneByCityId(id);
		ResponseVO vo =new ResponseVO(0, "");
		vo.put("zone_list", zoneDataSet);
		return vo;
	}
	
	
//	/**
//	 * 生成地理位置的json文件
//	 * json 格式文件
//	 * 共3个文件：
//	 * 省份 province.json
//	 * 城市 city.json
//	 * 城市区域 zone.json
//	 * @return
//	 * @throws Exception 
//	 */
//	@RequestMapping(value ="/makeGeograhpyFiles")
//	public @ResponseBody
//	ResponseVO makeGeograhpyFiles() throws Exception
//	{
//		ResponseVO vo =null;
//		//province
//		DataSet proDs =zoneService.findAllOpenedProvince();
//		//city
//		DataSet cityDs =zoneService.findAllOpenedCities();
//		//zone
//		DataSet zoneDs =zoneService.findAllOpenedZone();
//		String json ="";
//		JSONArray jsonObj =JSONArray.fromObject(proDs);
//		json =jsonObj.toString();
//		Setting setting =SettingUtils.get();
//		String path =setting.getPhysicalPath();
//		if(StringUtils.isEmptyOrNull(path))
//		{
//			vo =new ResponseVO(-1, "未配置项目物理路径","未配置项目物理路径");
//			return vo;
//		}
//		
//		path +="resources/geography_files/";
//		File file =new File(path);
//		if(!file.exists())
//		{
//			file.mkdir();
//		}
//		String timestamp =DateUtil.getCurrentDateTime().replaceAll(" ", "").replaceAll(":", "").replaceAll("-", "");
//		String provinceFilePath =path+"province.json";
//		FileUtil.writeText(provinceFilePath, json);
//		//city 
//		String cityFilePath =path+"city.json";
//		jsonObj =JSONArray.fromObject(cityDs);
//		json =jsonObj.toString();
//		FileUtil.writeText(cityFilePath, json);
//		//zone
//		String zoneFilePath =path+"zone.json";
//		jsonObj =JSONArray.fromObject(zoneDs);
//		json =jsonObj.toString();
//		FileUtil.writeText(zoneFilePath, json);
//		//version
//		String versionFilePath =path+"version.json";
//		Row verRow =new Row();
//		verRow.put("version", timestamp);
//		JSONObject jsonObj1 =JSONObject.fromObject(verRow);
//		json =jsonObj1.toString();
//		FileUtil.writeText(versionFilePath, json);
//		
//		vo =new ResponseVO(0, "");
//		vo.put("zone_list", "");
//		System.out.println("list--------------->>"+vo.oForm);
//		return vo;
//	}

	
	/**
	 * 生成地理位置的json文件
	 * json 格式文件
	 * 共3个文件：
	 * 省份 province.json
	 * 城市 city.json
	 * 城市区域 zone.json
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value ="/makeGeograhpyFiles")
	public @ResponseBody
	ResponseVO makeGeograhpyFiles() throws Exception
	{
		ResponseVO vo =null;
		//province
		DataSet proDs =zoneService.findAllOpenedProvince();
		//city
		DataSet cityDs =zoneService.findAllOpenedCities();
		//zone
		DataSet zoneDs =zoneService.findAllOpenedZone();
		String json ="";
//		JSONArray jsonObj =JSONArray.fromObject(proDs);
//		json =jsonObj.toString();
		OVO ovo =new OVO(0,"","");
		ovo.set("province_list", proDs);
//		json =VOConvert.ovoToJson(ovo);
		Setting setting =SettingUtils.get();
		String path =setting.getPhysicalPath();
		if(StringUtils.isEmptyOrNull(path))
		{
			vo =new ResponseVO(-1, "未配置项目物理路径","未配置项目物理路径");
			return vo;
		}
		
		path +="resources/geography_files/";
		File file =new File(path);
		if(!file.exists())
		{
			file.mkdir();
		}
		String timestamp =DateUtil.getCurrentDateTime().replaceAll(" ", "").replaceAll(":", "").replaceAll("-", "");
//		String provinceFilePath =path+"province.json";
//		FileUtil.writeText(provinceFilePath, json);
		//city 
//		String cityFilePath =path+"city.json";
//		jsonObj =JSONArray.fromObject(cityDs);
//		json =jsonObj.toString();
//		ovo =new OVO(0,"","");
		ovo.set("city_list", cityDs);
//		json =VOConvert.ovoToJson(ovo);
//		FileUtil.writeText(cityFilePath, json);
		//zone
//		String zoneFilePath =path+"zone.json";
//		jsonObj =JSONArray.fromObject(zoneDs);
//		json =jsonObj.toString();
//		ovo =new OVO(0,"","");
		ovo.set("zone_list", zoneDs);
		ovo.set("version", timestamp);
		json =VOConvert.ovoToJson(ovo);
		String geographyFilePath =path+"geography.json";
//		FileUtil.writeText(geographyFilePath, json);
		FileUtil.writeText(geographyFilePath, json, "UTF-8");
		//version
		String versionFilePath =path+"version.json";
		Row verRow =new Row();
		verRow.put("version", timestamp);
		JSONObject jsonObj1 =JSONObject.fromObject(verRow);
		json =jsonObj1.toString();
		FileUtil.writeText(versionFilePath, json, "UTF-8");
		
		vo =new ResponseVO(0, "");
		return vo;
	}
}
