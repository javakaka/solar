var flag;

function addloc(locs,mylocs)
{
	for(var x=0;x<locs.length;x++)
	{
		var opt = locs.options[x];
		if (opt.selected)
		{
			flag = true;
			for (var y=0;y<mylocs.length;y++)
			{
				var myopt = mylocs.options[y];
				if (myopt.value == opt.value)
				{
					flag = false;
				}
			}
			if(flag)
			{
				mylocs.options[mylocs.options.length] = new Option(opt.text, opt.value, 0, 0);
			}
		}
	}
}
function ondbclk_add(locs,mylocs)
{
	for(var x=0;x<locs.length;x++)
	{
		var opt = locs.options[x];
		if (opt.selected)
		{
			flag = true;
			for (var y=0;y<mylocs.length;y++)
			{
				var myopt = mylocs.options[y];
				if (myopt.value == opt.value)
				{  
					flag = false;
				}
			}
			if(flag)
			{
				mylocs.options[mylocs.options.length] = new Option(opt.text, opt.value, 0, 0);
			}
		}
	}
}

function delloc(locs,mylocs){
  for(var x=mylocs.length-1;x>=0;x--){
    var opt = mylocs.options[x];
    if (opt.selected){
      mylocs.options[x] = null;
    }
  }
}
function ondbclk_del(locs,mylocs){
  for(var x=mylocs.length-1;x>=0;x--){
    var opt = mylocs.options[x];
    if (opt.selected){
      mylocs.options[x] = null;
    }
  }
}
