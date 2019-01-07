package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cargo.domain.User;
import cargo.repository.UserRepository;
import cargo.service.IUser;

@Service
public class IUserImpl implements IUser{

	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> findAll() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public boolean isExists(String username) {
		// TODO Auto-generated method stub
		return userRepository.exists(username);
	}

	@Override
	public User save(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public User findByid(String username) {
		// TODO Auto-generated method stub
		return userRepository.findOne(username);
	}

	@Override
	@Transactional
	public void active(String[] arr_id) {
		// TODO Auto-generated method stub
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				userRepository.active(arr_id[i]);
			}
		}
	}

	@Override
	@Transactional
	public void disabled(String[] arr_id) {
			// TODO Auto-generated method stub
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				userRepository.disabled(arr_id[i]);
			}
		}
		
	}

	@Override
	@Transactional
	public void delete(String[] arr_id) {
		// TODO Auto-generated method stub
		if(arr_id.length>0){
			for(int i=0;i<arr_id.length;i++){
				userRepository.delete(arr_id[i]);
			}
		}
		
	}

	@Override
	public Page<User> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return userRepository.findAll(pageable);
	}
	
	
}
