package cargo.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.data.domain.Persistable;

public class InventoryReport implements Persistable<Integer>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3397466134900330800L;
	private Integer id;
	private String LogicWarehouseId;
	private String ProductId;
	private String ProductCode;
	private String ProductName;
	private int QtyBeginning;
	private BigDecimal PriceBeginning;
	private int QtyImport;
	private BigDecimal PriceImport;
	private int QtyExport;
	private BigDecimal PriceExport;
	private int QtyEnding;
	private BigDecimal PriceEnding;
	private Date CreateDate;
	
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
	public String getLogicWarehouseId() {
		return LogicWarehouseId;
	}
	public void setLogicWarehouseId(String logicWarehouseId) {
		LogicWarehouseId = logicWarehouseId;
	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getQtyBeginning() {
		return QtyBeginning;
	}
	public void setQtyBeginning(int qtyBeginning) {
		QtyBeginning = qtyBeginning;
	}
	public BigDecimal getPriceBeginning() {
		return PriceBeginning;
	}
	public void setPriceBeginning(BigDecimal priceBeginning) {
		PriceBeginning = priceBeginning;
	}
	public int getQtyImport() {
		return QtyImport;
	}
	public void setQtyImport(int qtyImport) {
		QtyImport = qtyImport;
	}
	public BigDecimal getPriceImport() {
		return PriceImport;
	}
	public void setPriceImport(BigDecimal priceImport) {
		PriceImport = priceImport;
	}
	public int getQtyExport() {
		return QtyExport;
	}
	public void setQtyExport(int qtyExport) {
		QtyExport = qtyExport;
	}
	public BigDecimal getPriceExport() {
		return PriceExport;
	}
	public void setPriceExport(BigDecimal priceExport) {
		PriceExport = priceExport;
	}
	public int getQtyEnding() {
		return QtyEnding;
	}
	public void setQtyEnding(int qtyEnding) {
		QtyEnding = qtyEnding;
	}
	public BigDecimal getPriceEnding() {
		return PriceEnding;
	}
	public void setPriceEnding(BigDecimal priceEnding) {
		PriceEnding = priceEnding;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public InventoryReport(Integer id, String logicWarehouseId,
			String productId, String productCode, String productName,
			int qtyBeginning, BigDecimal priceBeginning, int qtyImport,
			BigDecimal priceImport, int qtyExport, BigDecimal priceExport,
			int qtyEnding, BigDecimal priceEnding, Date createDate) {
		super();
		this.id = id;
		LogicWarehouseId = logicWarehouseId;
		ProductId = productId;
		ProductCode = productCode;
		ProductName = productName;
		QtyBeginning = qtyBeginning;
		PriceBeginning = priceBeginning;
		QtyImport = qtyImport;
		PriceImport = priceImport;
		QtyExport = qtyExport;
		PriceExport = priceExport;
		QtyEnding = qtyEnding;
		PriceEnding = priceEnding;
		CreateDate = createDate;
	}
	public InventoryReport() {
		super();
	}
	@Override
	public String toString() {
		return "InventoryReport [id=" + id + ", LogicWarehouseId="
				+ LogicWarehouseId + ", ProductId=" + ProductId
				+ ", ProductCode=" + ProductCode + ", ProductName="
				+ ProductName + ", QtyBeginning=" + QtyBeginning
				+ ", PriceBeginning=" + PriceBeginning + ", QtyImport="
				+ QtyImport + ", PriceImport=" + PriceImport + ", QtyExport="
				+ QtyExport + ", PriceExport=" + PriceExport + ", QtyEnding="
				+ QtyEnding + ", PriceEnding=" + PriceEnding + ", CreateDate="
				+ CreateDate + "]";
	}
	
	public InventoryReport setNewVal(){
		BigDecimal b=new BigDecimal(0);
		this.setCreateDate(new Date());
		this.setId(0);
		this.setLogicWarehouseId(null);
		this.setPriceBeginning(b);
		this.setPriceEnding(b);
		this.setPriceExport(b);
		this.setPriceImport(b);
		this.setProductCode(null);
		this.setProductId(null);
		this.setProductName(null);
		this.setQtyBeginning(0);
		this.setQtyEnding(0);
		this.setQtyExport(0);
		this.setQtyImport(0);
		return this;
	}
	
	
	
}
