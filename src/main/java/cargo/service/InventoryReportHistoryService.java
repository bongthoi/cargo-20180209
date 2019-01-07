package cargo.service;

import java.util.List;

import cargo.domain.InventoryReportHistory;

public interface InventoryReportHistoryService {

	List<InventoryReportHistory> findAll();
	InventoryReportHistory findOne(int id);
}
