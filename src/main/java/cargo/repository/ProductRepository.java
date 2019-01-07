package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Product;

import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class ProductRepository extends CustomizeRepository<Product, String> {
	
	public ProductRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_Product", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Product> ROW_MAPPER = new RowMapper<Product>(){

		@Override
		public Product mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Product t= new Product(
					rs.getString("id"),
					rs.getString("FeatureImage"),
					rs.getString("ProductName"),
					rs.getString("ProductDes"),
					rs.getString("ProductGuide"),
					rs.getInt("Unit"),
					rs.getInt("BigUnit"),
					rs.getBigDecimal("CostPrice"),
					rs.getBigDecimal("SellPrice"),
					rs.getBigDecimal("SellPrice1"),
					rs.getBigDecimal("SellPrice2"),
					rs.getString("SupplierId"),
					rs.getString("CategoryId"),
					rs.getString("CategoryAnalyseId"),
					rs.getInt("BusinessType"),
					rs.getTimestamp("CreateDate"),
					rs.getTimestamp("UpdateDate"),
					rs.getString("CreateUser"),
					rs.getString("UpdateUser"),
					rs.getInt("enabled"),
					rs.getString("ProductCode"));
					
			t.setPersisted(true);
			return t;
		}
		
	};

	public static final RowUnmapper<Product> ROW_UNMAPPER = new RowUnmapper<Product>(){

		@Override
		public Map<String, Object> mapColumns(Product t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("FeatureImage", t.getFeatureImage());
			mapping.put("ProductName", t.getProductName());
			mapping.put("ProductDes", t.getProductDes());
			mapping.put("ProductGuide",t.getProductGuide());
			mapping.put("Unit", t.getUnit());
			mapping.put("BigUnit",t.getBigUnit());
			mapping.put("CostPrice",t.getCostPrice());
			mapping.put("SellPrice", t.getSellPrice());
			mapping.put("SellPrice1", t.getSellPrice1());
			mapping.put("SellPrice2", t.getSellPrice2());
			mapping.put("SupplierId", t.getSupplierId());
			mapping.put("CategoryId", t.getCategoryId());
			mapping.put("CategoryAnalyseId", t.getCategoryAnalyseId());
			mapping.put("BusinessType", t.getBusinessType());
			mapping.put("CreateDate", t.getCreateDate());
			mapping.put("UpdateDate", t.getUpdateDate());
			mapping.put("CreateUser", t.getCreateUser());
			mapping.put("UpdateUser", t.getUpdateUser());
			mapping.put("enabled", t.getEnabled());
			mapping.put("ProductCode", t.getProductCode());
			return mapping;
		}
		
	};
	@Override
	protected <S extends Product> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends Product> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}

	public String GenarateBarcodeWithoutCheckSum(){
		String sql="select getNextProductBarcodeWithoutChecksumDigit() as barcode ";
		return this.getJdbcTemplate().queryForObject(sql, String.class);
	}
	public boolean isExistsCode(String code){
		String sql="select count(*) FROM tb_product where ProductCode='"+code+"'";
		if(this.getJdbcTemplate().queryForObject(sql, int.class)>0){
			return true;
		}else{
			return false;
		}
	}
}
