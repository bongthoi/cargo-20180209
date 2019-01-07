 $(function () {
	    //Enable iCheck plugin for checkboxes
	    //iCheck for checkbox and radio inputs
	    $('.tb-category input[type="checkbox"]').iCheck({
	      checkboxClass: 'icheckbox_flat-blue',
	      radioClass: 'iradio_flat-blue'
	    });

	    //Enable check and uncheck all functionality
	   $(".checkbox-toggle77").click(function () {
	      var clicks = $(this).data('clicks');
	      if (clicks) {
	        //Uncheck all checkboxes
	        $(".tb-category input[type='checkbox']").iCheck("uncheck");
	        $(".fa", this).removeClass("fa-check-square-o").addClass('fa-square-o');
	      } else {
	        //Check all checkboxes
	        $(".tb-category input[type='checkbox']").iCheck("check");
	        $(".fa", this).removeClass("fa-square-o").addClass('fa-check-square-o');
	      }
	      $(this).data("clicks", !clicks);
	    });
	   
	

	   $("#do_active_category").click(function(){
		   var ids = [];
		     $.each($("#frm-table-category input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-category").attr('action',"admin/category/active");
		    	 $("#frm-table-category").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
	   $("#do_disabled_category").click(function(){
		   var ids = [];
		     $.each($("#frm-table-category input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-category").attr('action',"admin/category/disabled");
		    	 $("#frm-table-category").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
	   $("#do_delete_category").click(function(){
		   var ids = [];
		     $.each($("#frm-table-category input[type='checkbox']:checked"), function(){            
		    	 ids.push($(this).val());
		     });
		     if(ids.length>0){
		    	 $("#frm-table-category").attr('action',"admin/category/delete");
		    	 $("#frm-table-category").submit();
		     }else{
		    	 return;
		     }
	   });
	   
	   
 });	   