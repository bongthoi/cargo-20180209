package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.BigUnit;
import cargo.repository.BigUnitRepository;
import cargo.service.IBigUnit;

@Service
public class IBigUnitImpl  implements IBigUnit{

	@Autowired
	private BigUnitRepository bigUnitRepository;
	@Override
	public List<BigUnit> findAll() {
		// TODO Auto-generated method stub
		return bigUnitRepository.findAll();
	}

}
