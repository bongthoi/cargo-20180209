package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.PhysicalWarehouse;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;


@Repository
public class PhysicalWarehouseRepository extends JdbcRepository<PhysicalWarehouse, String> {
	public PhysicalWarehouseRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_physicalware_house", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<PhysicalWarehouse> ROW_MAPPER = new RowMapper<PhysicalWarehouse>(){

		@Override
		public PhysicalWarehouse mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			PhysicalWarehouse PhysicalWarehouse= new PhysicalWarehouse(
					rs.getString("id"),
					rs.getString("WarehouseName"),
					rs.getString("Description"), 
					rs.getString("Address"), 
					rs.getString("Area"), 
					rs.getString("Manager"), 
					rs.getTimestamp("CreateDate"), 
					rs.getTimestamp("UpdateDate"), 
					rs.getString("CreateUser"), 
					rs.getString("UpdateUser"), 
					rs.getInt("enabled"));
			PhysicalWarehouse.setPersisted(true);
			return PhysicalWarehouse;
		}
		
	};

	public static final RowUnmapper<PhysicalWarehouse> ROW_UNMAPPER = new RowUnmapper<PhysicalWarehouse>(){

		@Override
		public Map<String, Object> mapColumns(PhysicalWarehouse t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("WarehouseName", t.getWarehouseName());
			mapping.put("Description", t.getDescription());
			mapping.put("Address", t.getAddress());
			mapping.put("Area", t.getArea());
			mapping.put("Manager", t.getArea());
			mapping.put("CreateDate",t.getCreateDate());
			mapping.put("UpdateDate", t.getUpdateDate());
			mapping.put("CreateUser", t.getCreateUser());
			mapping.put("UpdateUser", t.getUpdateUser());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends PhysicalWarehouse> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends PhysicalWarehouse> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}
	
}
