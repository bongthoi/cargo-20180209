package cargo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.Category;

public interface ICategory {
	List<Category> findAll();
	boolean isExists(String id);
	Category save(Category Category);
	Category findByid(String id);
	void active(String[] arr_id);
	void disabled(String[] arr_id);
	void delete(String[] arr_id);
	Page<Category> findAll(Pageable pageable);
}
