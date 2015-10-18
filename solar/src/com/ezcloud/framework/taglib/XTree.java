package com.ezcloud.framework.taglib;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.ezcloud.framework.vo.DataSet;
import com.ezcloud.framework.vo.Row;

/**
 * XTree标签
 * 
 * @author JianBoTong
 */
public class XTree extends TagSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String head;
	private String pidF;
	private String idF;
	private String pid;
	private String typeF;
	private String titleF;
	private DataSet treeData;
	private String icon;
	private String headIcon;
	private String hiddenF;
	private String checkbox;
	private String checkboxtype;
	private String sJsMethod;
	private String sRand;
	private StringBuffer html;

	@Override
	public int doStartTag() throws JspException {
		html = new StringBuffer();
		this.html.append("<script>\n");
		this.html.append(" var tree = new WebFXTree('" + this.head + "',\"javascript:action()\");\n");
		if (this.headIcon != null) {
			this.html.append(" tree.icon = '" + this.headIcon + "'");
		}
		this.html.append(" tree.setBehavior('classic');\n");
		if ((this.treeData != null) && (this.treeData.size() > 0)) {
			buildXTree(this.treeData, "tree", this.pid, 0);
		}
		this.html.append(" tree.write();\n");
		this.html.append(" tree.expand();\n");
		this.html.append("</script>");

		try {
			JspWriter out = this.pageContext.getOut();
			out.println(html.toString());
		} catch (Exception e) {
			throw new JspException(e.getMessage());
		}
		return SKIP_BODY;
	}

	public void buildXTree(DataSet treeData, String tree, String up_id_value, int treeLevelIndex) {
		for (int i = 0; i < treeData.size(); i++) {
			Row localRow = (Row) treeData.get(i);
			if (localRow.getString(this.pidF, "").toString().equals(up_id_value)) {
				String treeItem = "i_" + String.valueOf(treeLevelIndex) + "_" + String.valueOf(i);
				String hiddenValue = "";
				String[] hiddenArr;
				if (this.hiddenF != null) {
					hiddenArr = hiddenF.split(",");
					for (int k = 0; k < hiddenArr.length; k++) {
						hiddenValue = hiddenValue + localRow.getString(hiddenArr[k], "") + ",";
					}
				}
				if (hiddenValue.length() > 0) {
					hiddenValue = hiddenValue.substring(0, hiddenValue.length() - 1);
				}

				this.html.append(" var " + treeItem + " = new WebFXTreeItem('");
				if ((this.checkbox != null) && (this.checkbox.length() > 0)) {
				} else {
					// this.html.append(localRow.get(this.titleF) + "',action('"
					// + hiddenValue + "')");
					hiddenValue = "javascript:action(\"" + hiddenValue + "\")";
//					System.out.println("hidden value:===>>" + hiddenValue);
					this.html.append(localRow.get(this.titleF) + "','" + hiddenValue + "'");
				}
				if ((this.icon != null) && (this.icon.trim().length() > 0)) {
					if ((this.typeF != null) && (localRow.getString(this.typeF, "").toString().length() > 0)) {
						this.html.append(",'','images/" + localRow.getString(this.typeF) + this.icon + "','images/" + localRow.getString(this.typeF) + "open_" + this.icon + "'");
					} else {
						this.html.append(",'','images/" + this.icon + "','images/open_" + this.icon + "'");
					}
				}

				this.html.append(");\n");
				this.html.append(" " + tree + ".add(" + treeItem + ");\n");
				treeLevelIndex += 1;
				buildXTree(treeData, treeItem, (String) localRow.get(this.idF), treeLevelIndex);
			}
		}
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		super.release();
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}

	public String getPidF() {
		return pidF;
	}

	public void setPidF(String pidF) {
		this.pidF = pidF;
	}

	public String getIdF() {
		return idF;
	}

	public void setIdF(String idF) {
		this.idF = idF;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getTypeF() {
		return typeF;
	}

	public void setTypeF(String typeF) {
		this.typeF = typeF;
	}

	public String getTitleF() {
		return titleF;
	}

	public void setTitleF(String titleF) {
		this.titleF = titleF;
	}

	public DataSet getTreeData() {
		return treeData;
	}

	public void setTreeData(DataSet treeData) {
		this.treeData = treeData;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getHeadIcon() {
		return headIcon;
	}

	public void setHeadIcon(String headIcon) {
		this.headIcon = headIcon;
	}

	public String getHiddenF() {
		return hiddenF;
	}

	public void setHiddenF(String hiddenF) {
		this.hiddenF = hiddenF;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getCheckboxtype() {
		return checkboxtype;
	}

	public void setCheckboxtype(String checkboxtype) {
		this.checkboxtype = checkboxtype;
	}

	public String getsJsMethod() {
		return sJsMethod;
	}

	public void setsJsMethod(String sJsMethod) {
		this.sJsMethod = sJsMethod;
	}

	public String getsRand() {
		return sRand;
	}

	public void setsRand(String sRand) {
		this.sRand = sRand;
	}

	public StringBuffer getHtml() {
		return html;
	}

	public void setHtml(StringBuffer html) {
		this.html = html;
	}
}