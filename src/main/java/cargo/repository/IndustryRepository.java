package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Industry;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class IndustryRepository  extends JdbcRepository<Industry, String> {
	@Autowired
	private  JdbcTemplate jdbcTemplateObject;
	
	
	public IndustryRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_industry", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Industry> ROW_MAPPER = new RowMapper<Industry>(){

		@Override
		public Industry mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Industry Industry= new Industry(
					rs.getString("id"),
					rs.getString("IndustryName"),
					rs.getString("IndustryDes"),
					rs.getTimestamp("CreateDate"),
					rs.getTimestamp("UpdateDate"),
					rs.getString("CreateUser"),
					rs.getString("UpdateUser"),
					rs.getInt("enabled"));
			Industry.setPersisted(true);
			return Industry;
		}
		
	};

	public static final RowUnmapper<Industry> ROW_UNMAPPER = new RowUnmapper<Industry>(){

		@Override
		public Map<String, Object> mapColumns(Industry t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("IndustryName", t.getIndustryName());
			mapping.put("IndustryDes", t.getIndustryDes());
			mapping.put("CreateDate", t.getCreateDate());
			mapping.put("UpdateDate", t.getUpdateDate());
			mapping.put("CreateUser", t.getCreateUser());
			mapping.put("UpdateUser", t.getUpdateUser());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends Industry> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends Industry> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}

	public void active(String string) {
		String query="UPDATE "+this.getTable().getName() +""
				+ "   set enabled=1 where id=?";
		jdbcTemplateObject.update(query, new Object[]{string});
		
	}

	public void disabled(String string) {
		String query="UPDATE "+this.getTable().getName() +""
				+ "   set enabled=0 where id=?";
		jdbcTemplateObject.update(query, new Object[]{string});
		
	}
	
}
