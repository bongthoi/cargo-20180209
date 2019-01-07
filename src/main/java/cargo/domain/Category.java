package cargo.domain;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Persistable;

public class Category implements Persistable<String>{


	/**
	 * 
	 */
	private static final long serialVersionUID = -332660684008750284L;

	private transient boolean persisted;
	
	@NotEmpty
	@Range(min=000, max=999)
	private String id;
	
	@NotEmpty
	private String CategoryName;
	
	private String CategoryDes;
	
	@NotEmpty
	private String IndustryId;
	
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
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public String getCategoryDes() {
		return CategoryDes;
	}
	public void setCategoryDes(String categoryDes) {
		CategoryDes = categoryDes;
	}
	public String getIndustryId() {
		return IndustryId;
	}
	public void setIndustryId(String industryId) {
		IndustryId = industryId;
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
	public Category() {
		//super();
		// TODO Auto-generated constructor stub
	}
	public Category(String id, String categoryName,
			String categoryDes, String industryId, Date createDate,
			Date updateDate, String createUser, String updateUser, int enabled) {
		this.id = id;
		CategoryName = categoryName;
		CategoryDes = categoryDes;
		IndustryId = industryId;
		CreateDate = createDate;
		UpdateDate = updateDate;
		CreateUser = createUser;
		UpdateUser = updateUser;
		this.enabled = enabled;
		this.persisted = false;
		
	}
	
	
}
