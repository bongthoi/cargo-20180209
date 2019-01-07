package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.BusinessType;
import cargo.repository.BusinessTypeRepository;
import cargo.service.IBusinessType;

@Service
public class IBusinessTypeImpl implements IBusinessType{
	@Autowired
	private BusinessTypeRepository businessTypeRepository;

	@Override
	public List<BusinessType> findAll() {
		// TODO Auto-generated method stub
		return businessTypeRepository.findAll();
	}
}
