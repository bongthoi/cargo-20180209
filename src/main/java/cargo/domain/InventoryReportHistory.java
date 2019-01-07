package cargo.domain;

import java.util.Date;

import org.springframework.data.domain.Persistable;

public class InventoryReportHistory   implements Persistable<Integer>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 673478916743169495L;
	private Integer id;
	private String name;
	private Date beginning_date;
	private Date ending_date;
	
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

	public Date getEnding_date() {
		return ending_date;
	}
	public void setEnding_date(Date ending_date) {
		this.ending_date = ending_date;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	
	
	public Date getBeginning_date() {
		return beginning_date;
	}
	public void setBeginning_date(Date beginning_date) {
		this.beginning_date = beginning_date;
	}
	public InventoryReportHistory(Integer id, String name, Date Beginning_date,
			Date ending_date) {
		super();
		this.id = id;
		this.name = name;
		this.beginning_date = Beginning_date;
		this.ending_date = ending_date;
	}
	public InventoryReportHistory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
