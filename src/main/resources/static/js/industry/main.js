 $(function () {
	    //Enable iCheck plugin for checkboxes
	    //iCheck for checkbox and radio inputs
	    $('.tb-industry input[type="checkbox"]').iCheck({
	      checkboxClass: 'icheckbox_flat-blue',
	      radioClass: 'iradio_flat-blue'
	    });

	    //Enable check and uncheck all functionality
	   $(".checkbox-toggle66").click(function () {
	      var clicks = $(this).data('clicks');
	      if (clicks) {
	        //Uncheck all checkboxes
	        $(".tb-industry input[type='checkbox']").iCheck("uncheck");
	        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
	      } else {
	        //Check all checkboxes
	        $(".tb-industry input[type='checkbox']").iCheck("check");
	        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
	      }
	      $(this).data("clicks", !clicks);
	    });
	   
	

	   $("#do_active_industry").click(function(){
		   var ids = [];
		     $.each($("#frm-table-industry input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-industry").attr('action',"admin/industry/active");
		    	 $("#frm-table-industry").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
	   $("#do_disabled_industry").click(function(){
		   var ids = [];
		     $.each($("#frm-table-industry input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-industry").attr('action',"admin/industry/disabled");
		    	 $("#frm-table-industry").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
	   $("#do_delete_industry").click(function(){
		   var ids = [];
		     $.each($("#frm-table-industry input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-industry").attr('action',"admin/industry/delete");
		    	 $("#frm-table-industry").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
 });	   