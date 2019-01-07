package cargo.layout.support.web;

public class InventoryReportSearch {

	private String logicwarehouse;
	private String keyword;//product code or name
	private String forDate;
	
	private int fillterBy;
	
	private int forPeriod;

	public String getLogicwarehouse() {
		return logicwarehouse;
	}

	public void setLogicwarehouse(String logicwarehouse) {
		this.logicwarehouse = logicwarehouse;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getForDate() {
		return forDate;
	}

	public void setForDate(String forDate) {
		this.forDate = forDate;
	}



	public int getFillterBy() {
		return fillterBy;
	}

	public void setFillterBy(int fillterBy) {
		this.fillterBy = fillterBy;
	}

	public int getForPeriod() {
		return forPeriod;
	}

	public void setForPeriod(int forPeriod) {
		this.forPeriod = forPeriod;
	}

	


	
	
}
