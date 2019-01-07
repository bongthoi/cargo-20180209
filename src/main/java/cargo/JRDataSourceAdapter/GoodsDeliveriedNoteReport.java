package cargo.JRDataSourceAdapter;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import org.springframework.jdbc.core.RowMapper;

public class GoodsDeliveriedNoteReport{

	private String id;
	private String DocumentNo;
	private int TypeofNote;
	private String FromLogicWarehouse;
	private String ToLogicWarehouse;
	private int TotalQuantity;
	private BigDecimal TotalAmount;
	private Date CreateDate;
	private Date ApproveDate;
	private String CreateUser;
	private String ApproveUser;
	private String Note;
	private int IsCheck;
	private String FromLogicWarehouseName;
	private String ToLogicWarehouseName;
	

	public String getDocumentNo() {
		return DocumentNo;
	}
	public void setDocumentNo(String documentNo) {
		DocumentNo = documentNo;
	}
	public int getTypeofNote() {
		return TypeofNote;
	}
	public void setTypeofNote(int typeofNote) {
		TypeofNote = typeofNote;
	}
	public String getFromLogicWarehouse() {
		return FromLogicWarehouse;
	}
	public void setFromLogicWarehouse(String fromLogicWarehouse) {
		FromLogicWarehouse = fromLogicWarehouse;
	}
	public String getToLogicWarehouse() {
		return ToLogicWarehouse;
	}
	public void setToLogicWarehouse(String toLogicWarehouse) {
		ToLogicWarehouse = toLogicWarehouse;
	}
	public int getTotalQuantity() {
		return TotalQuantity;
	}
	public void setTotalQuantity(int totalQuantity) {
		TotalQuantity = totalQuantity;
	}
	public BigDecimal getTotalAmount() {
		return TotalAmount;
	}
	public void setTotalAmount(BigDecimal totalAmount) {
		TotalAmount = totalAmount;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public Date getApproveDate() {
		return ApproveDate;
	}
	public void setApproveDate(Date approveDate) {
		ApproveDate = approveDate;
	}
	public String getCreateUser() {
		return CreateUser;
	}
	public void setCreateUser(String createUser) {
		CreateUser = createUser;
	}
	public String getApproveUser() {
		return ApproveUser;
	}
	public void setApproveUser(String approveUser) {
		ApproveUser = approveUser;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}
	public int getIsCheck() {
		return IsCheck;
	}
	public void setIsCheck(int isCheck) {
		IsCheck = isCheck;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	

	public GoodsDeliveriedNoteReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public String getFromLogicWarehouseName() {
		return FromLogicWarehouseName;
	}
	public void setFromLogicWarehouseName(String fromLogicWarehouseName) {
		FromLogicWarehouseName = fromLogicWarehouseName;
	}
	public String getToLogicWarehouseName() {
		return ToLogicWarehouseName;
	}
	public void setToLogicWarehouseName(String toLogicWarehouseName) {
		ToLogicWarehouseName = toLogicWarehouseName;
	}
	public GoodsDeliveriedNoteReport(String id, String documentNo,
			int typeofNote, String fromLogicWarehouse, String toLogicWarehouse,
			int totalQuantity, BigDecimal totalAmount, Date createDate,
			Date approveDate, String createUser, String approveUser,
			String note, int isCheck, String fromLogicWarehouseName,
			String toLogicWarehouseName) {
		super();
		this.id = id;
		DocumentNo = documentNo;
		TypeofNote = typeofNote;
		FromLogicWarehouse = fromLogicWarehouse;
		ToLogicWarehouse = toLogicWarehouse;
		TotalQuantity = totalQuantity;
		TotalAmount = totalAmount;
		CreateDate = createDate;
		ApproveDate = approveDate;
		CreateUser = createUser;
		ApproveUser = approveUser;
		Note = note;
		IsCheck = isCheck;
		FromLogicWarehouseName = fromLogicWarehouseName;
		ToLogicWarehouseName = toLogicWarehouseName;
	}
	
	public static final RowMapper<GoodsDeliveriedNoteReport> ROW_MAPPER = new RowMapper<GoodsDeliveriedNoteReport>(){

		@Override
		public GoodsDeliveriedNoteReport mapRow(ResultSet rs, int rowNum) throws SQLException {	//mapper when select
			
			GoodsDeliveriedNoteReport t= new GoodsDeliveriedNoteReport(
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
					rs.getString("FromLogicWarehouseName"),
					rs.getString("ToLogicWarehouseName"));
			return t;
		}
		
	};
	
	
}	
	
