package cargo.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cargo.domain.Industry;
import cargo.repository.IndustryRepository;
import cargo.service.Iindustry;

@Service
public class IidustryImpl implements Iindustry{
	@Autowired
	private IndustryRepository industryRepository;
	@Override
	public List<Industry> findAll() {
		// TODO Auto-generated method stub
		return industryRepository.findAll();
	}

	@Override
	public boolean isExists(String id) {
		// TODO Auto-generated method stub
		return industryRepository.exists(id);
	}

	@Override
	public Industry save(Industry Industry) {
		// TODO Auto-generated method stub
		return industryRepository.save(Industry);
	}

	@Override
	public Industry findByid(String id) {
		// TODO Auto-generated method stub
		return industryRepository.findOne(id);
	}

	@Override
	@Transactional
	public void active(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						industryRepository.active(arr_id[i]);
					}
				}
		
	}

	@Override
	@Transactional
	public void disabled(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						industryRepository.disabled(arr_id[i]);
					}
				}
		
	}

	@Override
	@Transactional
	public void delete(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						industryRepository.delete(arr_id[i]);
					}
				}
		
	}

	@Override
	public Page<Industry> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return industryRepository.findAll(pageable);
	}

}
