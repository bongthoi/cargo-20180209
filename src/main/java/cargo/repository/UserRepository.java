package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.User;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;


@Repository
public class UserRepository  extends JdbcRepository<User, String>{

	@Autowired
	private  JdbcTemplate jdbcTemplateObject;
	
	public UserRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tbuser", "username");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<User> ROW_MAPPER = new RowMapper<User>(){

		@Override
		public User mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			User user= new User(
					rs.getString("username"),
					rs.getString("password"),
					rs.getString("FirstName"), 
					rs.getString("LastName"), 
					rs.getTimestamp("Birthday"), 
					rs.getString("PhysicalWarehouseId"), 
					rs.getString("UserGroupId"), 
					rs.getTimestamp("RegisterDate"), 
					rs.getTimestamp("UpdateDate"), 
					rs.getString("RegisterUser"), 
					rs.getString("UpdateUser"), 
					rs.getString("LocationId"), 
					rs.getString("user_role"), 
					rs.getInt("enabled"));
			user.setPersisted(true);
			return user;
		}
		
	};

	public static final RowUnmapper<User> ROW_UNMAPPER = new RowUnmapper<User>(){

		@Override
		public Map<String, Object> mapColumns(User t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("username", t.getUsername());
			mapping.put("password", t.getPassword());
			mapping.put("FirstName", t.getFirstName());
			mapping.put("LastName", t.getLastName());
			mapping.put("Birthday", t.getBirthday());
			mapping.put("PhysicalWarehouseId", t.getPhysicalWarehouseId());
			mapping.put("UserGroupId", t.getUserGroupId());
			mapping.put("RegisterDate", t.getRegisterDate());
			mapping.put("UpdateDate", t.getUpdateDate());
			mapping.put("RegisterUser", t.getRegisterUser());
			mapping.put("UpdateUser", t.getUpdateUser());
			mapping.put("LocationId", t.getLocationId());
			mapping.put("user_role", "ROLE_ADMIN");
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};

			@Override
			protected <S extends User> S postUpdate(S entity) {
				entity.setPersisted(true);
				return entity;
			}

			@Override
			protected <S extends User> S postCreate(S entity, Number generatedId) {			
				entity.setPersisted(true);
				return entity;
			}
			
		public void update(String query,Object[] objectparam){
			jdbcTemplateObject.update(query, objectparam);
		}

		public void disabled(String username) {
			String query="UPDATE "+this.getTable().getName() +""
					+ "   set enabled=0 where username=?";
			jdbcTemplateObject.update(query, new Object[]{username});
		}

		public void active(String username) {
			String query="UPDATE "+this.getTable().getName() +""
					+ "   set enabled=1 where username=?";
			jdbcTemplateObject.update(query, new Object[]{username});
			
		}	
}
