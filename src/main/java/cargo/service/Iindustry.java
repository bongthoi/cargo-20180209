package cargo.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.Industry;

public interface Iindustry {
	List<Industry> findAll();
	boolean isExists(String id);
	Industry save(Industry Industry);
	Industry findByid(String id);
	void active(String[] arr_id);
	void disabled(String[] arr_id);
	void delete(String[] arr_id);
	Page<Industry> findAll(Pageable pageable);
}
