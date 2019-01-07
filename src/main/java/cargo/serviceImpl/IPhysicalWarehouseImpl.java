package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.PhysicalWarehouse;
import cargo.repository.PhysicalWarehouseRepository;
import cargo.service.IPhysicalWarehouse;

@Service
public class IPhysicalWarehouseImpl implements IPhysicalWarehouse{
	
	@Autowired
	private PhysicalWarehouseRepository physicalWarehouseRepository;

	@Override
	public List<PhysicalWarehouse> findAll() {
		// TODO Auto-generated method stub
		return physicalWarehouseRepository.findAll() ;
	}
	
	

}
