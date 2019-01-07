package cargo.service;

import java.util.List;

import cargo.domain.PhysicalWarehouse;



public interface IPhysicalWarehouse {
	List<PhysicalWarehouse> findAll();
}
