package cargo.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cargo.JRDataSourceAdapter.GoodsDeliveriedNoteDetailReport;
import cargo.domain. GoodsDeliveriedNoteDetail;

import com.nurkiewicz.jdbcrepository.RowUnmapper;

@Repository
public class GoodsDeliveriedNoteDetailRepository extends CustomizeRepository<GoodsDeliveriedNoteDetail, Integer>{
	
	public  GoodsDeliveriedNoteDetailRepository() {
		super(ROW_MAPPER, ROW_UNMAPPER, "tb_goods_deliveried_note_detail");
	}

	public static final RowMapper<GoodsDeliveriedNoteDetail> ROW_MAPPER = new RowMapper<GoodsDeliveriedNoteDetail>(){

		@Override
		public  GoodsDeliveriedNoteDetail mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			 GoodsDeliveriedNoteDetail a= new  GoodsDeliveriedNoteDetail(
					rs.getInt("id"),
					rs.getString("ProductId"),
					rs.getString("ProductCode"),
					rs.getString("ProductName"),
					rs.getInt("Unit"),
					rs.getInt("RealQuantity"),
					rs.getInt("DocumentQuantity"),
					rs.getBigDecimal("Price"),
					rs.getBigDecimal("Amount"),
					rs.getString("GoodsDeliveriedNoteId")
					);
			return a;
		}
	};	

	private static final RowUnmapper<GoodsDeliveriedNoteDetail> ROW_UNMAPPER = new RowUnmapper<GoodsDeliveriedNoteDetail>() {
		@Override
		public Map<String, Object> mapColumns( GoodsDeliveriedNoteDetail a) {
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
			mapping.put("GoodsDeliveriedNoteId", a.getGoodsDeliveriedNoteId());
			return mapping;
		}
	};	

	@Override
	protected <S extends  GoodsDeliveriedNoteDetail> S postCreate(S entity, Number generatedId) {
		entity.setId(generatedId.intValue());
		return entity;
	}
	public List<GoodsDeliveriedNoteDetailReport> findByGoodsDeliveriedId(String id){
		String query="select t1.*,t2.name as UnitName from "
				+ " (SELECT * FROM tb_goods_deliveried_note_detail  where GoodsDeliveriedNoteId='"+id+"') as t1,tb_unit as t2  "
				+ " where t2.id = t1.Unit;";
		return this.getJdbcTemplate().query(query, GoodsDeliveriedNoteDetailReport.ROW_MAPPER);
		
	}
}