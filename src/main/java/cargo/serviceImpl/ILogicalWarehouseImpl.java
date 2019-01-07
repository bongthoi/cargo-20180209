package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.LogicalWarehouse;
import cargo.repository.LogicalWarehouseRepository;
import cargo.service.ILogicalWarehouse;

@Service
public class ILogicalWarehouseImpl implements ILogicalWarehouse {
	@Autowired
	private LogicalWarehouseRepository logicalWarehouseRepository;

	@Override
	public List<LogicalWarehouse> findAll() {
		// TODO Auto-generated method stub
		return logicalWarehouseRepository.findAll();
	}

}
