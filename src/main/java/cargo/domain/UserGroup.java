package cargo.domain;

import org.springframework.data.domain.Persistable;

public class UserGroup implements Persistable<String>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private transient boolean persisted;
	private String id; 
	private String UserGroupName;
	private String  UserGroupDes;
	private int enabled;
	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}
	@Override
	public boolean isNew() {
		// TODO Auto-generated method stub
		return !persisted;
	}
	public void setPersisted(boolean persisted) {
		this.persisted = persisted;
	}
	
	public boolean isPersisted() {
		return persisted;
	}
	public String getUserGroupName() {
		return UserGroupName;
	}
	public void setUserGroupName(String userGroupName) {
		UserGroupName = userGroupName;
	}
	public String getUserGroupDes() {
		return UserGroupDes;
	}
	public void setUserGroupDes(String userGroupDes) {
		UserGroupDes = userGroupDes;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public void setId(String id) {
		this.id = id;
	}
	public UserGroup(String id, String userGroupName, String userGroupDes,
			int enabled) {
		super();
		this.id = id;
		UserGroupName = userGroupName;
		UserGroupDes = userGroupDes;
		this.enabled = enabled;
		this.persisted=false;
	}
	public UserGroup() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
