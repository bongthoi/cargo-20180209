package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.BigUnit;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class BigUnitRepository extends JdbcRepository<BigUnit, Integer>{
	
	public BigUnitRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_bigunit");
	}

	public static final RowMapper<BigUnit> ROW_MAPPER = new RowMapper<BigUnit>(){

		@Override
		public BigUnit mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			BigUnit a= new BigUnit(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getString("description")
					);
			return a;
		}
	};	

	private static final RowUnmapper<BigUnit> ROW_UNMAPPER = new RowUnmapper<BigUnit>() {
		@Override
		public Map<String, Object> mapColumns(BigUnit a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			mapping.put("description", a.getDescription());
			return mapping;
		}
	};	

	@Override
	protected <S extends BigUnit> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
}
