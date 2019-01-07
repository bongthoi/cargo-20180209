package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.Unit;
import cargo.repository.UnitRepository;
import cargo.service.IUnit;

@Service
public class IUnitImpl implements IUnit {
	
	@Autowired
	private UnitRepository unitRepository;
	@Override
	public List<Unit> findAll() {
		// TODO Auto-generated method stub
		return unitRepository.findAll();
	}

}
