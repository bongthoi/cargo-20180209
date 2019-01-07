package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;



import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.ViewGridProduct;

@Repository
public class ViewGridProductRepository extends CustomizeRepository<ViewGridProduct, String> {
	
	public ViewGridProductRepository() {
		super(ROW_MAPPER, "vw_gridproduct", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<ViewGridProduct> ROW_MAPPER = new RowMapper<ViewGridProduct>(){

		@Override
		public ViewGridProduct mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			ViewGridProduct t= new ViewGridProduct(
					rs.getString("id"),
					rs.getString("ProductName"),
					rs.getString("FeatureImage"),
					rs.getInt("Unit"),
					rs.getInt("BigUnit"),
					rs.getBigDecimal("CostPrice"),
					rs.getBigDecimal("SellPrice"),
					rs.getBigDecimal("SellPrice1"),
					rs.getBigDecimal("SellPrice2"),
					rs.getString("CategoryId"),
					rs.getString("CategoryAnalyseId"),
					rs.getInt("BusinessType"),
					rs.getString("SupplierId"),
					rs.getTimestamp("CreateDate"),
					rs.getTimestamp("UpdateDate"),
					rs.getString("CreateUser"),
					rs.getString("UpdateUser"),
					rs.getInt("enabled"),
					rs.getString("BigUnitName"),
					rs.getString("CategoryName"),
					rs.getString("SupplierName"),
					rs.getString("UnitName"),
					rs.getString("BusinessTypeName"),
					rs.getString("ProductCode"));
			t.setPersisted(true);
			return t;
		}
		
	};

	@Override
	protected <S extends ViewGridProduct> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends ViewGridProduct> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}
	public String getTableName(){
		return this.getTable().getName();
	}

}
