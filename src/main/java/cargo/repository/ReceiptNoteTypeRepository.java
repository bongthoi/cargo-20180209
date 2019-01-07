package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.domain.ReceiptNoteType;
import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class ReceiptNoteTypeRepository  extends CustomizeRepository<ReceiptNoteType, Integer>{
	
	public ReceiptNoteTypeRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_receipt_note_type");
	}

	public static final RowMapper<ReceiptNoteType> ROW_MAPPER = new RowMapper<ReceiptNoteType>(){

		@Override
		public ReceiptNoteType mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			ReceiptNoteType a= new ReceiptNoteType(
					rs.getInt("id"),
					rs.getString("name")
					);
			return a;
		}
	};	

	private static final RowUnmapper<ReceiptNoteType> ROW_UNMAPPER = new RowUnmapper<ReceiptNoteType>() {
		@Override
		public Map<String, Object> mapColumns(ReceiptNoteType a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			return mapping;
		}
	};	

	@Override
	protected <S extends ReceiptNoteType> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
}
