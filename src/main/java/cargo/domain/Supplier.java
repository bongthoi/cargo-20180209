package cargo.domain;

import org.springframework.data.domain.Persistable;

public class Supplier implements Persistable<String>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -4295389889497419660L;
	private transient boolean persisted;
	private String id;
	private String SupplierName;
	private int BusinessType;
	private String Description;
	private String Address;
	private String Phone;
	private String Email;
	private String Website;
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
	public String getSupplierName() {
		return SupplierName;
	}
	public void setSupplierName(String supplierName) {
		SupplierName = supplierName;
	}
	public int getBusinessType() {
		return BusinessType;
	}
	public void setBusinessType(int businessType) {
		BusinessType = businessType;
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
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getWebsite() {
		return Website;
	}
	public void setWebsite(String website) {
		Website = website;
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
	public Supplier() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Supplier(String id, String supplierName, int businessType,
			String description, String address, String phone, String email,
			String website, int enabled) {
		super();
		this.id = id;
		SupplierName = supplierName;
		BusinessType = businessType;
		Description = description;
		Address = address;
		Phone = phone;
		Email = email;
		Website = website;
		this.enabled = enabled;
		this.persisted=false;
	}
	
	
}
