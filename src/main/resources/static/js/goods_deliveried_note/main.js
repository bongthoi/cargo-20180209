
function appendProduct(e){
	var productid=$(e).data("id");
	var productname=$(e).data("productname");
	var sellprice=$(e).data("sellprice");
	var unit=$(e).data("unit");
	var enabled=$(e).data("enabled");
	if(!enabled){
		alert("This product is disabled! ");
		return;
	}
	if(checkExit(productid)){
		alert("This product is exists ! ");
		return;
	}
	$.get("admin/goods_deliveried_note/getTrDetail",{"productid":productid},function(data){
		if(data!=null){
			$("#tableDetail tbody").append(data);
			$("#modal_choose_product").modal('hide');
		}
	},"text");
	
}
function remove_tr(e){
	$(e).closest("tr").find("input[name='goodsDeliveriedNoteDetails[js_replace0].isDelete']").val(1);
	$(e).closest("tr").hide();
}

function checkExit(id){
	var c=false;
	//input[name='goodsDeliveriedNoteDetail[js_replace0].ProductId']
	  $("#tableDetail .trDetail ").each(function(i, obj) {
		  var isDelete=$(obj).find("input[name='goodsDeliveriedNoteDetails[js_replace0].isDelete']").val();
		  if(isDelete==0){
			  	var objId=$(obj).find("input[name='goodsDeliveriedNoteDetails[js_replace0].ProductId']").val();
				if(id == objId){
		  			c= true;
		  		}
		  }
		});
	  return c;
}
$(function () {
	 $("#btn-add-detail-goods-delivered-note").click(function(){
		 if(  $("#modal_choose_product .modal-body").text().trim().length==0){
			 $.get("admin/product",function(data){
					if(data!=null){
						 $("#modal_choose_product .modal-body").html(data);
					}
				 },"text");
		 }
		
		 $("#modal_choose_product").modal('show',true);

	 });
	 $("#btnSaveGoodsDeliveredNote").click(function(){
			  $("#tableDetail .trDetail").each(function(i, obj) {
				  $(obj).find('input').each(function(i2,obj2){
					  var attr_name=$(obj2).attr('name');
					  attr_name=attr_name.replace(/js_replace0/g,i);
					  $(obj2).attr('name',attr_name);
				  });
			  });
			  
		$(this).closest("form").submit();
	 });
	 
 });