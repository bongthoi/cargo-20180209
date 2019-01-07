package cargo.service;


import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;





import cargo.JRDataSourceAdapter.GoodsReceiptNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsReceiptNoteReport;
import cargo.domain.GoodsReceiptNote;
import cargo.layout.support.web.FrmAddReciptModel;

public interface IGoodsReceiptNote {

	public GoodsReceiptNote save(GoodsReceiptNote goodsReceiptNote);
	public String GenarateId();
	public Page<GoodsReceiptNote> findAll(Pageable pageable);
	public GoodsReceiptNote findByid(String id);
	public GoodsReceiptNote findOne(String id);
	public boolean exists(String id);
	public GoodsReceiptNote approve(GoodsReceiptNote goodsReceiptNote);
	public GoodsReceiptNote destroy(GoodsReceiptNote goodsReceiptNote);
	public GoodsReceiptNoteReport getReceiptReportById(String id);
	public List<GoodsReceiptNoteDetailReport> findByGoodsReceiptId(String id);
	public void saveExistingDeliveryNote(FrmAddReciptModel frmAddReciptModel,
			String createUser);
	
}
