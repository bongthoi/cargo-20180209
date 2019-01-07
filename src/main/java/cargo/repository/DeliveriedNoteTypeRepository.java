package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.DeliveriedNoteType;

import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class DeliveriedNoteTypeRepository  extends CustomizeRepository<DeliveriedNoteType, Integer>{
	
	public DeliveriedNoteTypeRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_deliveried_note_type");
	}

	public static final RowMapper<DeliveriedNoteType> ROW_MAPPER = new RowMapper<DeliveriedNoteType>(){

		@Override
		public DeliveriedNoteType mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			DeliveriedNoteType a= new DeliveriedNoteType(
					rs.getInt("id"),
					rs.getString("name")
					);
			return a;
		}
	};	

	private static final RowUnmapper<DeliveriedNoteType> ROW_UNMAPPER = new RowUnmapper<DeliveriedNoteType>() {
		@Override
		public Map<String, Object> mapColumns(DeliveriedNoteType a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			return mapping;
		}
	};	

	@Override
	protected <S extends DeliveriedNoteType> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
}
