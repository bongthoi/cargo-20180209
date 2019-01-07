package cargo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteDetailReport;
import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteReport;
import cargo.domain.GoodsDeliveriedNote;

public interface IGoodsDeliveriedNote {

	Page<GoodsDeliveriedNote> findAll(Pageable page);

	GoodsDeliveriedNote findByid(String id);

	String GenarateId();

	GoodsDeliveriedNote save(GoodsDeliveriedNote goodsDeliveriedNote);

	GoodsDeliveriedNote findOne(String id);

	boolean exists(String id);

	GoodsDeliveriedNote approve(GoodsDeliveriedNote goodsDeliveriedNote);

	GoodsDeliveriedNote destroy(GoodsDeliveriedNote goodsDeliveriedNote);
	
	 List<GoodsDeliveriedNoteDetailReport> findByGoodsDeliveriedId(String id);

	GoodsDeliveriedNoteReport getDeliveriedReportById(String id);

	List<GoodsDeliveriedNote> findByWaitingStatus();

	GoodsDeliveriedNote waiting(GoodsDeliveriedNote goodsDeliveriedNote);

}
