package cargo.domain;

import java.util.Date;

import org.springframework.data.domain.Persistable;

public class PhysicalWarehouse implements Persistable<String> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private transient boolean persisted;
	
	private String id;
	private String WarehouseName;
	private String Description;
	private String Address;
	private String Area;
	private String Manager;
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
	public String getWarehouseName() {
		return WarehouseName;
	}
	public void setWarehouseName(String warehouseName) {
		WarehouseName = warehouseName;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getArea() {
		return Area;
	}
	public void setArea(String area) {
		Area = area;
	}
	public String getManager() {
		return Manager;
	}
	public void setManager(String manager) {
		Manager = manager;
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
	public PhysicalWarehouse(String id, String warehouseName,
			String description, String address, String area, String manager,
			Date createDate, Date updateDate, String createUser,
			String updateUser, int enabled) {
		super();
		this.id = id;
		WarehouseName = warehouseName;
		Description = description;
		Address = address;
		Area = area;
		Manager = manager;
		CreateDate = createDate;
		UpdateDate = updateDate;
		CreateUser = createUser;
		UpdateUser = updateUser;
		this.enabled = enabled;
		this.persisted=false;
	}
	public PhysicalWarehouse(){};
}
