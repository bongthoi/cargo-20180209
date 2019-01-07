package cargo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.Product;

public interface IProduct {

	List<Product> findAll();
	boolean isExists(String id);
	boolean isExistsCode(String id);
	Product save(Product product);
	Product findByid(String id);
	void active(String[] arr_id);
	void disabled(String[] arr_id);
	void delete(String[] arr_id);
	Page<Product> findAll(Pageable pageable);
	
	public String GenarateBarcodeWithoutCheckSum();
}
