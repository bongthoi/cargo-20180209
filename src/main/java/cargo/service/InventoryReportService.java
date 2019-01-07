package cargo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.GoodsDeliveriedNoteDetail;
import cargo.domain.GoodsReceiptNoteDetail;
import cargo.domain.InventoryReport;
import cargo.domain.InventoryReportHistory;
import cargo.layout.support.web.InventoryReportSearch;

public interface InventoryReportService {

	public Page<InventoryReport> findAll(Pageable pageable);
	public Page<InventoryReport> find(InventoryReportSearch searchModel,Pageable pageable);
	public void insert(InventoryReport report);
	public void insert(GoodsReceiptNoteDetail detail,String warehouse);
	public InventoryReport findlastPeriod(String warehouse,String productid);
	public void insert(GoodsDeliveriedNoteDetail detail,
			String fromLogicWarehouse);
	public InventoryReportHistory closePeriod(String name);
	public boolean checked_time_closePeriod();

}
