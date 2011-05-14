$(function() {
  var faye = new Faye.Client('http://vivid-sword-660.heroku.com/bayeux');
  faye.subscribe("/messages/new", function(data) {
    if(valuate(data,$('#username').text()))
    {
      eval(data);
    }
  });
  $('#username').hide(); 
});

function valuate(data,user_name)
{
   i = data.indexOf("created_at")+17;
   j = data.indexOf(' ',i);
   creator_name = data.slice(i,j);  
   if(creator_name == user_name)
   {  
      return true;
   }
   
   i = data.indexOf("<li>")+4;
   j = data.indexOf("<span");
   msg = data.slice(i,j)+' '; 
   while(msg.indexOf("\\n") != -1)
   {   
      msg = msg.replace("\\n",'');
   }
   
   if(msg.indexOf('@') == -1)
   {
      return true;
   }
   else
   {
      while(msg.indexOf('@') != -1)
      {      
        i = msg.indexOf('@')+1;
        j = msg.indexOf(' ',i);
        mentioned_name = msg.slice(i,j);
        if(mentioned_name == user_name)
        {
            return true;
        }
        msg = msg.substring(j);               
      } 
      return false;     
   }      
}

