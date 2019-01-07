package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.UserGroup;
import cargo.repository.UserGroupRepository;
import cargo.service.IUserGroup;

@Service
public class IUserGroupImpl implements IUserGroup{

	@Autowired
	private UserGroupRepository userGroupRepository;
	@Override
	public List<UserGroup> findAll() {
		// TODO Auto-generated method stub
		return userGroupRepository.findAll();
	}

}
