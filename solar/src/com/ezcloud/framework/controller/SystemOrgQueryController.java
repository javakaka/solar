package com.ezcloud.framework.controller;

import java.sql.SQLException;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezcloud.framework.exp.JException;
import com.ezcloud.framework.page.jdbc.Page;
import com.ezcloud.framework.page.jdbc.Pageable;
import com.ezcloud.framework.service.system.Staff;
import com.ezcloud.framework.service.system.StaffPositionService;
import com.ezcloud.framework.service.system.SystemOrgQuery;
import com.ezcloud.framework.service.system.SystemPositionService;
import com.ezcloud.framework.service.system.SystemSite;
import com.ezcloud.framework.util.Md5Util;
import com.ezcloud.framework.util.Message;
import com.ezcloud.framework.vo.Row;

@Controller("frameworkSystemOrgQueryController")
@RequestMapping("/system/org/tree")
public class SystemOrgQueryController extends BaseController{
	@Resource(name = "frameworkSystemOrgQueryService")
	private SystemOrgQuery systemOrgQueryService;
	
	@Resource(name = "frameworkSystemSiteService")
	private SystemSite systemSiteService;
	
	@Resource(name = "frameworkPositionService")
	private SystemPositionService systemPositionService;
	
	
	@Resource(name = "frameworkStaffService")
	private Staff staffService;
	
	@Resource(name = "frameworkStaffPositionService")
	private StaffPositionService staffPositionService;
	
	
	/**
	 * 显示左侧组织结构图 xtree
	 * @param model
	 * @return
	 * @throws JException
	 * @throws SQLException
	 */
	@RequestMapping("/OrgTree")
	public String getSysFunXTree(ModelMap model) throws JException, SQLException {
		model.addAttribute("treeData", systemOrgQueryService.getDeptPostionXTree());
		return "/system/org/tree/OrgTree";
	}
	
	/**
	 * 1 view_type=site部门视图 2 view_type=position岗位视图
	 * @param bureau_no
	 * @param view_type
	 * @param model
	 * @return
	 * @throws JException
	 * @throws SQLException
	 */
	@RequestMapping("/OrgGraph")
	public String getOrgGraph(String bureau_no,String view_type,ModelMap model) throws JException, SQLException {
		Assert.notNull(bureau_no);
		if(view_type == null || view_type.trim().equals(""))
		{
			//默认是部门视图
			view_type ="site";
		}
		if(view_type.equals("site"))
		{
			model.addAttribute("treeData", systemOrgQueryService.getDeptPostionXTree());
		}
		else if(view_type.equals("position"))
		{
			systemOrgQueryService.getRow().put("bureau_no", bureau_no);
			model.addAttribute("treeData", systemOrgQueryService.getOrgPosiStaffXTree());
		}
		model.addAttribute("bureau_no", "B"+bureau_no);
		return "/system/org/tree/OrgGraph";
	}
	
	/***************************部门**********************************/
	@RequestMapping(value = "/site/SiteList")
	public String siteList(Pageable pageable, ModelMap model,String BUREAU_NO ,String UP_SITE_NO) {
		systemSiteService.getRow().put("pageable", pageable);
		if(BUREAU_NO !=null && BUREAU_NO.replace(" ", "").length() > 0)
		{
			systemSiteService.getRow().put("org_id", BUREAU_NO);
		}
		else
		{
			BUREAU_NO = systemSiteService.queryBureauNo(UP_SITE_NO);
		}
		if(UP_SITE_NO !=null && UP_SITE_NO.replace(" ", "").length() > 0)
		{
			systemSiteService.getRow().put("up_id", UP_SITE_NO);
		}
		else
		{
			UP_SITE_NO ="";
		}
		systemSiteService.getRow().put("pageable", pageable);
		Page page = systemSiteService.queryPageForTree();
		model.addAttribute("page", page);
		model.addAttribute("id", BUREAU_NO);
		model.addAttribute("up_id", UP_SITE_NO);
		return "/system/org/tree/site/SiteList";
	}
	
