package cargo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import cargo.domain.Inventory;
import cargo.repository.InventoryRepository;
import cargo.service.InventoryService;

@Service
public class InventoryServiceImpl implements InventoryService {

	
	@Autowired
	private InventoryRepository inventoryRepository;
	
	@Override
	public Page<Inventory> findByObjectAttribute(Inventory inventory,
			Pageable pageable) {
	String whereClause = " WHERE 1=1 ";
		
		if(!StringUtils.isEmpty(inventory.getProductName())){
			whereClause += " AND ( lower(ProductName) like  lower('%" + inventory.getProductName()+"%') ";
			whereClause += " OR ProductId like '%" + inventory.getProductName()+"%' )";
		}
		if(!StringUtils.isEmpty(inventory.getLogicWarehouseId())){
			whereClause += " AND LogicWarehouseId = '" + inventory.getLogicWarehouseId() +"'";
		}
		System.out.println(whereClause);
		return inventoryRepository.findQuery(whereClause, pageable);
	}

}
