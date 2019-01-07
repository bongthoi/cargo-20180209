$(function () {
	$("#btn-approve").click(function(){
		$("#frm-goodsDeliveriedNote").attr("action","admin/goods_deliveried_note/approve").submit();
	});
	
	$("#btn-destroy").click(function(){
		$("#frm-goodsDeliveriedNote").attr("action","admin/goods_deliveried_note/destroy").submit();
	});
	$("#btn-export").click(function(){
		$("#frm-goodsDeliveriedNote").attr("action","admin/goods_deliveried_note/export").submit();
	});
	$("#btn-waiting").click(function(){
		$("#frm-goodsDeliveriedNote").attr("action","admin/goods_deliveried_note/waiting").submit();
	});
	
});