	@RequestMapping(value = "/site/edit")
	public String editSite(String id ,String bureau_no,  ModelMap model) {
		Assert.notNull(id, "id can not be null");
		systemSiteService.getRow().put("id", id);
		model.addAttribute("departs", systemSiteService.queryOrgSite(bureau_no));
		model.addAttribute("row", systemSiteService.find());
		return "/system/org/tree/site/edit";
	}
	
	@RequestMapping(value = "/site/add")
	public String addSite(String id,String up_id, ModelMap model) {
		if(id ==null || id.replace(" ", "").length()==0 && up_id !=null && up_id.replace(" ", "").length() >0)
		{
			id =systemSiteService.queryBureauNo(up_id);
			id ="";
		}
		System.out.println("id:"+id);
		System.out.println("up_id:"+up_id);
		model.addAttribute("departs", systemSiteService.queryOrgSite(id));
		model.addAttribute("id", id);//bureau_no
		return "/system/org/tree/site/add";
	}
	
	@RequestMapping(value = "/site/save")
	public String saveSite(String BUREAU_NO,String SITE_NAME,String UP_SITE_NO,String RELA_PHONE,String NOTES,String STATE,String ADDR,  ModelMap model )
	{
		
		Assert.notNull(SITE_NAME, "SITE_NAME can not be null");
		Row siteRow =new Row();
		siteRow.put("SITE_NAME", SITE_NAME);
		siteRow.put("BUREAU_NO", BUREAU_NO);
		if(UP_SITE_NO!= null && UP_SITE_NO.replace(" ", "").length() >0)
		{
			siteRow.put("UP_SITE_NO", UP_SITE_NO);
		}
		if(RELA_PHONE!= null && RELA_PHONE.replace(" ", "").length() >0)
		{
			siteRow.put("RELA_PHONE", RELA_PHONE);
		}
		if(NOTES!= null && NOTES.replace(" ", "").length() >0)
		{
			siteRow.put("NOTES", NOTES);
		}
		if(STATE!= null && STATE.replace(" ", "").length() >0)
		{
			siteRow.put("STATE", STATE);
		}
		if(ADDR!= null && ADDR.replace(" ", "").length() >0)
		{
			siteRow.put("ADDR", ADDR);
		}
		systemSiteService.insertOrgSite(siteRow);
		return "redirect:SiteList.do?BUREAU_NO="+BUREAU_NO;
	}
	
	@RequestMapping(value = "/site/update")
	public String updateSite(String BUREAU_NO ,String SITE_NO,String SITE_NAME,String UP_SITE_NO,String RELA_PHONE,String NOTES,String STATE,String ADDR,  ModelMap model )
	{
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		Assert.notNull(SITE_NAME, "SITE_NAME can not be null");
		Row siteRow =new Row();
		siteRow.put("SITE_NO", SITE_NO);
		siteRow.put("SITE_NAME", SITE_NAME);
		if(UP_SITE_NO!= null && UP_SITE_NO.replace(" ", "").length() >0)
		{
			siteRow.put("UP_SITE_NO", UP_SITE_NO);
		}
		if(RELA_PHONE!= null && RELA_PHONE.replace(" ", "").length() >0)
		{
			siteRow.put("RELA_PHONE", RELA_PHONE);
		}
		if(NOTES!= null && NOTES.replace(" ", "").length() >0)
		{
			siteRow.put("NOTES", NOTES);
		}
		if(STATE!= null && STATE.replace(" ", "").length() >0)
		{
			siteRow.put("STATE", STATE);
		}
		if(ADDR!= null && ADDR.replace(" ", "").length() >0)
		{
			siteRow.put("ADDR", ADDR);
		}
		systemSiteService.saveOrgSite(siteRow);
		return "redirect:SiteList.do?BUREAU_NO="+BUREAU_NO;
	}
	
	@RequestMapping(value = "/site/SiteDetail")
	public String siteDetail(String SITE_NO,  ModelMap model )
	{
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		systemSiteService.getRow().put("id", SITE_NO);
		model.addAttribute("row", systemSiteService.find());
		return "/system/org/tree/site/SiteDetail";
	}
	
	@RequestMapping(value = "/site/delete")
	public @ResponseBody
	Message deleteSite(Long[] ids) {
		systemSiteService.deleteOrgSite(ids);
		return SUCCESS_MESSAGE;
	}
	/***************************部门**********************************/
	
