package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.Supplier;

import com.nurkiewicz.jdbcrepository.RowUnmapper;



@Repository
public class SupplierRepository extends CustomizeRepository<Supplier, String>{

	public SupplierRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_supplier", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<Supplier> ROW_MAPPER = new RowMapper<Supplier>(){

		@Override
		public Supplier mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			Supplier a= new Supplier(
					rs.getString("id"),
					rs.getString("SupplierName"),
					rs.getInt("BusinessType"),
					rs.getString("Description"),
					rs.getString("Address"),
					rs.getString("Phone"),
					rs.getString("Email"),
					rs.getString("Website"),
					rs.getInt("enabled"));
			a.setPersisted(true);
			return a;
		}
		
	};

	public static final RowUnmapper<Supplier> ROW_UNMAPPER = new RowUnmapper<Supplier>(){

		@Override
		public Map<String, Object> mapColumns(Supplier t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("SupplierName", t.getSupplierName());
			mapping.put("BusinessType", t.getDescription());
			mapping.put("Description", t.getDescription());
			mapping.put("Address", t.getAddress());
			mapping.put("Phone", t.getPhone());
			mapping.put("Email", t.getEmail());
			mapping.put("Website", t.getWebsite());
			mapping.put("enabled", t.getEnabled());
			return mapping;
		}
		
	};
	@Override
	protected <S extends Supplier> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends Supplier> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}
}
