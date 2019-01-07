package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;



import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Category;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class CategoryRepository   extends JdbcRepository<Category, String>{

	@Autowired
	private  JdbcTemplate jdbcTemplateObject;
	
	public CategoryRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_category", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Category> ROW_MAPPER = new RowMapper<Category>(){

		@Override
		public Category mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Category Category= new Category(
					rs.getString("id"),
					rs.getString("CategoryName"),
					rs.getString("CategoryDes"),
					rs.getString("IndustryId"),
					rs.getTimestamp("CreateDate"),
					rs.getTimestamp("UpdateDate"),
					rs.getString("CreateUser"),
					rs.getString("UpdateUser"),
					rs.getInt("enabled"));
			Category.setPersisted(true);
			return Category;
		}
		
	};

	public static final RowUnmapper<Category> ROW_UNMAPPER = new RowUnmapper<Category>(){

		@Override
		public Map<String, Object> mapColumns(Category t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("CategoryName", t.getCategoryName());
			mapping.put("CategoryDes", t.getCategoryDes());
			mapping.put("IndustryId", t.getIndustryId());
			mapping.put("CreateDate", t.getCreateDate());
			mapping.put("UpdateDate", t.getUpdateDate());
			mapping.put("CreateUser", t.getCreateUser());
			mapping.put("UpdateUser", t.getUpdateUser());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends Category> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends Category> S postCreate(S entity, Number generatedId) {			
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
