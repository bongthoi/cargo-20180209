package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import cargo.domain.InventoryReportHistory;

import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class InventoryReportHistoryReposiory extends
		CustomizeRepository<InventoryReportHistory, Integer> {
	public InventoryReportHistoryReposiory() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_inventory_report_history");
	}

	public static final RowMapper<InventoryReportHistory> ROW_MAPPER = new RowMapper<InventoryReportHistory>() {

		@Override
		public InventoryReportHistory mapRow(ResultSet rs, int rowNum)
				throws SQLException { // mapper when select

			InventoryReportHistory a = new InventoryReportHistory(
					rs.getInt("id"), rs.getString("name"),
					rs.getTimestamp("beginning_date"),
					rs.getTimestamp("ending_date"));
			return a;
		}
	};
	private static final RowUnmapper<InventoryReportHistory> ROW_UNMAPPER = new RowUnmapper<InventoryReportHistory>() {
		@Override
		public Map<String, Object> mapColumns(InventoryReportHistory a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("name", a.getName());
			mapping.put("beginning_date", a.getBeginning_date());
			mapping.put("ending_date", a.getEnding_date());
			return mapping;
		}
	};

	@Override
	protected <S extends InventoryReportHistory> S postCreate(S entity,
			Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}

	public InventoryReportHistory findLast() {
		String sql="select * from "+this.getTable().getName()+ " order by id desc limit 1 ";
		InventoryReportHistory a= this.getJdbcTemplate().queryForObject(sql, InventoryReportHistoryReposiory.ROW_MAPPER);
		return a;
	}
}
