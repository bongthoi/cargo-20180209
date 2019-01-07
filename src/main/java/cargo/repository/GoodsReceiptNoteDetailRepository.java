package cargo.repository;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import cargo.JRDataSourceAdapter.GoodsReceiptNoteDetailReport;
import cargo.domain.GoodsReceiptNoteDetail;

import com.nurkiewicz.jdbcrepository.RowUnmapper;
@Repository
public class GoodsReceiptNoteDetailRepository extends CustomizeRepository<GoodsReceiptNoteDetail, Integer>{
	
	public GoodsReceiptNoteDetailRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_goods_receipt_note_detail");
	}

	public static final RowMapper<GoodsReceiptNoteDetail> ROW_MAPPER = new RowMapper<GoodsReceiptNoteDetail>(){

		@Override
		public GoodsReceiptNoteDetail mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			GoodsReceiptNoteDetail a= new GoodsReceiptNoteDetail(
					rs.getInt("id"),
					rs.getString("ProductId"),
					rs.getString("ProductCode"),
					rs.getString("ProductName"),
					rs.getInt("Unit"),
					rs.getInt("RealQuantity"),
					rs.getInt("DocumentQuantity"),
					rs.getBigDecimal("Price"),
					rs.getBigDecimal("Amount"),
					rs.getString("GoodsReceiptNoteId")
					);
			return a;
		}
	};	

	private static final RowUnmapper<GoodsReceiptNoteDetail> ROW_UNMAPPER = new RowUnmapper<GoodsReceiptNoteDetail>() {
		@Override
		public Map<String, Object> mapColumns(GoodsReceiptNoteDetail a) {
			Map<String, Object> mapping = new LinkedHashMap<String, Object>();
			mapping.put("id", a.getId());
			mapping.put("ProductId", a.getProductId());
			mapping.put("ProductCode", a.getProductCode());
			mapping.put("ProductName",a.getProductName());
			mapping.put("Unit",a.getUnit());
			mapping.put("RealQuantity",a.getRealQuantity());
			mapping.put("DocumentQuantity",a.getRealQuantity());
			mapping.put("Price", a.getPrice());
			mapping.put("Amount",a.getAmount());
			mapping.put("GoodsReceiptNoteId", a.getGoodsReceiptNoteId());
			return mapping;
		}
	};	

	@Override
	protected <S extends GoodsReceiptNoteDetail> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
	
	public List<GoodsReceiptNoteDetailReport> findByGoodsReceiptId(String id){
		
		String query="select t1.*,t2.name as UnitName from "
				+ " (SELECT * FROM tb_goods_receipt_note_detail  where GoodsReceiptNoteId='"+id+"') as t1,tb_unit as t2  "
				+ " where t2.id = t1.Unit;";
		return this.getJdbcTemplate().query(query, GoodsReceiptNoteDetailReport.ROW_MAPPER);
		
	}

}
