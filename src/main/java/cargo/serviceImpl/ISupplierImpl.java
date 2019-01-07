package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cargo.domain.Supplier;
import cargo.repository.SupplierRepository;
import cargo.service.ISupplier;

@Service
public class ISupplierImpl implements ISupplier{

	@Autowired
	private SupplierRepository supplierRepository;
	
	@Override
	public List<Supplier> findAll() {
		// TODO Auto-generated method stub
		return supplierRepository.findAll();
	}

	@Override
	public boolean isExists(String id) {
		// TODO Auto-generated method stub
		return supplierRepository.exists(id);
	}

	@Override
	public Supplier save(Supplier supplier) {
		// TODO Auto-generated method stub
		return supplierRepository.save(supplier);
	}

	@Override
	public Supplier findByid(String id) {
		// TODO Auto-generated method stub
		return supplierRepository.findOne(id);
	}

	@Override
	@Transactional
	public void active(String[] arr_id) {
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				supplierRepository.active(arr_id[i]);
			}
		}
		
	}

	@Override
	@Transactional
	public void disabled(String[] arr_id) {
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				supplierRepository.disabled(arr_id[i]);
			}
		}
		
	}

	@Override
	@Transactional
	public void delete(String[] arr_id) {
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				supplierRepository.delete(arr_id[i]);
			}
		}
	}

	@Override
	public Page<Supplier> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return supplierRepository.findAll(pageable);
	}

}
