var s =null;
var iPagesize =20;

function loadStaffs()
{
	s =new Server("getArchiveWorker");
	s.setParam("currentpage", "1");
	s.setParam("pagesize", iPagesize);
	actions(s);
}

function actions(ss)
{
	ss.send(ss, false, function()
	{
		workers =ss.getResult("workers");
		viewWorkers(workers);
		s.setPage(idDivworkerPage, "workers", "actions");
	}
	);
}

function toPage(sName, iPage, iPagesize, iSum)
{
	s.toPage(iPage, eval(sName));
}

function viewWorkers(workers)
{
	Table.clear(idTbWorkers);
	if(workers !=null)
	{
		for(var i=1; i<=workers.getRows(); i++)
		{
			var r =idTbWorkers.insertRow();
			r.className ="tr_c";
			var c =r.insertCell();
			c.innerHTML =workers.get(i, "worker_no");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "name");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "site_name");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "posi_name");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "sex");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "office_phone")+"/"+workers.get(i, "mobile");
			c.className ="center";

			c =r.insertCell();
			c.innerHTML =workers.get(i, "email");

			c =r.insertCell();
			var htm ="";
			if(can_edit_worker)
				htm +="<input type='button' onClick='onEditWorker(\""+ workers.get(i, "worker_id")+"\")' value='编辑'>";
			htm +="<input type='button' onClick='onViewworker(\""+ workers.get(i, "worker_id")+"\")' value='浏览'>";
			c.innerHTML =htm;
			c.noWrap =true;
		}
	}
}

function onEditWorker(worker_id)
{
	var src = WEB_PATH + "/staff/info/WorkerEdit.jsp?worker_id="+worker_id;
	var oLayer = new Layer('信息编辑',src, 0, 320, 650);
	oLayer.closebind("refleshWorkers()");
	mLayId1 =oLayer.id;
	oLayer.show(); 
}

function onViewworker(worker_id)
{
	var src = WEB_PATH + "/norc/school/worker/workerView.jsp?worker_id="+worker_id;
	var oLayer = new Layer('教师信息',src, 0, 320, 650);
	mLayId1 =oLayer.id;
	oLayer.show(); 
}

function refleshWorkers()
{
	s.reset();
	actions(s);
}

function onUploadWorkerImg()
{
	var sWorkerId =$E.getParameter("worker_id");
	if(sWorkerId =="")
		sWorkerId =lid;
	if(sWorkerId ==null)
	{
		alert("必须为指定员工！");
		return;
	}
	var src =WEB_PATH+"/common/upload/FileUpload.jsp?mode=new&deal_type=STAFF_HEAD_PHONE&deal_code="+sWorkerId+"&edit=1&file_type=jpg|gif|png&cover=1&rows=1";

	var oLayer = new Layer('头像', src, 0, 200, 480);
	oLayer.closebind("getworkerTargetPic()");
	oLayer.show(); 
}

function getworkerTargetPic()
{
	var s =new Server("getAttachmentsList");
	s.setParam("deal_type", "STAFF_HEAD_PHONE");
	var tid =$E.getParameter("worker_id");
	if(tid =="")
		tid =lid;
	s.setParam("deal_code", tid);
	s.send(s, false, function()
	{
		var oResult =s.getResult("AttachList");
		if(oResult !=null && oResult.getRows() >0)
		{
			var sFileName =oResult.get(1, "file_code");
			sFileName =tid +"/"+sFileName;
			var sFileType =oResult.get(1, "file_type");
			if(sFileType !="")
				sFileName +="."+sFileType
			var src =WEB_PATH+"/resources/uploads/STAFF_HEAD_PHONE/"+sFileName;
			idImgWorkerHeadPhoto.src =src;
		}
		else
		{
			idImgWorkerHeadPhoto.src ="images/noupload.jpg";
		}
	}
	);
}

function getWorkerInfo(type)
{
	var ss =new Server("getArchiveWorker");
	ss.setParam("worker_id", $E.getParameter("worker_id"));
	ss.setParam("type", type);
	ss.send(ss, false, function()
	{
		if(type ==2)
		{
			var worker =ss.getResult("worker");
			if(worker !=null)
			{
				idSpanSiteName.innerHTML =worker.get(1, "site_name");
				idSpanPosiName.innerHTML =worker.get(1, "posi_name");
				$S("worker_no", worker.get(1, "worker_no"));
				$S("name", worker.get(1, "name"));
				if(worker.get(1, "sex") =="男")
					document.all.sex1.checked =true;
				else
					document.all.sex2.checked =true;
				$S("birthday", worker.get(1, "birthday"));
				$S("office", worker.get(1, "office"));
				$S("tel_phone", worker.get(1, "office_phone"));
				$S("mobile", worker.get(1, "mobile"));
				$S("title_name", worker.get(1, "title_name"));
				$S("email", worker.get(1, "email"));
				$S("intro", worker.get(1, "intro"));
				if(can_edit_worker)
				{
				}
				else
					onPageView();
			}
			getworkerTargetPic();
		}
		else if(type ==3)
		{
			var extend =ss.getResult("worker_extend");
			if(extend !=null)
			{
				$S("education", extend.get(1, "education"));
				$S("project", extend.get(1, "project"));
				$S("award", extend.get(1, "award"));
				$S("booke", extend.get(1, "booke"));
				$S("research", extend.get(1, "research"));
				$S("teaching", extend.get(1, "teaching"));
				if(!can_edit_worker)
					onPageView();
			}
		}
		try
		{
			parent.setFrameHeight();
		}
		catch (e)
		{
		}
	}
	);
}

function onSaveWorker(type)
{
	var ss =new Server("editArchiveWorker");
	if(type =="base")
	{
		ss.setParam("worker_no", $V("worker_no"));
		ss.setParam("name", $V("name"));
		if(document.all.sex1.checked)
			ss.setParam("sex", "男");
		else if(document.all.sex2.checked)
			ss.setParam("sex", "女");
		ss.setParam("birthday", $V("birthday"));
		ss.setParam("office", $V("office"));
		ss.setParam("office_phone", $V("tel_phone"));
		ss.setParam("mobile", $V("mobile"));
		ss.setParam("title_name", $V("title_name"));
		ss.setParam("email", $V("email"));
		ss.setParam("intro", $V("intro"));
	}
	else if(type =="extend")
	{
		ss.setParam("education", $V("education"));
		ss.setParam("project", $V("project"));
		ss.setParam("award", $V("award"));
		ss.setParam("booke", $V("booke"));
		ss.setParam("research", $V("research"));
		ss.setParam("teaching", $V("teaching"));
	}
	ss.setParam("type", type);
	ss.setParam("worker_id", $E.getParameter("worker_id"));
	ss.send(ss, false, function()
	{
		$E.message("信息保存成功！");
	}
	);
}

function onTreeworker(id, type)
{
	s =new Server("getSchoolworker");
	s.setParam("type", 6);
	s.setParam("id", id);
	s.setParam("idtype", type);
	actions(s);
}

function onQueryWorkers()
{
	s =new Server("getSchoolworker");
	s.setParam("worker_no", $V("worker_no"));
	s.setParam("site_name", $V("site_name"));
	s.setParam("name", $V("name"));
	s.setParam("sex", $V("sex"));
	s.setParam("title", $V("title_name"));
	s.setParam("phone", $V("phone"));
	s.setParam("type", 7);
	s.setParam("currentpage", "1");
	s.setParam("pagesize", iPagesize);
	actions(s);
}