package cargo.JRDataSourceAdapter;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class GoodsReceiptNoteDetailReport{
	private Integer id;
	private String ProductId;
	private String ProductName;
	private int Unit;
	private int RealQuantity;
	private int DocumentQuantity;
	private BigDecimal Price;
	private BigDecimal Amount;
	private String GoodsReceiptNoteId;
	private String UnitName;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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




	public String getUnitName() {
		return UnitName;
	}




	public void setUnitName(String unitName) {
		UnitName = unitName;
	}




	public GoodsReceiptNoteDetailReport(Integer id, String productId,
			String productName, int unit, int realQuantity,
			int documentQuantity, BigDecimal price, BigDecimal amount,
			String goodsReceiptNoteId, String unitName) {
		super();
		this.id = id;
		ProductId = productId;
		ProductName = productName;
		Unit = unit;
		RealQuantity = realQuantity;
		DocumentQuantity = documentQuantity;
		Price = price;
		Amount = amount;
		GoodsReceiptNoteId = goodsReceiptNoteId;
		UnitName = unitName;
	}
	public GoodsReceiptNoteDetailReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public static final RowMapper<GoodsReceiptNoteDetailReport> ROW_MAPPER = new RowMapper<GoodsReceiptNoteDetailReport>(){

		@Override
		public GoodsReceiptNoteDetailReport mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			GoodsReceiptNoteDetailReport a= new GoodsReceiptNoteDetailReport(
					rs.getInt("id"),
					rs.getString("ProductId"),
					rs.getString("ProductName"),
					rs.getInt("Unit"),
					rs.getInt("RealQuantity"),
					rs.getInt("DocumentQuantity"),
					rs.getBigDecimal("Price"),
					rs.getBigDecimal("Amount"),
					rs.getString("GoodsReceiptNoteId"),
					rs.getString("UnitName")
					);
			return a;
		}
	};	

	
}	
	