	/***************************人员**********************************/
	@RequestMapping(value = "/staff/StaffList")
	public String staffList(Pageable pageable, ModelMap model,String SITE_NO ,String POSI_NO) {
		Page page =null;
		String bureau_no ="";
		staffService.getRow().put("pageable", pageable);
		if(POSI_NO !=null && POSI_NO.replace(" ", "").length() > 0)
		{
			staffService.getRow().put("posi_no", POSI_NO);
			page =staffService.queryStaffByPosiNo();
			Row posiRow =systemPositionService.find(POSI_NO);
			SITE_NO =posiRow.getString("site_no",null);
			bureau_no =systemSiteService.queryBureauNo(SITE_NO);
		}
		else
		{
			POSI_NO ="";
			if(SITE_NO !=null && SITE_NO.replace(" ", "").length() > 0)
			{
				staffService.getRow().put("site_no", SITE_NO);
				page =staffService.queryStaffBySiteNo();
				bureau_no =systemSiteService.queryBureauNo(SITE_NO);
			}
		}
		model.addAttribute("page", page);
		model.addAttribute("SITE_NO", SITE_NO);
		model.addAttribute("POSI_NO", POSI_NO);
		model.addAttribute("BUREAU_NO", bureau_no);
		systemSiteService.getRow().clear();
		return "/system/org/tree/staff/StaffList";
	}
	
	//id=1&bureau_no=10004&site_no=1&posi_no=
	@RequestMapping(value = "/staff/edit")
	public String editStaff(Pageable pageable, ModelMap model,String id ,
			String bureau_no,String site_no,String posi_no) {
		model.addAttribute("departs", systemSiteService.queryOrgSite(bureau_no));
		model.addAttribute("bureau_no", bureau_no);//bureau_no
		if(posi_no == null || posi_no.replace(" ", "").length() ==0 )
		{
			posi_no ="";
		}
		model.addAttribute("site_no", site_no);
		model.addAttribute("posi_no", posi_no);
		//查询人员详情
		Row staffRow =staffService.find(id);
		model.addAttribute("row", staffRow);
		return "/system/org/tree/staff/edit";
	}
	
	@RequestMapping(value = "/staff/add")
	public String addStaff(String bureau_no,String site_no,String posi_no, ModelMap model) {
		model.addAttribute("departs", systemSiteService.queryOrgSite(bureau_no));
		model.addAttribute("bureau_no", bureau_no);//bureau_no
		if(posi_no == null || posi_no.replace(" ", "").length() ==0 )
		{
			posi_no ="";
		}
		model.addAttribute("site_no", site_no);
		model.addAttribute("posi_no", posi_no);
		return "/system/org/tree/staff/add";
	}
	
