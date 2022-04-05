function doLike(pid,uid) 
{
    console.log(pid +" "+uid);
    
    const d = {
    		uid : uid,
    		pid : pid,
    		operation : 'like'
    }
    
    $.ajax({
    	url : 'LikeServlet',
    	data : d,
    	 success: function (data,status,xhr) { 
    		 
    		 console.log(data);
    		 if(data.trim() == 'true')
    			 {
    			     let c = $('.like-span').html();
    			     c++;
    			     $('.like-span').html(c);
    			 }
    	 },
         error: function (jqxhr,textstatus,errorThrown) { 
    		 
    		 console.log(data);
    	 }
    	 
    })
    
    
    
}