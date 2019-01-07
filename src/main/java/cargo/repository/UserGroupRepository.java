package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import cargo.domain.UserGroup;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;


@Repository
public class UserGroupRepository extends JdbcRepository<UserGroup, String> {

	public UserGroupRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_user_group", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<UserGroup> ROW_MAPPER = new RowMapper<UserGroup>(){

		@Override
		public UserGroup mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			UserGroup UserGroup= new UserGroup(
					rs.getString("id"),
					rs.getString("UserGroupName"),
					rs.getString("UserGroupDes"), 
					rs.getInt("enabled"));
			UserGroup.setPersisted(true);
			return UserGroup;
		}
		
	};

	public static final RowUnmapper<UserGroup> ROW_UNMAPPER = new RowUnmapper<UserGroup>(){

		@Override
		public Map<String, Object> mapColumns(UserGroup t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("UserGroupName", t.getUserGroupName());
			mapping.put("UserGroupDes", t.getUserGroupDes());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends UserGroup> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends UserGroup> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}
	
}
