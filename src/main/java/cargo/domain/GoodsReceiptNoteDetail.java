package cargo.domain;

import java.math.BigDecimal;

import org.springframework.data.domain.Persistable;

public class GoodsReceiptNoteDetail implements Persistable<Integer>{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4610726855344075067L;
	private Integer id;
	private String ProductId;
	private String ProductCode;
	private String ProductName;
	private int Unit;
	private int RealQuantity;
	private int DocumentQuantity;
	private BigDecimal Price;
	private BigDecimal Amount;
	private String GoodsReceiptNoteId;
	private int isDelete;
	@Override
	public Integer getId() {
		// TODO Auto-generated method stub
		return id;
	}
	@Override
	public boolean isNew() {
		// TODO Auto-generated method stub
		return (id == null || id == 0);
	}
	public String getProductId() {
		return ProductId;
	}
	public void setProductId(String productId) {
		ProductId = productId;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getUnit() {
		return Unit;
	}
	public void setUnit(int unit) {
		Unit = unit;
	}
	public int getRealQuantity() {
		return RealQuantity;
	}
	public void setRealQuantity(int realQuantity) {
		RealQuantity = realQuantity;
	}
	public int getDocumentQuantity() {
		return DocumentQuantity;
	}
	public void setDocumentQuantity(int documentQuantity) {
		DocumentQuantity = documentQuantity;
	}
	public BigDecimal getPrice() {
		return Price;
	}
	public void setPrice(BigDecimal price) {
		Price = price;
	}
	public BigDecimal getAmount() {
		return Amount;
	}
	public void setAmount(BigDecimal amount) {
		Amount = amount;
	}
	public String getGoodsReceiptNoteId() {
		return GoodsReceiptNoteId;
	}
	public void setGoodsReceiptNoteId(String goodsReceiptNoteId) {
		GoodsReceiptNoteId = goodsReceiptNoteId;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	

	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
	public GoodsReceiptNoteDetail(Integer id, String productId,String productCode,
			String productName, int unit, int realQuantity,
			int documentQuantity, BigDecimal price, BigDecimal amount,
			String goodsReceiptNoteId) {
		super();
		this.id = id;
		ProductId = productId;
		ProductCode=productCode;
		ProductName = productName;
		Unit = unit;
		RealQuantity = realQuantity;
		DocumentQuantity = documentQuantity;
		Price = price;
		Amount = amount;
		GoodsReceiptNoteId = goodsReceiptNoteId;
		this.isDelete=0;
	}
	
	public GoodsReceiptNoteDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "GoodsReceiptNoteDetail [id=" + id + ", ProductId=" + ProductId
				+ ", ProductName=" + ProductName + ", Unit=" + Unit
				+ ", RealQuantity=" + RealQuantity + ", DocumentQuantity="
				+ DocumentQuantity + ", Price=" + Price + ", Amount=" + Amount
				+ ", GoodsReceiptNoteId=" + GoodsReceiptNoteId + ", isDelete="
				+ isDelete + "]";
	} 
	
	
	
	
	
}
