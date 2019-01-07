package cargo.domain;

import org.springframework.data.domain.Persistable;

public class Location implements Persistable<String> {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 
	 */
	private transient boolean persisted;
	private String id;
	private String  LocationName;
	private String Description;
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
	public Location(String id, String locationName, String description,
			int enabled) {
		super();
		this.id = id;
		LocationName = locationName;
		Description = description;
		this.enabled = enabled;
		this.persisted=false;
	}
	
	public Location(){}
	public String getLocationName() {
		return LocationName;
	}
	public void setLocationName(String locationName) {
		LocationName = locationName;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
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
	@Override
	public String toString() {
		return "Location [id=" + id + ", LocationName=" + LocationName
				+ ", Description=" + Description + ", enabled=" + enabled + "]";
	};
	
	
}
