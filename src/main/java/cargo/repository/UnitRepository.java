package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Unit;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class UnitRepository extends JdbcRepository<Unit, Integer>{
	
	public UnitRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_unit");
	}

	public static final RowMapper<Unit> ROW_MAPPER = new RowMapper<Unit>(){

		@Override
		public Unit mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Unit a= new Unit(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getString("description")
					);
			return a;
		}
	};	

	private static final RowUnmapper<Unit> ROW_UNMAPPER = new RowUnmapper<Unit>() {
		@Override
		public Map<String, Object> mapColumns(Unit a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			mapping.put("description", a.getDescription());
			return mapping;
		}
	};	

	@Override
	protected <S extends Unit> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
}
