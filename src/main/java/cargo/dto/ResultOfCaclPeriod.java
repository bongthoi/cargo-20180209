package cargo.dto;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;




public class ResultOfCaclPeriod {
	
	
	
	private String LogicWarehouseId;
	private String ProductId;
	private int QtyBeginning;
	private BigDecimal PriceBeginning;
	private int QtyEnding;
	private BigDecimal PriceEnding;
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
	
	
	public ResultOfCaclPeriod(String logicWarehouseId, String productId,
			int qtyBeginning, BigDecimal priceBeginning, int qtyEnding,
			BigDecimal priceEnding) {
		super();
		LogicWarehouseId = logicWarehouseId;
		ProductId = productId;
		QtyBeginning = qtyBeginning;
		PriceBeginning = priceBeginning;
		QtyEnding = qtyEnding;
		PriceEnding = priceEnding;
	}


	public ResultOfCaclPeriod() {
		super();
		// TODO Auto-generated constructor stub
	}


	@Override
	public String toString() {
		return "ResultOfCaclPeriod [LogicWarehouseId=" + LogicWarehouseId
				+ ", ProductId=" + ProductId + ", QtyBeginning=" + QtyBeginning
				+ ", PriceBeginning=" + PriceBeginning + ", QtyEnding="
				+ QtyEnding + ", PriceEnding=" + PriceEnding + "]";
	}


	public static final RowMapper<ResultOfCaclPeriod> ROW_MAPPER = new RowMapper<ResultOfCaclPeriod>(){

		@Override
		public ResultOfCaclPeriod mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			ResultOfCaclPeriod a= new ResultOfCaclPeriod(
				
					rs.getString("LogicWarehouseId"),
					rs.getString("ProductId"),
				
					rs.getInt("QtyBeginning"),
					rs.getBigDecimal("PriceBeginning"),

					rs.getInt("QtyEnding"),
					rs.getBigDecimal("PriceEnding")
		
					);
			return a;
		}
	};	
}
