package cargo.domain;

import org.springframework.data.domain.Persistable;

public class BusinessType implements Persistable<Integer>  {//key auto insertment

	/**
	 * 
	 */
	private static final long serialVersionUID = -6122433291695081760L;
	private Integer  id;
	private String name;
	private String description;
	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return id;
	}
	@Override
	public boolean isNew() {
		// TODO Auto-generated method stub
		return id == null || id == 0;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public BusinessType(Integer id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}
	public BusinessType() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
}
