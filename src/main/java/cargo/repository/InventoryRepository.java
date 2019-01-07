package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.nurkiewicz.jdbcrepository.RowUnmapper;
import com.nurkiewicz.jdbcrepository.TableDescription;

import cargo.domain.Inventory;

@Repository
public class InventoryRepository  extends CustomizeRepository<Inventory, Object[]> {

	public InventoryRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, new TableDescription("tb_inventory", null, "LogicWarehouseId", "ProductId"));
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Inventory> ROW_MAPPER = new RowMapper<Inventory>(){

		@Override
		public Inventory mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Inventory t= new Inventory(
					rs.getString("LogicWarehouseId"),
					rs.getString("ProductId"),
					rs.getString("ProductCode"),
					rs.getString("ProductName"),
					rs.getInt("RealQuantity"),
					rs.getInt("DocumentQuantity"),
					rs.getTimestamp("ModifyTime")
					
					);
			t.setPersisted(true);
			return t;
		}
		
	};

	public static final RowUnmapper<Inventory> ROW_UNMAPPER = new RowUnmapper<Inventory>(){

		@Override
		public Map<String, Object> mapColumns(Inventory t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("LogicWarehouseId", t.getLogicWarehouseId());
			mapping.put("ProductId",t.getProductId());
			mapping.put("ProductCode", t.getProductCode());
			mapping.put("ProductName",t.getProductName());
			mapping.put("RealQuantity", t.getRealQuantity());
			mapping.put("DocumentQuantity", t.getDocumentQuantity());
			mapping.put("ModifyTime",new Date());
			return mapping;
		}
		
	};

}
