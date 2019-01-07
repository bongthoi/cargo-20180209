package cargo.service;

import java.util.List;

import org.springframework.data.domain.Page;

import org.springframework.data.domain.Pageable;

import cargo.domain.User;

public interface IUser {

	List<User> findAll();
	boolean isExists(String username);
	User save(User user);
	User findByid(String username);
	void active(String[] arr_id);
	void disabled(String[] arr_id);
	void delete(String[] arr_id);
	Page<User> findAll(Pageable pageable);
}
