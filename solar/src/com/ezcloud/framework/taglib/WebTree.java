package com.ezcloud.framework.taglib;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * web tree 标签
 * @author TongJianbo
 *
 */
public class WebTree extends TagSupport {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1177797417476241253L;
	// not null
	private DataSet elementDataSet;
	// not null
	private String bureau_no;
	private String sHasScript;
	private String sBorderStyle;
	private String sVerticalBgPath;
	private String sHorizonalBgPath;
	
	@Override
	public int doStartTag() throws JspException {
		StringBuffer html = new StringBuffer();
		Row treeCssRow =new Row();
		treeCssRow.put("type0","images/0pic.gif");
		treeCssRow.put("type4","images/4pic.gif");
		treeCssRow.put("js0","alert('test')");
		com.ezcloud.web.utility.WebTree treeHandler =new com.ezcloud.web.utility.WebTree();
		JspWriter out = this.pageContext.getOut();
		try {
			if(elementDataSet == null || bureau_no == null || bureau_no.replace(" ", "").length() == 0)
			{
				html.append("");
				out.println(html.toString());
				return SKIP_BODY;
			}
			treeHandler.drawTree(elementDataSet, bureau_no, html, treeCssRow, sHasScript, sBorderStyle, sVerticalBgPath, sHorizonalBgPath);
			out.print(html.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}
	
	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
	}

	public DataSet getElementDataSet() {
		return elementDataSet;
	}

	public void setElementDataSet(DataSet elementDataSet) {
		this.elementDataSet = elementDataSet;
	}

	public String getBureau_no() {
		return bureau_no;
	}

	public void setBureau_no(String bureau_no) {
		this.bureau_no = bureau_no;
	}

	public String getsHasScript() {
		return sHasScript;
	}

	public void setsHasScript(String sHasScript) {
		this.sHasScript = sHasScript;
	}

	public String getsBorderStyle() {
		return sBorderStyle;
	}

	public void setsBorderStyle(String sBorderStyle) {
		this.sBorderStyle = sBorderStyle;
	}

	public String getsVerticalBgPath() {
		return sVerticalBgPath;
	}

	public void setsVerticalBgPath(String sVerticalBgPath) {
		this.sVerticalBgPath = sVerticalBgPath;
	}

	public String getsHorizonalBgPath() {
		return sHorizonalBgPath;
	}

	public void setsHorizonalBgPath(String sHorizonalBgPath) {
		this.sHorizonalBgPath = sHorizonalBgPath;
	}

	
	
}
