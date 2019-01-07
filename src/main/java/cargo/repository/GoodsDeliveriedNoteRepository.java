package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteReport;
import cargo.domain.GoodsDeliveriedNote;

import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class GoodsDeliveriedNoteRepository extends CustomizeRepository<GoodsDeliveriedNote, String> {
	
	public GoodsDeliveriedNoteRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_goods_deliveried_note", "id");
		// TODO Auto-generated constructor stub
	}
	public static final RowMapper<GoodsDeliveriedNote> ROW_MAPPER = new RowMapper<GoodsDeliveriedNote>(){

		@Override
		public GoodsDeliveriedNote mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			GoodsDeliveriedNote t= new GoodsDeliveriedNote(
					rs.getString("id"),
					rs.getString("DocumentNo"),
					rs.getInt("TypeofNote"),
					rs.getString("FromLogicWarehouse"),
					rs.getString("ToLogicWarehouse"),
					rs.getInt("TotalQuantity"),
					rs.getBigDecimal("TotalAmount"),
					rs.getTimestamp("CreateDate"),
					rs.getTimestamp("ApproveDate"),
					rs.getString("CreateUser"),
					rs.getString("ApproveUser"),
					rs.getString("Note"),
					rs.getInt("IsCheck"),
					rs.getString("InPreference"));
			t.setPersisted(true);
			return t;
		}
		
	};

	public static final RowUnmapper<GoodsDeliveriedNote> ROW_UNMAPPER = new RowUnmapper<GoodsDeliveriedNote>(){

		@Override
		public Map<String, Object> mapColumns(GoodsDeliveriedNote t) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", t.getId());
			mapping.put("DocumentNo", t.getDocumentNo());
			mapping.put("TypeofNote", t.getTypeofNote());
			mapping.put("FromLogicWarehouse", t.getFromLogicWarehouse());
			mapping.put("ToLogicWarehouse",t.getToLogicWarehouse());
			mapping.put("TotalQuantity", t.getTotalQuantity());
			mapping.put("TotalAmount",t.getTotalAmount());
			mapping.put("CreateDate", t.getCreateDate());
			mapping.put("ApproveDate", t.getApproveDate());
			mapping.put("CreateUser", t.getCreateUser());
			mapping.put("ApproveUser", t.getApproveUser());
			mapping.put("Note", t.getNote());
			mapping.put("IsCheck", t.getIsCheck());
			mapping.put("InPreference",t.getInPreference());
			return mapping;
		}
		
	};
	@Override
	protected <S extends GoodsDeliveriedNote> S postUpdate(S entity) {
		entity.setPersisted(true);
		return entity;
	}

	@Override
	protected <S extends GoodsDeliveriedNote> S postCreate(S entity, Number generatedId) {			
		entity.setPersisted(true);
		return entity;
	}

	public String GenarateId(){
		String sql="select getNextCustomSeq('PX_ID', 'PX') as id ";
		return this.getJdbcTemplate().queryForObject(sql, String.class);
	}

	public GoodsDeliveriedNoteReport getDeliveriedReportById(String id) {
		String sql="select t1.*,IFNULL(t2.name,t1.FromLogicWarehouse) as FromLogicWarehouseName,IFNULL(t3.name,t1.ToLogicWarehouse) as ToLogicWarehouseName "
				+ "  from( select * from tb_goods_deliveried_note "
				+ "  where id='"+id+"') t1 "
						+ " LEFT OUTER  JOIN tb_logical_warehouse t2 ON t1.FromLogicWarehouse=t2.id"
						+ " LEFT OUTER  JOIN tb_logical_warehouse t3 ON t1.ToLogicWarehouse=t3.id";
		return this.getJdbcTemplate().queryForObject(sql, GoodsDeliveriedNoteReport.ROW_MAPPER);
	}
}

