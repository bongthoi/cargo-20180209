$(function () {
	$("#btn-approve").click(function(){
		$("#frm-goodsReceiptNote").attr("action","admin/goods_receipt_note/approve").submit();
	});
	
	$("#btn-destroy").click(function(){
		$("#frm-goodsReceiptNote").attr("action","admin/goods_receipt_note/destroy").submit();
	});
	$("#btn-export").click(function(){
		$("#frm-goodsReceiptNote").attr("action","admin/goods_receipt_note/export").submit();
	});
	
});

