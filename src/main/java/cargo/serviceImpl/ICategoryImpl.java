package cargo.serviceImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import cargo.domain.Category;
import cargo.repository.CategoryRepository;
import cargo.service.ICategory;

@Service
public class ICategoryImpl implements ICategory{
	@Autowired
	private CategoryRepository categoryRepository;
	@Override
	public List<Category> findAll() {
		// TODO Auto-generated method stub
		return categoryRepository.findAll();
	}

	@Override
	public boolean isExists(String id) {
		// TODO Auto-generated method stub
		return categoryRepository.exists(id);
	}

	@Override
	public Category save(Category Category) {
		// TODO Auto-generated method stub
		return categoryRepository.save(Category);
	}

	@Override
	public Category findByid(String id) {
		// TODO Auto-generated method stub
		return categoryRepository.findOne(id);
	}

	@Override
	@Transactional
	public void active(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						categoryRepository.active(arr_id[i]);
					}
				}
		
	}

	@Override
	@Transactional
	public void disabled(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						categoryRepository.disabled(arr_id[i]);
					}
				}
		
	}

	@Override
	@Transactional
	public void delete(String[] arr_id) {
		// TODO Auto-generated method stub
				if(arr_id.length>0){
					for(int i=0;i<arr_id.length;i++){
						categoryRepository.delete(arr_id[i]);
					}
				}
		
	}

	@Override
	public Page<Category> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return categoryRepository.findAll(pageable);
	}

}
