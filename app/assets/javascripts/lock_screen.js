function LockScreen(tag,title,width,height,url)
{
    if (tag) //锁屏
    {
        var lockdiv = document.getElementById("lockscreen");
        if (lockdiv!=null)
        {
            lockdiv.style.display = "block";
            var subdiv = document.getElementById("subdialog");
            if (subdiv!=null)
            {
                subdiv.style.display = "block";
                document.getElementById("dialog1").src = url;
            }          
        }else{
            //创建新的锁屏DIV,并执行锁屏
            var tabframe= document.createElement("div");
            tabframe.id = "lockscreen";
            tabframe.name = "lockscreen";
            tabframe.style.top = '0px';
            tabframe.style.left = '0px';
            tabframe.style.height = '100%';
            tabframe.style.width = '100%';
            tabframe.style.position = "absolute";
            tabframe.style.filter = "Alpha(opacity=10)";
            tabframe.style.backgroundColor="#000000";
            tabframe.style.zIndex = "99998";
            document.body.appendChild(tabframe);
            tabframe.style.display = "block";
            //子DIV
            var subdiv = document.createElement("div");
            subdiv.id = "subdialog";
            subdiv.name = "subdialog";
            subdiv.style.top = Math.round((tabframe.clientHeight-height)/2);
            subdiv.style.left = Math.round((tabframe.clientWidth-width)/2);
            subdiv.style.height = height+'px';
            subdiv.style.width = width+'px';
            subdiv.style.position = "absolute";
            subdiv.style.backgroundColor="#000000"; 
            subdiv.style.zIndex = "99999";
            subdiv.style.filter = "Alpha(opacity=100)";
            subdiv.style.border = "1px";
            //subdiv.onmousemove = mouseMoveDialog;
            //subdiv.onmousedown = control_onmousedown;
            //subdiv.onmouseup = mouseUp;
            document.body.appendChild(subdiv);
            subdiv.style.display = "block";
            //subdiv.onclick=UNLockScreen;
            var iframe_height = height-30;
            var titlewidth = width;
            var html = "<table border='0' cellpadding='0' cellspacing='0'>"
            html += "<tr><td></td><td>";
            html += "<table><tr><td><font color='#FFFFFF'><b>"+title+"</b></font></td><td style='width:30px' valign='top'><img src='/assets/close.gif' ></img></td></tr></table>";
            html += "</td><td></td></tr>";
            html += "<tr><td></td><td style='height:100px;'><iframe id='dialog1' frameborder=0 style='width:"+titlewidth+"px;height:" + iframe_height + "px' src='"+url+"'></iframe></td><td></td></tr>";
            html += "<td></td><td></td><td></td>";
            html += "</table>";
            subdiv.innerHTML = html;
        }
    }else{
        //解屏
        var lockdiv = document.getElementById("lockscreen");
        if (lockdiv!=null)
        {
            lockdiv.style.display = "none";
        }
        var subdiv = document.getElementById("subdialog");
        if (subdiv!=null)
        {
            subdiv.style.display = "none";
        }
    }
}

 

function UNLockScreen(){
   LockScreen(false);
}
