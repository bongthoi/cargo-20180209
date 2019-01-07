package cargo.layout.support.web;

import java.util.ArrayList;
import java.util.List;

public class InventoryReportFillterBy {

	public static final int byDate=1;
	public static final int byPeriod=2;
	private String name;
	private int value;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	
	public InventoryReportFillterBy() {
		super();
		// TODO Auto-generated constructor stub
	}
	public InventoryReportFillterBy(String name, int value) {
		super();
		this.name = name;
		this.value = value;
	}
	public List<InventoryReportFillterBy> getFillterby(){
		 List<InventoryReportFillterBy> l=new  ArrayList<InventoryReportFillterBy>();
		 l.add(new InventoryReportFillterBy("- None -",0));
		 l.add(new InventoryReportFillterBy("Date",1));
		 l.add(new InventoryReportFillterBy("Period",2));
		return l;
		
	}
	
	
}
