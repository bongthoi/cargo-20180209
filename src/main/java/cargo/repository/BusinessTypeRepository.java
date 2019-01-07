package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.BusinessType;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class BusinessTypeRepository extends JdbcRepository<BusinessType, Integer>{
	
	public BusinessTypeRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_businesstype");
	}

	public static final RowMapper<BusinessType> ROW_MAPPER = new RowMapper<BusinessType>(){

		@Override
		public BusinessType mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			BusinessType a= new BusinessType(
					rs.getInt("id"),
					rs.getString("name"),
					rs.getString("description")
					);
			return a;
		}
	};	

	private static final RowUnmapper<BusinessType> ROW_UNMAPPER = new RowUnmapper<BusinessType>() {
		@Override
		public Map<String, Object> mapColumns(BusinessType a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			mapping.put("description", a.getDescription());
			return mapping;
		}
	};	

	@Override
	protected <S extends BusinessType> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
}
