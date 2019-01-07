package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import cargo.domain.InventoryReport;




import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class InventoryReportRepository  extends CustomizeRepository<InventoryReport, Integer>{
	public InventoryReportRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_inventory_report");
	}

	public static final RowMapper<InventoryReport> ROW_MAPPER = new RowMapper<InventoryReport>(){

		@Override
		public InventoryReport mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			InventoryReport a= new InventoryReport(
					rs.getInt("id"),
					rs.getString("LogicWarehouseId"),
					rs.getString("ProductId"),
					rs.getString("ProductCode"),
					rs.getString("ProductName"),
					rs.getInt("QtyBeginning"),
					rs.getBigDecimal("PriceBeginning"),
					rs.getInt("QtyImport"),
					rs.getBigDecimal("PriceImport"),
					rs.getInt("QtyExport"),
					rs.getBigDecimal("PriceExport"),
					rs.getInt("QtyEnding"),
					rs.getBigDecimal("PriceEnding"),
					rs.getTimestamp("CreateDate")
				
					);
			return a;
		}
	};	

	private static final RowUnmapper<InventoryReport> ROW_UNMAPPER = new RowUnmapper<InventoryReport>() {
		@Override
		public Map<String, Object> mapColumns(InventoryReport a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("LogicWarehouseId", a.getLogicWarehouseId());
			mapping.put("ProductId", a.getProductId());
			mapping.put("ProductCode", a.getProductCode());
			mapping.put("ProductName", a.getProductName());
			mapping.put("QtyBeginning", a.getQtyBeginning());
			mapping.put("PriceBeginning", a.getPriceBeginning());
			mapping.put("QtyImport", a.getQtyImport());
			mapping.put("PriceImport", a.getPriceImport());
			mapping.put("QtyExport", a.getQtyExport());
			mapping.put("PriceExport", a.getPriceExport());
			mapping.put("QtyEnding", a.getQtyEnding());
			mapping.put("PriceEnding", a.getPriceEnding());
			mapping.put("CreateDate", a.getCreateDate());
			return mapping;
		}
	};	

	@Override
	protected <S extends InventoryReport> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
	/*public InventoryReport findlastPeriod(String warehouse, String productid) {
			SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(this.getJdbcTemplate())
			.withProcedureName("sp_getInventory_report_Lastperiod").returningResultSet("rs", InventoryReportRepository.ROW_MAPPER);
			SqlParameter[] parameters = {
					new SqlParameter("p_warehouse",Types.CHAR),
					new SqlParameter("p_productid",Types.VARCHAR)
				   
		    };
			simpleJdbcCall.declareParameters(parameters);
			   SqlParameterSource in = new MapSqlParameterSource()
		   	    .addValue("p_warehouse",warehouse)
		   	    .addValue("p_productid", productid);
			   Map<String, Object> out2 = simpleJdbcCall.execute(in);
			   System.out.println( "ProductId:--"+ out2.get("ProductId"));
			   InventoryReport out = simpleJdbcCall.executeObject(InventoryReport.class, in);
			   return out;
	}*/
	
	public InventoryReport findlastPeriod(String warehouse, String productid) {
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(this.getJdbcTemplate())
		.withProcedureName("sp_getInventory_report_Lastperiod").returningResultSet("rs",InventoryReportRepository.ROW_MAPPER );
		SqlParameter[] parameters = {
				new SqlParameter("p_warehouse",Types.CHAR),
				new SqlParameter("p_productid",Types.VARCHAR)
			   
	    };
		simpleJdbcCall.declareParameters(parameters);
		   SqlParameterSource in = new MapSqlParameterSource()
	   	    .addValue("p_warehouse",warehouse)
	   	    .addValue("p_productid", productid);
		   Map<String, Object> out2 = simpleJdbcCall.execute(in);
		   @SuppressWarnings("unchecked")
		List<InventoryReport> l1= ( List<InventoryReport>)out2.get("rs");
		   if( l1.size()>0){
			   return l1.get(0);
		   }
		   else{
			   return null;
		   }
		  // System.out.println( "ProductId:--"+ l1.size());
		  // InventoryReport out = simpleJdbcCall.executeObject(InventoryReport.class, in);
		  // return out;
}
}
