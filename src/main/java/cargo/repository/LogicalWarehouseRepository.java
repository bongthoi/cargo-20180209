package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.LogicalWarehouse;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class LogicalWarehouseRepository extends JdbcRepository<LogicalWarehouse, String> {
	public LogicalWarehouseRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_logical_warehouse", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<LogicalWarehouse> ROW_MAPPER = new RowMapper<LogicalWarehouse>(){

		@Override
		public LogicalWarehouse mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			LogicalWarehouse logicalWarehouse= new LogicalWarehouse(
					rs.getString("id"),
					rs.getString("name"),
					rs.getInt("enabled"),
					rs.getString("physical_warehouse"));
			logicalWarehouse.setPersisted(true);
			return logicalWarehouse;
		}
		
	};

	public static final RowUnmapper<LogicalWarehouse> ROW_UNMAPPER = new RowUnmapper<LogicalWarehouse>(){

		@Override
		public Map<String, Object> mapColumns(LogicalWarehouse t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("name", t.getName());
			mapping.put("enabled", t.getEnabled());
			mapping.put("physical_warehouse", t.getPhysical_warehouse());
			return mapping;
			
		}
		
	};
	@Override
	protected <S extends LogicalWarehouse> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends LogicalWarehouse> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}

}
