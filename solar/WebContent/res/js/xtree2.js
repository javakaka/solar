/*----------------------------------------------------------------------------\
|                            xTree 2.0 PRE RELEASE                            |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
|             This is a pre release and may not be redistributed.             |
|              Watch http://webfx.eae.net for the final version               |
|-----------------------------------------------------------------------------|
|                   Created by Erik Arvidsson & Emil A Eklund                 |
|                  (http://webfx.eae.net/contact.html#erik)                   |
|                  (http://webfx.eae.net/contact.html#emil)                   |
|                      For WebFX (http://webfx.eae.net/)                      |
|-----------------------------------------------------------------------------|
| A tree menu system for IE 5.5+, Mozilla 1.4+, Opera 7, KHTML                |
|-----------------------------------------------------------------------------|
|     Copyright (c) 2003, 2004, 2005, 2006 Erik Arvidsson & Emil A Eklund     |
|-----------------------------------------------------------------------------|
| Licensed under the Apache License, Version 2.0 (the "License"); you may not |
| use this file except in compliance with the License.  You may obtain a copy |
| of the License at http://www.apache.org/licenses/LICENSE-2.0                |
| - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
| Unless  required  by  applicable law or  agreed  to  in  writing,  software |
| distributed under the License is distributed on an  "AS IS" BASIS,  WITHOUT |
| WARRANTIES OR  CONDITIONS OF ANY KIND,  either express or implied.  See the |
| License  for the  specific language  governing permissions  and limitations |
| under the License.                                                          |
|-----------------------------------------------------------------------------|
| Dependencies: xtree2.css - Used to define the look and feel                 |
|-----------------------------------------------------------------------------|
| 2004-02-21 | Pre release distributed to a few selected tester               |
| 2005-06-06 | Added single tab index to improve keyboard navigation          |
| 2006-05-28 | Changed license to Apache Software License 2.0.                |
|-----------------------------------------------------------------------------|
| Created 2003-??-?? | All changes are in the log above. | Updated 2006-05-28 |
\----------------------------------------------------------------------------*/


//
// WebFXTreePersisitance
function WebFXTreePersistence() {}
var _p = WebFXTreePersistence.prototype;
_p.getExpanded = function getExpanded(oNode) { return false; };
_p.setExpanded = function setExpanded(oNode, bOpen) {};



// Cookie handling
function WebFXCookie() {}

_p = WebFXCookie.prototype;

_p.setCookie = function setCookie(sName, sValue, nDays) {
	var expires = "";
	if (typeof nDays == "number") {
		var d = new Date();
		d.setTime(d.getTime() + nDays * 24 * 60 * 60 * 1000);
		expires = "; expires=" + d.toGMTString();
	}

	document.cookie = sName + "=" + escape(sValue) + expires + "; path=/";
};

_p.getCookie = function getCookie(sName) {
	var re = new RegExp("(\;|^)[^;]*(" + sName + ")\=([^;]*)(;|$)");
	var res = re.exec(document.cookie);
	return res != null ? unescape(res[3]) : null;
};

_p.removeCookie = function removeCookie(name) {
	this.setCookie(name, "", -1);
};


//
// persistence using cookies
//
// This is uses one cookie with the ids of the expanded nodes separated using '+'
//
function WebFXTreeCookiePersistence() {
	this._openedMap = {};
	this._cookies = new WebFXCookie;
	var s = this._cookies.getCookie(this.cookieName);
	if (s) {
		var a = s.split("+");
		for (var i = a.length - 1; i >= 0; i--)
			this._openedMap[a[i]] = true;
	}
}

_p = WebFXTreeCookiePersistence.prototype = new WebFXTreePersistence;

_p.cookieName = "webfx-tree-cookie-persistence"

_p.getExpanded = function getExpanded(oNode) {
	return oNode.id in this._openedMap;
};

_p.setExpanded = function setExpanded(oNode, bOpen) {
	var old = this.getExpanded(oNode);
	if (old != bOpen) {
		if (bOpen) {
			this._openedMap[oNode.id] = true;
		} else {
			delete this._openedMap[oNode.id];
		}

		var res = [];
		var i = 0;
		for (var id in this._openedMap)
			res[i++] = id;
		this._cookies.setCookie(this.cookieName, res.join("+"));
	}
};



// this object provides a few useful methods when working with arrays
var arrayHelper = {
	indexOf: function (a, o) {
		for (var i = 0; i < a.length; i++) {
			if (a[i] == o) {
				return i;
			}
		}
		return -1;
	},

	insertBefore: function (a, o, o2) {
		var i = this.indexOf(a, o2);
		if (i == -1) {
			a.push(o);
		} else {
			a.splice(i, 0, o);
		}
	},

	remove: function (a, o) {
		var i = this.indexOf(a, o);
		if (i != -1) {
			a.splice(i, 1);
		}
	}
};

