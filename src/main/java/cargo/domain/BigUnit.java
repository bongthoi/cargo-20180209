package cargo.domain;

import org.springframework.data.domain.Persistable;


public class BigUnit implements Persistable<Integer>  {
	/**
	 * 
	 */
	private static final long serialVersionUID = -6077519671504475127L;
//key auto insertment
	
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
	public BigUnit(Integer id, String name, String description) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
	}
	public BigUnit() {
		super();
		// TODO Auto-generated constructor stub
	}
}
