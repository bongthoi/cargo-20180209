package cargo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.Inventory;



public interface InventoryService {
	public Page<Inventory> findByObjectAttribute(Inventory inventory, Pageable pageable);
}
