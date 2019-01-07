package cargo.domain;

import org.springframework.data.domain.Persistable;

public class ReceiptNoteType implements Persistable<Integer> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 458194487915196421L;
	private Integer  id;
	private String name;

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
	public void setId(Integer id) {
		this.id = id;
	}
	public ReceiptNoteType(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public ReceiptNoteType() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
