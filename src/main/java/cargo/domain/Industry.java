package cargo.domain;

import java.util.Date;



import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Persistable;

public class Industry implements Persistable<String> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6726288239471743833L;
	private transient boolean persisted;
	
	@NotEmpty
	@Range(min=00, max=99)
	private String id;
	
	@NotEmpty
	private String IndustryName;
	private String IndustryDes;
	
	private Date CreateDate;
	private Date UpdateDate;
	
	private String CreateUser;
	private String UpdateUser;
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
	public String getIndustryName() {
		return IndustryName;
	}
	public void setIndustryName(String industryName) {
		IndustryName = industryName;
	}
	public String getIndustryDes() {
		return IndustryDes;
	}
	public void setIndustryDes(String industryDes) {
		IndustryDes = industryDes;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public Date getUpdateDate() {
		return UpdateDate;
	}
	public void setUpdateDate(Date updateDate) {
		UpdateDate = updateDate;
	}
	public String getCreateUser() {
		return CreateUser;
	}
	public void setCreateUser(String createUser) {
		CreateUser = createUser;
	}
	public String getUpdateUser() {
		return UpdateUser;
	}
	public void setUpdateUser(String updateUser) {
		UpdateUser = updateUser;
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
	public Industry(String id, String industryName, String industryDes,
			Date createDate, Date updateDate, String createUser,
			String updateUser, int enabled) {
		super();
		this.id = id;
		IndustryName = industryName;
		IndustryDes = industryDes;
		CreateDate = createDate;
		UpdateDate = updateDate;
		CreateUser = createUser;
		UpdateUser = updateUser;
		this.enabled = enabled;
		this.persisted=false;
	}
	public Industry(){}
}