///////////////////////////////////////////////////////////////////////////////
// WebFX Tree Config object                                                  //
///////////////////////////////////////////////////////////////////////////////
var webFXTreeConfig = {
	rootIcon        : "images/folder.png",
	openRootIcon    : "images/openfolder.png",
	folderIcon      : "images/folder.png",
	openFolderIcon  : "images/openfolder.png",
	fileIcon        : "images/file.png",
	iIcon           : "images/I.png",
	lIcon           : "images/L.png",
	lMinusIcon      : "images/Lminus.png",
	lPlusIcon       : "images/Lplus.png",
	tIcon           : "images/T.png",
	tMinusIcon      : "images/Tminus.png",
	tPlusIcon       : "images/Tplus.png",
	plusIcon        : "images/plus.png",
	minusIcon       : "images/minus.png",
	blankIcon       : "images/blank.png",
	defaultText     : "Tree Item",
	defaultAction   : null,
	defaultBehavior : "classic",
	usePersistence	: true
};

///////////////////////////////////////////////////////////////////////////////
// WebFX Tree Handler object                                                 //
///////////////////////////////////////////////////////////////////////////////

var webFXTreeHandler = {
	ie: /msie/i.test(navigator.userAgent),
	opera: /opera/i.test(navigator.userAgent),
	idCounter: 0,
	idPrefix: "wfxt-",
	getUniqueId: function () {
		return this.idPrefix + this.idCounter++;
	},
	all: {},
	getNodeById: function (sId) {
		return all[sId];
	},
	addNode: function (oNode) {
		this.all[oNode.id] = oNode;
	},
	removeNode:	function (oNode) {
		delete this.all[oNode.id];
	},

	handleEvent: function (e) {
		var el = e.target || e.srcElement;
		while (el != null && !this.all[el.id]) {
			el = el.parentNode;
		}

		if (el == null) {
			return false;
		}
		var node = this.all[el.id];
		if (typeof node["_on" + e.type] == "function") {
			return node["_on" + e.type](e);
		}
		return false;
	},

	dispose: function () {
		if (this.disposed) return;
		for (var id in this.all) {
			this.all[id].dispose();
		}
		this.disposed = true;
	},

	htmlToText: function (s) {
		return String(s).replace(/\s+|<([^>])+>|&amp;|&lt;|&gt;|&quot;|&nbsp;/gi, this._htmlToText);
	},

	_htmlToText: function (s) {
		switch (s) {
			case "&amp;":
				return "&";
			case "&lt;":
				return "<";
			case "&gt;":
				return ">";
			case "&quot;":
				return "\"";
			case "&nbsp;":
				return String.fromCharCode(160);
			default:
				if (/\s+/.test(s)) {
					return " ";
				}
				if (/^<BR/gi.test(s)) {
					return "\n";
				}
				return "";
		}
	},

	textToHtml: function (s) {
		return String(s).replace(/&|<|>|\n|\"\u00A0/g, this._textToHtml);
	},

	_textToHtml: function (s) {
		switch (s) {
			case "&":
				return "&amp;";
			case "<":
				return "&lt;";
			case ">":
				return "&gt;";
			case "\n":
				return "<BR>";
			case "\"":
				return "&quot;";	// so we can use this in attributes
			default:
				return "&nbsp;";
		}
	},

	persistenceManager: new WebFXTreeCookiePersistence()
};


///////////////////////////////////////////////////////////////////////////////
// WebFXTreeAbstractNode
///////////////////////////////////////////////////////////////////////////////

function WebFXTreeAbstractNode(sText, oAction) {
	this.childNodes = [];
	if (sText) this.text = sText;
	if (oAction) this.action = oAction;
	this.id = webFXTreeHandler.getUniqueId();
	if (webFXTreeConfig.usePersistence) {
		this.open = webFXTreeHandler.persistenceManager.getExpanded(this);
	}
	webFXTreeHandler.addNode(this);
}


_p = WebFXTreeAbstractNode.prototype;
_p._selected = false;
_p.indentWidth = 19;
_p.open = false;
_p.text = webFXTreeConfig.defaultText;
_p.action = null;
_p.target = null;
_p.toolTip = null;
_p._focused = false;

/* begin tree model */

_p.add = function add(oChild, oBefore) {
	var oldLast;
	var emptyBefore = this.childNodes.length == 0;
	var p = oChild.parentNode;

	if (oBefore == null) { // append
		if (p != null)
			p.remove(oChild);
		oldLast = this.getLastChild();
		this.childNodes.push(oChild);
	} else { // insertBefore
		if (oBefore.parentNode != this) {
			throw new Error("Can only add nodes before siblings");
		}
		if (p != null) {
			p.remove(oChild);
		}

		arrayHelper.insertBefore(this.childNodes, oChild, oBefore);
	}

	if (oBefore) {
		if (oBefore == this.firstChild) {
			this.firstChild = oChild;
		}
		oChild.previousSibling = oBefore.previousSibling;
		oBefore.previousSibling = oChild;
		oChild.nextSibling = oBefore;
	} else {
		if (!this.firstChild) {
			this.firstChild = oChild;
		}
		if (this.lastChild) {
			this.lastChild.nextSibling = oChild;
		}
		oChild.previousSibling = this.lastChild;
		this.lastChild = oChild;
	}

	oChild.parentNode = this;
	var t = this.getTree();
	if (t) {
		oChild.tree = t;
	}
	var d = this.getDepth();
	if (d != null) {
		oChild.depth = d + 1;
	}

	if (this.getCreated() && !t.getSuspendRedraw()) {
		var el = this.getChildrenElement();
		var newEl = oChild.create();
		var refEl = oBefore ? oBefore.getElement() : null;
		el.insertBefore(newEl, refEl);

		if (oldLast) {
			oldLast.updateExpandIcon();
		}
		if (emptyBefore) {
			this.setExpanded(this.getExpanded());
			// if we are using classic expand will not update icon
			if (t && t.getBehavior() != "classic")
				this.updateIcon();
		}
	}

	return oChild;
};



_p.remove = function remove(oChild) {
	// backwards compatible. If no argument remove the node
	if (arguments.length == 0) {
		if (this.parentNode) {
			return this.parentNode.remove(this);
		}
		return null;
	}

	// if we remove selected or tree with the selected we should select this
	var t = this.getTree();
	var si = t ? t.getSelected() : null;
	if (si == oChild || oChild.contains(si)) {
		if (si.getFocused()) {
			this.select();
			window.setTimeout("WebFXTreeAbstractNode._onTimeoutFocus(\"" + this.id + "\")", 10);
		} else {
			this.select();
		}
	}

	if (oChild.parentNode != this) {
		throw new Error("Can only remove children");
	}
	arrayHelper.remove(this.childNodes, oChild);

	if (this.lastChild == oChild) {
		this.lastChild = oChild.previousSibling;
	}
	if (this.firstChild == oChild) {
		this.firstChild = oChild.nextSibling;
	}
	if (oChild.previousSibling) {
		oChild.previousSibling.nextSibling = oChild.nextSibling;
	}
	if (oChild.nextSibling) {
		oChild.nextSibling.previousSibling = oChild.previousSibling;
	}

	var wasLast = oChild.isLastSibling();

	oChild.parentNode = null;
	oChild.tree = null;
	oChild.depth = null;

	if (t && this.getCreated() && !t.getSuspendRedraw()) {
		var el = this.getChildrenElement();
		var childEl = oChild.getElement();
		el.removeChild(childEl);
		if (wasLast) {
			var newLast = this.getLastChild();
			if (newLast) {
				newLast.updateExpandIcon();
			}
		}
		if (!this.hasChildren()) {
			el.style.display = "none";
			this.updateExpandIcon();
			this.updateIcon();
		}
	}

	return oChild;
};

WebFXTreeAbstractNode._onTimeoutFocus = function (sId) {
	var jsNode = webFXTreeHandler.all[sId];
	jsNode.focus();
};

_p.getId = function getId() {
	return this.id;
};

_p.getTree = function getTree() {
	throw new Error("getTree called on Abstract Node");
};

_p.getDepth = function getDepth() {
	throw new Error("getDepth called on Abstract Node");
};

_p.getCreated = function getCreated() {
	var t = this.getTree();
	return t && t.rendered;
};

_p.getParent = function getParent() {
	return this.parentNode;
};

_p.contains = function contains(oDescendant) {
	if (oDescendant == null) return false;
	if (oDescendant == this) return true;
	var p = oDescendant.parentNode;
	return this.contains(p);
};

_p.getChildren = _p.getChildNodes = function getChildNodes() {
	return this.childNodes;
};

_p.getFirstChild = function getFirstChild() {
	return this.childNodes[0];
};

_p.getLastChild = function getLastChild() {
	return this.childNodes[this.childNodes.length - 1];
};

_p.getPreviousSibling = function getPreviousSibling() {
	return this.previousSibling;
	//var p = this.parentNode;
	//if (p == null) return null;
	//var cs = p.childNodes;
	//return cs[arrayHelper.indexOf(cs, this) - 1]
};

_p.getNextSibling = function getNextSibling() {
	return this.nextSibling;
	//var p = this.parentNode;
	//if (p == null) return null;
	//var cs = p.childNodes;
	//return cs[arrayHelper.indexOf(cs, this) + 1]
};

_p.hasChildren = function hasChildren() {
	return this.childNodes.length > 0;
};

_p.isLastSibling = function isLastSibling() {
	return this.nextSibling == null;
	//return this.parentNode && this == this.parentNode.getLastChild();
};

_p.findChildByText = function findChildByText(s, n) {
	if (!n) {
		n = 0;
	}
	var isRe = s instanceof RegExp;
	for (var i = 0; i < this.childNodes.length; i++) {
		if (isRe && s.test(this.childNodes[i].getText()) ||
			this.childNodes[i].getText() == s) {
			if (n == 0) {
				return this.childNodes[i];
			}
			n--;
		}
	}
	return null;
};

_p.findNodeByText = function findNodeByText(s, n) {
	if (!n) {
		n = 0;
	}
	var isRe = s instanceof RegExp;
	if (isRe && s.test(this.getText()) || this.getText() == s) {
		if (n == 0) {
			return this.childNodes[i];
		}
		n--;
	}

	var res;
	for (var i = 0; i < this.childNodes.length; i++) {
		res = this.childNodes[i].findNodeByText(s, n);
		if (res) {
			return res;
		}
	}
	return null;
};

/* end tree model */

_p.setId = function setId(sId) {
	var el = this.getElement();
	webFXTreeHandler.removeNode(this);
	this.id = sId;
	if (el) {
		el.id = sId;
	}
	webFXTreeHandler.addNode(this);
};

_p.isSelected = function isSelected() {
	return this._selected;
};

_p.select = function select() {
	this._setSelected(true);
};

_p.deselect = function deselect() {
	this._setSelected(false);
};

_p._setSelected = function _setSelected(b) {
	var t = this.getTree();
	if (!t) return;
	if (this._selected != b) {
		this._selected = b;

		var wasFocused = false;	// used to keep focus state
		var si = t.getSelected();
		if (b && si != null && si != this) {
			var oldFireChange = t._fireChange;
			wasFocused = si._focused;
			t._fireChange = false;
			si._setSelected(false);
			t._fireChange = oldFireChange;
		}

		var el = this.getRowElement();
		if (el) {
			el.className = this.getRowClassName();
		}
		if (b) {
			this._setTabIndex(t.tabIndex);
			t._selectedItem = this;
			t._fireOnChange();
			t.setSelected(this);
			if (wasFocused) {
				this.focus();
			}
		} else {
			this._setTabIndex(-1);
		}

		if (t.getBehavior() != "classic") {
			this.updateIcon();
		}
	}
};


_p.getExpanded = function getExpanded() {
	return this.open;
};

_p.setExpanded = function setExpanded(b) {
	var ce;
	this.open = b;
	var t = this.getTree();
	if (this.hasChildren()) {
		var si = t ? t.getSelected() : null;
		if (!b && this.contains(si)) {
			this.select();
		}

		var el = this.getElement();
		if (el) {
			ce = this.getChildrenElement();
			if (ce) {
				ce.style.display = b ? "block" : "none";
			}
			var eie = this.getExpandIconElement();
			if (eie) {
				eie.src = this.getExpandIconSrc();
			}
		}

		if (webFXTreeConfig.usePersistence) {
			webFXTreeHandler.persistenceManager.setExpanded(this, b);
		}
	} else {
		ce = this.getChildrenElement();
		if (ce)
			ce.style.display = "none";
	}
	if (t && t.getBehavior() == "classic") {
		this.updateIcon();
	}
};

_p.toggle = function toggle() {
	this.setExpanded(!this.getExpanded());
};

_p.expand = function expand() {
	this.setExpanded(true);
};

_p.collapse = function collapse() {
	this.setExpanded(false);
};

_p.collapseChildren = function collapseChildren() {
	var cs = this.childNodes;
	for (var i = 0; i < cs.length; i++) {
		cs[i].collapseAll();
	}
};

_p.collapseAll = function collapseAll() {
	this.collapseChildren();
	this.collapse();
};

_p.expandChildren = function expandChildren() {
	var cs = this.childNodes;
	for (var i = 0; i < cs.length; i++) {
		cs[i].expandAll();
	}
};

_p.expandAll = function expandAll() {
	this.expandChildren();
	this.expand();
};

_p.reveal = function reveal() {
	var p = this.getParent();
	if (p) {
		p.setExpanded(true);
		p.reveal();
	}
};

_p.openPath = function openPath(sPath, bSelect, bFocus) {
	if (sPath == "") {
		if (bSelect) {
			this.select();
		}
		if (bFocus) {
			window.setTimeout("WebFXTreeAbstractNode._onTimeoutFocus(\"" + this.id + "\")", 10);
		}
		return;
	}

	var parts = sPath.split("/");
	var remainingPath = parts.slice(1).join("/");
	var t = this.getTree();
	if (sPath.charAt(0) == "/") {
		if (t) {
			t.openPath(remainingPath, bSelect, bFocus);
		} else {
			throw "Invalid path";
		}
	} else {
		// open
		this.setExpanded(true);
		parts = sPath.split("/");
		var ti = this.findChildByText(parts[0]);
		if (!ti) {
			throw "Could not find child node with text \"" + parts[0] + "\"";
		}
		ti.openPath(remainingPath, bSelect, bFocus);
	}
};

_p.focus = function focus() {
	var el = this.getLabelElement();
	if (el) {
		el.focus();
	}
};

_p.getFocused = function getFocused() {
	return this._focused;
};

_p._setTabIndex = function _setTabIndex(i) {
	var a = this.getLabelElement();
	if (a) {
		if (i == "") {
			a.removeAttribute("tabIndex");
		} else {
			a.setAttribute("tabIndex", i);
		}
	}
};


// HTML generation

_p.toHtml = function toHtml() {
	var sb = [];
	var cs = this.childNodes;
	var l = cs.length;
	for (var y = 0; y < l; y++) {
		sb[y] = cs[y].toHtml();
	}

	var t = this.getTree();
	var hideLines = !t.getShowLines() || t == this.parentNode && !t.getShowRootLines();

	return "<div class=\"webfx-tree-item\" id=\"" +
		this.id + "\"" + this.getEventHandlersHtml() + ">" +
		this.getRowHtml() +
		"<div class=\"webfx-tree-children" +
		(hideLines ? "-nolines" : "") + "\" style=\"" +
		this.getLineStyle() +
		(this.getExpanded() && this.hasChildren() ? "" : "display:none;") +
		"\">" +
		sb.join("") +
		"</div></div>";
};

_p.getRowHtml = function getRowHtml() {
	var t = this.getTree();
	return "<div class=\"" + this.getRowClassName() + "\" style=\"padding-left:" +
		Math.max(0, (this.getDepth() - 1) * this.indentWidth) + "px\">" +
		this.getExpandIconHtml() +
		//"<span class=\"webfx-tree-icon-and-label\">" +
		this.getIconHtml() +
		this.getLabelHtml() +
		//"</span>" +
		"</div>";
};

_p.getRowClassName = function getRowClassName() {
	return "webfx-tree-row" + (this.isSelected() ? " selected" : "") +
		(this.action ? "" : " no-action");
};

_p.getLabelHtml = function getLabelHtml() {
	var toolTip = this.getToolTip();
	var target = this.getTarget();
	return "<a href=\"" + webFXTreeHandler.textToHtml(this._getHref()) +
		"\" class=\"webfx-tree-item-label\" tabindex=\"-1\"" +
		(toolTip ? " title=\"" + webFXTreeHandler.textToHtml(toolTip) + "\"" : "") +
		(target ? " target=\"" + target + "\"" : "") +
		" onfocus=\"webFXTreeHandler.handleEvent(event)\"" +
		" onblur=\"webFXTreeHandler.handleEvent(event)\">" +
		this.getHtml() + "</a>";
};

_p._getHref = function _getHref() {
	if (typeof this.action == "string")
		return this.action;
	else
		return "#";
};

_p.getEventHandlersHtml = function getEventHandlersHtml() {
	return "";
};

_p.getIconHtml = function getIconHtml() {
	// here we are not using textToHtml since the file names rarerly contains
	// HTML...
	return "<img class=\"webfx-tree-icon\" src=\"" + this.getIconSrc() + "\">";
};

_p.getIconSrc = function getIconSrc() {
	throw new Error("getIconSrc called on Abstract Node");
};

_p.getExpandIconHtml = function getExpandIconHtml() {
	// here we are not using textToHtml since the file names rarerly contains
	// HTML...
	return "<img class=\"webfx-tree-expand-icon\" src=\"" +
		this.getExpandIconSrc() + "\">";
};


_p.getExpandIconSrc = function getExpandIconSrc() {
	var src;
	var t = this.getTree();
	var hideLines = !t.getShowLines() || t == this.parentNode && !t.getShowRootLines();

	if (this.hasChildren()) {
		var bits = 0;
		/*
			Bitmap used to determine which icon to use
			1  Plus
			2  Minus
			4  T Line
			8  L Line
		*/

		if (t && t.getShowExpandIcons()) {
			if (this.getExpanded()) {
				bits = 2;
			} else {
				bits = 1;
			}
		}

		if (t && !hideLines) {
			if (this.isLastSibling()) {
				bits += 4;
			} else {
				bits += 8;
			}
		}

		switch (bits) {
			case 1:
				return webFXTreeConfig.plusIcon;
			case 2:
				return webFXTreeConfig.minusIcon;
			case 4:
				return webFXTreeConfig.lIcon;
			case 5:
				return webFXTreeConfig.lPlusIcon;
			case 6:
				return webFXTreeConfig.lMinusIcon;
			case 8:
				return webFXTreeConfig.tIcon;
			case 9:
				return webFXTreeConfig.tPlusIcon;
			case 10:
				return webFXTreeConfig.tMinusIcon;
			default:	// 0
				return webFXTreeConfig.blankIcon;
		}
	} else {
		if (t && hideLines) {
			return webFXTreeConfig.blankIcon;
		} else if (this.isLastSibling()) {
			return webFXTreeConfig.lIcon;
		} else {
			return webFXTreeConfig.tIcon;
		}
	}
};

_p.getLineStyle = function getLineStyle() {
	return "background-position:" + this.getLineStyle2() + ";";
};

_p.getLineStyle2 = function getLineStyle2() {
	return (this.isLastSibling() ? "-100" : (this.getDepth() - 1) * this.indentWidth) + "px 0";
};

// End HTML generation

// DOM
// this returns the div for the tree node
_p.getElement = function getElement() {
	return document.getElementById(this.id);
};

// the row is the div that is used to draw the node without the children
_p.getRowElement = function getRowElement() {
	var el = this.getElement();
	if (!el) return null;
	return el.firstChild;
};

// plus/minus image
_p.getExpandIconElement = function getExpandIconElement() {
	var el = this.getRowElement();
	if (!el) return null;
	return el.firstChild;
};

_p.getIconElement = function getIconElement() {
	var el = this.getRowElement();
	if (!el) return null;
	return el.childNodes[1];
};

// anchor element
_p.getLabelElement = function getLabelElement() {
	var el = this.getRowElement();
	if (!el) return null;
	return el.lastChild;
};

// the div containing the children
_p.getChildrenElement = function getChildrenElement() {
	var el = this.getElement();
	if (!el) return null;
	return el.lastChild;
};


// IE uses about:blank if not attached to document and this can cause Win2k3
// to fail
if (webFXTreeHandler.ie) {
	_p.create = function create() {
		var dummy = document.createElement("div");
		dummy.style.display = "none";
		document.body.appendChild(dummy);
		dummy.innerHTML = this.toHtml();
		var res = dummy.removeChild(dummy.firstChild);
		document.body.removeChild(dummy);
		return res;
	};
} else {
	_p.create = function create() {
		var dummy = document.createElement("div");
		dummy.innerHTML = this.toHtml();
		return dummy.removeChild(dummy.firstChild);
	};
}

// Getters and setters for some common fields

_p.setIcon = function setIcon(s) {
	this.icon = s;
	if (this.getCreated()) {
		this.updateIcon();
	}
};

_p.getIcon = function getIcon() {
	return this.icon;
};

_p.setOpenIcon = function setOpenIcon(s) {
	this.openIcon = s;
	if (this.getCreated()) {
		this.updateIcon();
	}
};

_p.getOpenIcon = function getOpenIcon() {
	return this.openIcon;
};

_p.setText = function setText(s) {
	this.setHtml(webFXTreeHandler.textToHtml(s));
};

_p.getText = function getText() {
	return webFXTreeHandler.htmlToText(this.getHtml());
};

_p.setHtml = function setHtml(s) {
	this.text = s;
	var el = this.getLabelElement();
	if (el) {
		el.innerHTML = s;
	}
};

_p.getHtml = function getHtml() {
	return this.text;
};

_p.setTarget = function setTarget(s) {
	this.target = s;
};

_p.getTarget = function getTarget() {
	return this.target;
};

_p.setToolTip = function setToolTip(s) {
	this.toolTip = s;
	var el = this.getLabelElement();
	if (el) {
		el.title = s;
	}
};

_p.getToolTip = function getToolTip() {
	return this.toolTip;
};

_p.setAction = function setAction(oAction) {
	this.action = oAction;
	var el = this.getLabelElement();
	if (el) {
		el.href = this._getHref();
	}
	el = this.getRowElement();
	if (el) {
		el.className = this.getRowClassName();
	}
};

_p.getAction = function getAction() {
	return this.action;
};

// update methods

_p.update = function update() {
	var t = this.getTree();
	if (t.suspendRedraw) return;
	var el = this.getElement();
	if (!el || !el.parentNode) return;
	var newEl = this.create();
	el.parentNode.replaceChild(newEl, el);
	this._setTabIndex(this.tabIndex); // in case root had the tab index
	var si = t.getSelected();
	if (si && si.getFocused()) {
		si.focus();
	}
};

_p.updateExpandIcon = function updateExpandIcon() {
	var t = this.getTree();
	if (t.suspendRedraw) return;
	var img = this.getExpandIconElement();
	img.src = this.getExpandIconSrc();
	var cel = this.getChildrenElement();
	cel.style.backgroundPosition = this.getLineStyle2();
};

_p.updateIcon = function updateIcon() {
	var t = this.getTree();
	if (t.suspendRedraw) return;
	var img = this.getIconElement();
	if (img) {
		img.src = this.getIconSrc();
	}
};

// End DOM

_p._callSuspended = function _callSuspended(f) {
	var t = this.getTree();
	var sr = t.getSuspendRedraw();
	t.setSuspendRedraw(true);
	f.call(this);
	t.setSuspendRedraw(sr);
};

// Event handlers

_p._onmousedown = function _onmousedown(e) {
	var el = e.target || e.srcElement;
	// expand icon
	if (/webfx-tree-expand-icon/.test(el.className) && this.hasChildren()) {
		this.toggle();
		if (webFXTreeHandler.ie) {
			window.setTimeout("WebFXTreeAbstractNode._onTimeoutFocus(\"" + this.id + "\")", 10);
		}
		return false;
	}

	this.select();
	if (/*!/webfx-tree-item-label/.test(el.className) && */!webFXTreeHandler.opera)	{ // opera cancels the click if focus is called
		
		// in case we are not clicking on the label
		if (webFXTreeHandler.ie) {
			window.setTimeout("WebFXTreeAbstractNode._onTimeoutFocus(\"" + this.id + "\")", 10);
		} else {
			this.focus();
		}
	}
	var rowEl = this.getRowElement();
	if (rowEl) {
		rowEl.className = this.getRowClassName();
	}

	return false;
};

_p._onclick = function _onclick(e) {
	var el = e.target || e.srcElement;
	// expand icon
	if (/webfx-tree-expand-icon/.test(el.className) && this.hasChildren()) {
		return false;
	}

	if (typeof this.action == "function") {
		this.action();
	} else if (this.action != null) {
		window.open(this.action, this.target || "_self");
	}
	return false;
};


_p._ondblclick = function _ondblclick(e) {
	var el = e.target || e.srcElement;
	// expand icon
	if (/webfx-tree-expand-icon/.test(el.className) && this.hasChildren()) {
		return;
	}

	this.toggle();
};

_p._onfocus = function _onfocus(e) {
	this.select();
	this._focused = true;
};

_p._onblur = function _onblur(e) {
	this._focused = false;
};

_p._onkeydown = function _onkeydown(e) {
	var n;
	var rv = true;
	switch (e.keyCode) {
		case 39:	// RIGHT
			if (e.altKey) {
				rv = true;
				break;
			}
			if (this.hasChildren()) {
				if (!this.getExpanded()) {
					this.setExpanded(true);
				} else {
					this.getFirstChild().focus();
				}
			}
			rv = false;
			break;
		case 37:	// LEFT
			if (e.altKey) {
				rv = true;
				break;
			}
			if (this.hasChildren() && this.getExpanded()) {
				this.setExpanded(false);
			} else {
				var p = this.getParent();
				var t = this.getTree();
				// don't go to root if hidden
				if (p && (t.showRootNode || p != t)) {
					p.focus();
				}
			}
			rv = false;
			break;

		case 40:	// DOWN
			n = this.getNextShownNode();
			if (n) {
				n.focus();
			}
			rv = false;
			break;
		case 38:	// UP
			n = this.getPreviousShownNode()
			if (n) {
				n.focus();
			}
			rv = false;
			break;
	}

	if (!rv && e.preventDefault) {
		e.preventDefault();
	}
	e.returnValue = rv;
	return rv;
};

_p._onkeypress = function _onkeypress(e) {
	if (!e.altKey && e.keyCode >= 37 && e.keyCode <= 40) {
		if (e.preventDefault) {
			e.preventDefault();
		}
		e.returnValue = false;
		return false;
	}
};

// End event handlers

_p.dispose = function dispose() {
	if (this.disposed) return;
	for (var i = this.childNodes.length - 1; i >= 0; i--) {
		this.childNodes[i].dispose();
	}
	this.tree = null;
	this.parentNode = null;
	this.childNodes = null;
	this.disposed = true;
};

// Some methods that are usable when navigating the tree using the arrows
_p.getLastShownDescendant = function getLastShownDescendant() {
	if (!this.getExpanded() || !this.hasChildren()) {
		return this;
	}
	// we know there is at least 1 child
	return this.getLastChild().getLastShownDescendant();
};

_p.getNextShownNode = function getNextShownNode() {
	if (this.hasChildren() && this.getExpanded()) {
		return this.getFirstChild();
	} else {
		var p = this;
		var next;
		while (p != null) {
			next = p.getNextSibling();
			if (next != null) {
				return next;
			}
			p = p.getParent();
		}
		return null;
	}
};

_p.getPreviousShownNode = function getPreviousShownNode() {
	var ps = this.getPreviousSibling();
	if (ps != null) {
		return ps.getLastShownDescendant();
	}
	var p = this.getParent();
	var t = this.getTree();
	if (!t.showRootNode && p == t) {
		return null;
	}
	return p;
};







///////////////////////////////////////////////////////////////////////////////
// WebFXTree
///////////////////////////////////////////////////////////////////////////////

function WebFXTree(sText, oAction, sBehavior, sIcon, sOpenIcon) {
	WebFXTreeAbstractNode.call(this, sText, oAction);
	if (sIcon) this.icon = sIcon;
	if (sOpenIcon) this.openIcon = sOpenIcon;
	if (sBehavior) this.behavior = sBehavior;
}

_p = WebFXTree.prototype = new WebFXTreeAbstractNode;
_p.indentWidth = 19;
_p.open = true;
_p._selectedItem = null;
_p._fireChange = true;
_p.rendered = false;
_p.suspendRedraw = false;
_p.showLines = true;
_p.showExpandIcons = true;
_p.showRootNode = true;
_p.showRootLines = true;

_p.getTree = function getTree() {
	return this;
};

_p.getDepth = function getDepth() {
	return 0;
};

_p.getCreated = function getCreated() {
	return this.rendered;
};


/* end tree model */

_p.getExpanded = function getExpanded() {
	return !this.showRootNode || WebFXTreeAbstractNode.prototype.getExpanded.call(this);
};

_p.setExpanded = function setExpanded(b) {
	if (!this.showRootNode) {
		this.open = b;
	} else {
		WebFXTreeAbstractNode.prototype.setExpanded.call(this, b);
	}
};

_p.getExpandIconHtml = function getExpandIconHtml() {
	return "";
};

// we don't have an expand icon here
_p.getIconElement = function getIconElement() {
	var el = this.getRowElement();
	if (!el) return null;
	return el.firstChild;
};

// no expand icon for root element
_p.getExpandIconElement = function getExpandIconElement(oDoc) {
	return null;
};

_p.updateExpandIcon = function updateExpandIcon() {
	// no expand icon
};

_p.getRowClassName = function getRowClassName() {
	return WebFXTreeAbstractNode.prototype.getRowClassName.call(this) +
		(this.showRootNode ? "" : " webfx-tree-hide-root");
};


// if classic then the openIcon is used for expanded, otherwise openIcon is used
// for selected

_p.getIconSrc = function getIconSrc() {
	var behavior = this.getTree() ? this.getTree().getBehavior() : webFXTreeConfig.defaultBehavior;
	var open = behavior == "classic" && this.getExpanded() ||
			   behavior != "classic" && this.isSelected();
	if (open && this.openIcon) {
		return this.openIcon;
	}
	if (!open && this.icon) {
		return this.icon;
	}
	// fall back on default icons
	return open ? webFXTreeConfig.openRootIcon : webFXTreeConfig.rootIcon;
};

_p.getEventHandlersHtml = function getEventHandlersHtml() {
	return " onclick=\"return webFXTreeHandler.handleEvent(event)\" " +
		"onmousedown=\"return webFXTreeHandler.handleEvent(event)\" " +
		"ondblclick=\"return webFXTreeHandler.handleEvent(event)\" " +
		"onkeydown=\"return webFXTreeHandler.handleEvent(event)\" " +
		"onkeypress=\"return webFXTreeHandler.handleEvent(event)\"";
};

_p.setSelected = function setSelected(o) {
	if (this._selectedItem != o && o) {
		o._setSelected(true);
	}
};

_p._fireOnChange = function _fireOnChange() {
	if (this._fireChange && typeof this.onchange == "function") {
		this.onchange();
	}
};

_p.getSelected = function getSelected() {
	return this._selectedItem;
};

_p.tabIndex = "";

_p.setTabIndex = function setTabIndex(i) {
	var n = this._selectedItem || (this.showRootNode ? this : this.firstChild);
	this.tabIndex = i;
	if (n) {
		n._setTabIndex(i);
	}	
};

_p.getTabIndex = function getTabIndex() {
	return this.tabIndex;
};

_p.setBehavior = function setBehavior(s) {
	this.behavior = s;
};

_p.getBehavior = function getBehavior() {
	return this.behavior || webFXTreeConfig.defaultBehavior;
};

_p.setShowLines = function setShowLines(b) {
	if (this.showLines != b) {
		this.showLines = b;
		if (this.rendered) {
			this.update();
		}
	}
};

_p.getShowLines = function getShowLines() {
	return this.showLines;
};

_p.setShowRootLines = function setShowRootLines(b) {
	if (this.showRootLines != b) {
		this.showRootLines = b;
		if (this.rendered) {
			this.update();
		}
	}
};

_p.getShowRootLines = function getShowRootLines() {
	return this.showRootLines;
};

_p.setShowExpandIcons = function setShowExpandIcons(b) {
	if (this.showExpandIcons != b) {
		this.showExpandIcons = b;
		if (this.rendered) {
			this.getTree().update();
		}
	}
};

_p.getShowExpandIcons = function getShowExpandIcons() {
	return this.showExpandIcons;
};

_p.setShowRootNode = function setShowRootNode(b) {
	if (this.showRootNode != b) {
		this.showRootNode = b;
		if (this.rendered) {
			this.getTree().update();
		}
	}
};

_p.getShowRoootNode = function getShowRoootNode() {
	return this.showRootNode;
};

_p.onchange = function onchange() {};

_p.create = function create() {
	var el = WebFXTreeAbstractNode.prototype.create.call(this);
	this.setTabIndex(this.tabIndex);
	this.rendered = true;
	return el;
};

_p.write = function write() {
	document.write(this.toHtml());
	this.setTabIndex(this.tabIndex);
	this.rendered = true;
};

_p.setSuspendRedraw = function setSuspendRedraw(b) {
	this.suspendRedraw = b;
};

_p.getSuspendRedraw = function getSuspendRedraw() {
	return this.suspendRedraw;
};



///////////////////////////////////////////////////////////////////////////////
// WebFXTreeItem
///////////////////////////////////////////////////////////////////////////////

function WebFXTreeItem(sText, oAction, eParent, sIcon, sOpenIcon) {
	WebFXTreeAbstractNode.call(this, sText, oAction);
	if (sIcon) this.icon = sIcon;
	if (sOpenIcon) this.openIcon = sOpenIcon;
	if (eParent) eParent.add(this);
}

_p = WebFXTreeItem.prototype = new WebFXTreeAbstractNode;
_p.tree = null;

/* tree model */

_p.getDepth = function getDepth() {
	if (this.depth != null) {
		return this.depth;
	}
	if (this.parentNode) {
		var pd = this.parentNode.getDepth();
		return this.depth = (pd != null ? pd + 1 : null);
	}
	return null;
};

_p.getTree = function getTree() {
	if (this.tree) {
		return this.tree;
	}
	if (this.parentNode) {
		return this.tree = this.parentNode.getTree();
	}
	return null;
};

_p.getCreated = function getCreated() {
	var t = this.getTree();
	return t && t.getCreated();
};

// if classic then the openIcon is used for expanded, otherwise openIcon is used
// for selected
_p.getIconSrc = function getIconSrc() {
	var behavior = this.getTree() ? this.getTree().getBehavior() : webFXTreeConfig.defaultBehavior;
	var open = behavior == "classic" && this.getExpanded() ||
	           behavior != "classic" && this.isSelected();
	if (open && this.openIcon) {
		return this.openIcon;
	}
	if (!open && this.icon) {
		return this.icon;
	}

	// fall back on default icons
	if (this.hasChildren()) {
		return open ? webFXTreeConfig.openFolderIcon : webFXTreeConfig.folderIcon;
	}
	return webFXTreeConfig.fileIcon;
};

/* end tree model */




if (window.attachEvent) {
	window.attachEvent("onunload", function () {
		for (var id in webFXTreeHandler.all)
			webFXTreeHandler.all[id].dispose();
	});
}
