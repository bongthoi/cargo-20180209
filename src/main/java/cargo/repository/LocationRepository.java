package cargo.repository;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Location;

import com.nurkiewicz.jdbcrepository.JdbcRepository;
import com.nurkiewicz.jdbcrepository.RowUnmapper;


@Repository
public class LocationRepository  extends JdbcRepository<Location, String> {

	public LocationRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_location", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Location> ROW_MAPPER = new RowMapper<Location>(){

		@Override
		public Location mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			Location location= new Location(
					rs.getString("id"),
					rs.getString("LocationName"),
					rs.getString("Description"), 
					rs.getInt("enabled"));
			location.setPersisted(true);
			return location;
		}
		
	};

	public static final RowUnmapper<Location> ROW_UNMAPPER = new RowUnmapper<Location>(){

		@Override
		public Map<String, Object> mapColumns(Location t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("LocationName", t.getLocationName());
			mapping.put("Description", t.getDescription());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends Location> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends Location> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}
	
}
