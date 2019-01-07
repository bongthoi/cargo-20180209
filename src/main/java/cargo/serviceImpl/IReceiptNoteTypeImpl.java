package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.ReceiptNoteType;
import cargo.repository.ReceiptNoteTypeRepository;
import cargo.service.IReceiptNoteType;


@Service
public class IReceiptNoteTypeImpl implements IReceiptNoteType{
	
	@Autowired
	private ReceiptNoteTypeRepository receiptNoteTypeRepository;
 
	@Override
	public List<ReceiptNoteType> findAll() {
		// TODO Auto-generated method stub
		return receiptNoteTypeRepository.findAll();
	}

}