	@RequestMapping(value = "/staff/save")
	public String saveStaff(String REAL_NAME,String SITE_NO,String STAFF_NAME,String PASSWORD,String AUTH_LEVEL,
			String STAFF_SEQ,String STATE,String PAGE_SITE_NO,String PAGE_POSI_NO,
			ModelMap model )
	{
		
		Assert.notNull(REAL_NAME, "REAL_NAME can not be null");
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		Assert.notNull(STAFF_NAME, "STAFF_NAME can not be null");
		Assert.notNull(PASSWORD, "PASSWORD can not be null");
		String url ="";
		boolean bool_posi_staff =false;
		if(PAGE_POSI_NO == null || PAGE_POSI_NO.replace(" ", "").length() == 0)
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO;
		}
		else
		{
			bool_posi_staff =true;
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO+"&POSI_NO="+PAGE_POSI_NO;
		}
		Row staffRow =new Row();
		staffRow.put("REAL_NAME", REAL_NAME);
		staffRow.put("SITE_NO", SITE_NO);
		staffRow.put("STAFF_NAME", STAFF_NAME);
		staffRow.put("PASSWORD", Md5Util.Md5(PASSWORD));
		String bureau_no =systemSiteService.queryBureauNo(SITE_NO);
		boolean nameExisted =staffService.isStaffNameExisted(STAFF_NAME, bureau_no);
		if(nameExisted)
		{
			System.out.println("用户名已经存在");
			return url;
		}
		if(AUTH_LEVEL == null || AUTH_LEVEL.replace(" ", "").length() ==0)
		{
			AUTH_LEVEL ="";
		}
		if(STAFF_SEQ == null || STAFF_SEQ.replace(" ", "").length() ==0)
		{
			STAFF_SEQ ="";
		}
		if(STATE == null || STATE.replace(" ", "").length() ==0)
		{
			STATE ="0";
		}
		staffRow.put("AUTH_LEVEL", AUTH_LEVEL);
		staffRow.put("STAFF_SEQ", STAFF_SEQ);
		staffRow.put("STATE", STATE);
		staffService.setRow(staffRow);
		staffService.save();
		String staff_no =staffService.getRow().getString("staff_no","");
		// add sm_staff_position
		if(bool_posi_staff && staff_no!=null && staff_no.replace(" ", "").length()>0)
		{
			Row staff_posi_row =new Row();
			staff_posi_row.put("staff_no",staff_no );
			staff_posi_row.put("posi_no", PAGE_POSI_NO);
			staffPositionService.insert(staff_posi_row);
		}
		if(PAGE_POSI_NO == null || PAGE_POSI_NO.replace(" ", "").length() == 0)
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO;
		}
		else
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO+"&POSI_NO="+PAGE_POSI_NO;
		}
		return url;
	}
	
	@RequestMapping(value = "/staff/update")
	public String updateStaff(String BUREAU_NO ,String REAL_NAME,String SITE_NO,
			String STAFF_NO,String STAFF_NAME,String AUTH_LEVEL,String STAFF_SEQ,
			String STATE,String PAGE_SITE_NO,String PAGE_POSI_NO,ModelMap model )
	{
		Assert.notNull(STAFF_NO, "STAFF_NO can not be null");
		Assert.notNull(REAL_NAME, "REAL_NAME can not be null");
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		Assert.notNull(STAFF_NAME, "STAFF_NAME can not be null");
		String url ="";
		if(PAGE_POSI_NO == null || PAGE_POSI_NO.replace(" ", "").length() == 0)
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO;
		}
		else
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO+"&POSI_NO="+PAGE_POSI_NO;
		}
		Row staffRow =new Row();
		staffRow.put("STAFF_NO", STAFF_NO);
		staffRow.put("REAL_NAME", REAL_NAME);
		staffRow.put("SITE_NO", SITE_NO);
		staffRow.put("STAFF_NAME", STAFF_NAME);
		boolean nameExisted =staffService.isStaffNameExisted(STAFF_NO,STAFF_NAME, BUREAU_NO);
		if(nameExisted)
		{
			System.out.println("用户名已经存在");
			return url;
		}
		if(AUTH_LEVEL == null || AUTH_LEVEL.replace(" ", "").length() ==0)
		{
			AUTH_LEVEL ="";
		}
		if(STAFF_SEQ == null || STAFF_SEQ.replace(" ", "").length() ==0)
		{
			STAFF_SEQ ="";
		}
		if(STATE == null || STATE.replace(" ", "").length() ==0)
		{
			STATE ="0";
		}
		staffRow.put("AUTH_LEVEL", AUTH_LEVEL);
		staffRow.put("STAFF_SEQ", STAFF_SEQ);
		staffRow.put("STATE", STATE);
		staffService.update(staffRow);
		if(PAGE_POSI_NO == null || PAGE_POSI_NO.replace(" ", "").length() == 0)
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO;
		}
		else
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO+"&POSI_NO="+PAGE_POSI_NO;
		}
		return url;
	}
	
	@RequestMapping(value = "/staff/updatePassword")
	public String updateStaff(
			String STAFF_NO,String PASSWORD,String PAGE_SITE_NO,String PAGE_POSI_NO,ModelMap model )
	{
		Assert.notNull(STAFF_NO, "STAFF_NO can not be null");
		Assert.notNull(PASSWORD, "PASSWORD can not be null");
		String url ="";
		Row staffRow =new Row();
		staffRow.put("STAFF_NO", STAFF_NO);
		staffRow.put("PASSWORD", Md5Util.Md5(PASSWORD));
		staffService.update(staffRow);
		if(PAGE_POSI_NO == null || PAGE_POSI_NO.replace(" ", "").length() == 0)
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO;
		}
		else
		{
			url ="redirect:StaffList.do?SITE_NO="+PAGE_SITE_NO+"&POSI_NO="+PAGE_POSI_NO;
		}
		return url;
	}
	
	@RequestMapping(value = "/staff/delete")
	public @ResponseBody
	Message deleteStaff(Long[] ids) {
		staffService.deleteStaff(ids);
		return SUCCESS_MESSAGE;
	}
	/***************************人员**********************************/
	
	/***************************岗位**********************************/
	@RequestMapping(value = "/position/PositionList")
	public String positionList(Pageable pageable, ModelMap model,String SITE_NO) {
		systemPositionService.getRow().put("pageable", pageable);
		systemPositionService.getRow().put("site_no", SITE_NO);
		String bureau_no = systemSiteService.queryBureauNo(SITE_NO);
		systemPositionService.getRow().put("pageable", pageable);
		Page page = systemPositionService.querySitePositions();
		model.addAttribute("page", page);
		model.addAttribute("site_no", SITE_NO);
		model.addAttribute("bureau_no", bureau_no);
		return "/system/org/tree/position/PositionList";
	}
	
	@RequestMapping(value = "/position/edit")
	public String positionEdit(String id ,String bureau_no,String site_no,  ModelMap model) {
		Assert.notNull(id, "id can not be null");
		Assert.notNull(site_no, "site_no can not be null");
		systemSiteService.getRow().put("id", id);
		model.addAttribute("departs", systemSiteService.queryOrgSite(bureau_no));
		model.addAttribute("positions", systemPositionService.queryBureauPositions(bureau_no));
		model.addAttribute("row", systemPositionService.find(id));
		model.addAttribute("PAGE_SITE_NO", site_no);
		return "/system/org/tree/position/edit";
	}
	
	@RequestMapping(value = "/position/add")
	public String addPosition(String bureau_no, ModelMap model) {
		System.out.println("bureau_no:"+bureau_no);
		model.addAttribute("departs", systemSiteService.queryOrgSite(bureau_no));
		model.addAttribute("bureau_no", bureau_no);//bureau_no
		model.addAttribute("positions", systemPositionService.queryBureauPositions(bureau_no));//bureau_no
		return "/system/org/tree/position/add";
	}
	
	@RequestMapping(value = "/position/save")
	public String savePosition(String BUREAU_NO,String POSI_NAME,String SITE_NO,String UP_POSI_NO,
			String DAY_WORK,String PART_WORK,
			String ASSISTANT_WORK,String ACCIDENT_WORK,String STATE,  
			String TEMPORAR_WORK,String STAFFNUMS,String COMM_POSI_NO,  
			ModelMap model )
	{
		
		Assert.notNull(POSI_NAME, "POSI_NAME can not be null");
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		Row siteRow =new Row();
		siteRow.put("POSI_NAME", POSI_NAME);
		siteRow.put("SITE_NO", SITE_NO);
		if(UP_POSI_NO == null || UP_POSI_NO.replace(" ", "").length() ==0)
		{
			UP_POSI_NO ="0";
		}
		siteRow.put("UP_POSI_NO", UP_POSI_NO);
		if(DAY_WORK == null || DAY_WORK.replace(" ", "").length() ==0)
		{
			DAY_WORK ="";
		}
		if(PART_WORK == null || PART_WORK.replace(" ", "").length() ==0)
		{
			PART_WORK ="";
		}
		if(ASSISTANT_WORK == null || ASSISTANT_WORK.replace(" ", "").length() ==0)
		{
			ASSISTANT_WORK ="";
		}
		if(ACCIDENT_WORK == null || ACCIDENT_WORK.replace(" ", "").length() ==0)
		{
			ACCIDENT_WORK ="";
		}
		if(TEMPORAR_WORK == null || TEMPORAR_WORK.replace(" ", "").length() ==0)
		{
			TEMPORAR_WORK ="";
		}
		if(COMM_POSI_NO == null || COMM_POSI_NO.replace(" ", "").length() ==0)
		{
			COMM_POSI_NO ="";
		}
		siteRow.put("DAY_WORK", DAY_WORK);
		siteRow.put("PART_WORK", PART_WORK);
		siteRow.put("ASSISTANT_WORK", ASSISTANT_WORK);
		siteRow.put("ACCIDENT_WORK", ACCIDENT_WORK);
		siteRow.put("TEMPORAR_WORK", TEMPORAR_WORK);
		siteRow.put("STAFFNUMS", STAFFNUMS);
		siteRow.put("COMM_POSI_NO", COMM_POSI_NO);
		siteRow.put("STATE", STATE);
		systemPositionService.insert(siteRow);
		return "redirect:PositionList.do?BUREAU_NO="+BUREAU_NO;
	}
	
	@RequestMapping(value = "/position/update")
	public String updatePosition//(String BUREAU_NO ,String PAGE_SITE_NO, String POSI_NO,String POSI_NAME,String SITE_NO,  ModelMap model )
	(String BUREAU_NO,String PAGE_SITE_NO, String POSI_NO,String POSI_NAME,String SITE_NO,String UP_POSI_NO,
			String DAY_WORK,String PART_WORK,
			String ASSISTANT_WORK,String ACCIDENT_WORK,String STATE,  
			String TEMPORAR_WORK,String STAFFNUMS,String COMM_POSI_NO,  
			ModelMap model )
	{
		Assert.notNull(POSI_NO, "POSI_NO can not be null");
		Assert.notNull(POSI_NAME, "POSI_NAME can not be null");
		Assert.notNull(SITE_NO, "SITE_NO can not be null");
		Assert.notNull(PAGE_SITE_NO, "PAGE_SITE_NO can not be null");
		Row posiRow =new Row();
		posiRow.put("POSI_NO", POSI_NO);
		posiRow.put("POSI_NAME", POSI_NAME);
		posiRow.put("SITE_NO", SITE_NO);
		if(UP_POSI_NO == null || UP_POSI_NO.replace(" ", "").length() ==0)
		{
			UP_POSI_NO ="0";
		}
		posiRow.put("UP_POSI_NO", UP_POSI_NO);
		if(DAY_WORK == null || DAY_WORK.replace(" ", "").length() ==0)
		{
			DAY_WORK ="";
		}
		if(PART_WORK == null || PART_WORK.replace(" ", "").length() ==0)
		{
			PART_WORK ="";
		}
		if(ASSISTANT_WORK == null || ASSISTANT_WORK.replace(" ", "").length() ==0)
		{
			ASSISTANT_WORK ="";
		}
		if(ACCIDENT_WORK == null || ACCIDENT_WORK.replace(" ", "").length() ==0)
		{
			ACCIDENT_WORK ="";
		}
		if(TEMPORAR_WORK == null || TEMPORAR_WORK.replace(" ", "").length() ==0)
		{
			TEMPORAR_WORK ="";
		}
		if(COMM_POSI_NO == null || COMM_POSI_NO.replace(" ", "").length() ==0)
		{
			COMM_POSI_NO ="";
		}
		posiRow.put("DAY_WORK", DAY_WORK);
		posiRow.put("PART_WORK", PART_WORK);
		posiRow.put("ASSISTANT_WORK", ASSISTANT_WORK);
		posiRow.put("ACCIDENT_WORK", ACCIDENT_WORK);
		posiRow.put("TEMPORAR_WORK", TEMPORAR_WORK);
		posiRow.put("STAFFNUMS", STAFFNUMS);
		posiRow.put("COMM_POSI_NO", COMM_POSI_NO);
		posiRow.put("STATE", STATE);
		
		systemPositionService.update(posiRow);
		return "redirect:PositionList.do?SITE_NO="+PAGE_SITE_NO;
	}
	
	@RequestMapping(value = "/position/PosiDetail")
	public String postionDetail(String POSI_NO,  ModelMap model )
	{
		Assert.notNull(POSI_NO, "POSI_NO can not be null");
		model.addAttribute("row", systemPositionService.find(POSI_NO));
		return "/system/org/tree/position/PositionDetail";
	}
	
	@RequestMapping(value = "/position/delete")
	public @ResponseBody
	Message deletePosition(Long[] ids) {
		systemSiteService.deleteOrgSite(ids);
		return SUCCESS_MESSAGE;
	}
	/***************************岗位**********************************/
}
