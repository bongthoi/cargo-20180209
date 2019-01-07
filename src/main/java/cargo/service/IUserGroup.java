package cargo.service;

import java.util.List;

import cargo.domain.UserGroup;


public interface IUserGroup {
	List<UserGroup> findAll();
}
