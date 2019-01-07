package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.DeliveriedNoteType;
import cargo.repository.DeliveriedNoteTypeRepository;
import cargo.service.IDeliveriedNoteType;

@Service
public class IDeliveriedNoteTypeImpl implements IDeliveriedNoteType{
	
	@Autowired
	private DeliveriedNoteTypeRepository deliveriedNoteTypeRepository;
	
	
	@Override
	public List<DeliveriedNoteType> findAll() {
		// TODO Auto-generated method stub
		return deliveriedNoteTypeRepository.findAll();
	}

}
