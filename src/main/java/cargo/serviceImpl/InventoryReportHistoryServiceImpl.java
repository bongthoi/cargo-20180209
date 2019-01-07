package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.InventoryReportHistory;
import cargo.repository.InventoryReportHistoryReposiory;
import cargo.service.InventoryReportHistoryService;

@Service
public class InventoryReportHistoryServiceImpl implements InventoryReportHistoryService{

	@Autowired
	private InventoryReportHistoryReposiory repository;
	
	
	@Override
	public List<InventoryReportHistory> findAll() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}


	@Override
	public InventoryReportHistory findOne(int id) {
		// TODO Auto-generated method stub
		return repository.findOne(id);
	}

}
