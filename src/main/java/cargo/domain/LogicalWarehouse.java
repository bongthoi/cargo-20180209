package cargo.domain;

import org.springframework.data.domain.Persistable;

public class LogicalWarehouse implements Persistable<String> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6456514558488258019L;
	private transient boolean persisted;

	private String id;
	private String name;
	private int enabled;
	private String physical_warehouse;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getPhysical_warehouse() {
		return physical_warehouse;
	}
	public void setPhysical_warehouse(String physical_warehouse) {
		this.physical_warehouse = physical_warehouse;
	}
	public void setId(String id) {
		this.id = id;
	}
	public LogicalWarehouse(String id, String name, int enabled,
			String physical_warehouse) {
		super();
		this.id = id;
		this.name = name;
		this.enabled = enabled;
		this.physical_warehouse = physical_warehouse;
		this.persisted=false;
	}
	public LogicalWarehouse() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

}
