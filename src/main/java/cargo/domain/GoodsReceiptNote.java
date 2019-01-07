package cargo.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.data.domain.Persistable;

public class GoodsReceiptNote implements Persistable<String>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3197012653133921836L;
	private transient boolean persisted;
	private String id;
	private String DocumentNo;
	
	@Min(1)
	private int TypeofNote;
	
	@NotEmpty
	private String FromLogicWarehouse;
	@NotEmpty
	private String ToLogicWarehouse;
	
	private int TotalQuantity;
	private BigDecimal TotalAmount;
	private Date CreateDate;
	private Date ApproveDate;
	private String CreateUser;
	private String ApproveUser;
	private String Note;
	private int IsCheck;
	private String OutPreference;
	
	private List<GoodsReceiptNoteDetail> goodsReceiptNoteDetails ;
	
	@Override
	public String getId() {
		// TODO Auto-generated method stub
		return id;
	}
	@Override
	public boolean isNew() {
		// TODO Auto-generated method stub
		return !persisted;
	}
	public void setPersisted(boolean persisted) {
		this.persisted = persisted;
	}
	
	public boolean isPersisted() {
		return persisted;
	}
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
	public List<GoodsReceiptNoteDetail> getGoodsReceiptNoteDetails() {
		return goodsReceiptNoteDetails;
	}
	public void setGoodsReceiptNoteDetails(
			List<GoodsReceiptNoteDetail> goodsReceiptNoteDetails) {
		this.goodsReceiptNoteDetails = goodsReceiptNoteDetails;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOutPreference() {
		return OutPreference;
	}
	public void setOutPreference(String outPreference) {
		OutPreference = outPreference;
	}
	public GoodsReceiptNote() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public GoodsReceiptNote(String id, String documentNo, int typeofNote,
			String fromLogicWarehouse, String toLogicWarehouse,
			int totalQuantity, BigDecimal totalAmount, Date createDate,
			Date approveDate, String createUser, String approveUser,
			String note, int isCheck,String OutPreference ) {
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
		this.OutPreference=OutPreference;
		this.goodsReceiptNoteDetails=new ArrayList<GoodsReceiptNoteDetail>();
		this.persisted = false;
		
	}
	
	
}
