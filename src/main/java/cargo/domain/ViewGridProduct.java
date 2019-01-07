package cargo.domain;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.data.domain.Persistable;

public class ViewGridProduct implements Persistable<String>{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1843006455338335129L;
	private transient boolean persisted;
	
	   private String id;
	   private String ProductName;
	   private String FeatureImage;
	   private int Unit;
	   private int BigUnit;
	   private BigDecimal CostPrice;
	   private BigDecimal SellPrice;
	   private BigDecimal SellPrice1;
	   private BigDecimal SellPrice2;
	   private String CategoryId;
	   private String CategoryAnalyseId;
		private String SupplierId;
	   private int BusinessType;
	   private Date CreateDate;
	   private Date UpdateDate;
	   private String CreateUser;
	   private String UpdateUser;
	   private int enabled;
	   private String BigUnitName;
	   private String CategoryName;
	   private String SupplierName;
	   private String UnitName;
	   private String BusinessTypeName;
	   private String ProductCode;

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
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public String getFeatureImage() {
		return FeatureImage;
	}
	public void setFeatureImage(String featureImage) {
		FeatureImage = featureImage;
	}
	public int getUnit() {
		return Unit;
	}
	public void setUnit(int unit) {
		Unit = unit;
	}
	public int getBigUnit() {
		return BigUnit;
	}
	public void setBigUnit(int bigUnit) {
		BigUnit = bigUnit;
	}
	public BigDecimal getCostPrice() {
		return CostPrice;
	}
	public void setCostPrice(BigDecimal costPrice) {
		CostPrice = costPrice;
	}
	public BigDecimal getSellPrice() {
		return SellPrice;
	}
	public void setSellPrice(BigDecimal sellPrice) {
		SellPrice = sellPrice;
	}
	public BigDecimal getSellPrice1() {
		return SellPrice1;
	}
	public void setSellPrice1(BigDecimal sellPrice1) {
		SellPrice1 = sellPrice1;
	}
	public BigDecimal getSellPrice2() {
		return SellPrice2;
	}
	public void setSellPrice2(BigDecimal sellPrice2) {
		SellPrice2 = sellPrice2;
	}
	public String getCategoryId() {
		return CategoryId;
	}
	public void setCategoryId(String categoryId) {
		CategoryId = categoryId;
	}
	public String getCategoryAnalyseId() {
		return CategoryAnalyseId;
	}
	public void setCategoryAnalyseId(String categoryAnalyseId) {
		CategoryAnalyseId = categoryAnalyseId;
	}
	public int getBusinessType() {
		return BusinessType;
	}
	public void setBusinessType(int businessType) {
		BusinessType = businessType;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public Date getUpdateDate() {
		return UpdateDate;
	}
	public void setUpdateDate(Date updateDate) {
		UpdateDate = updateDate;
	}
	public String getCreateUser() {
		return CreateUser;
	}
	public void setCreateUser(String createUser) {
		CreateUser = createUser;
	}
	public String getUpdateUser() {
		return UpdateUser;
	}
	public void setUpdateUser(String updateUser) {
		UpdateUser = updateUser;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public String getBigUnitName() {
		return BigUnitName;
	}
	public void setBigUnitName(String bigUnitName) {
		BigUnitName = bigUnitName;
	}
	public String getCategoryName() {
		return CategoryName;
	}
	public void setCategoryName(String categoryName) {
		CategoryName = categoryName;
	}
	public String getSupplierName() {
		return SupplierName;
	}
	public void setSupplierName(String supplierName) {
		SupplierName = supplierName;
	}
	public String getUnitName() {
		return UnitName;
	}
	public void setUnitName(String unitName) {
		UnitName = unitName;
	}
	public String getBusinessTypeName() {
		return BusinessTypeName;
	}
	public void setBusinessTypeName(String businessTypeName) {
		BusinessTypeName = businessTypeName;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public String getSupplierId() {
		return SupplierId;
	}
	public void setSupplierId(String supplierId) {
		SupplierId = supplierId;
	}
	public ViewGridProduct(String id, String productName, String featureImage,
			int unit, int bigUnit, BigDecimal costPrice, BigDecimal sellPrice,
			BigDecimal sellPrice1, BigDecimal sellPrice2, String categoryId,
			String categoryAnalyseId, int businessType,String supplierId, Date createDate,
			Date updateDate, String createUser, String updateUser, int enabled,
			String bigUnitName, String categoryName, String supplierName,
			String unitName, String businessTypeName,String productCode) {
		super();
		this.id = id;
		ProductName = productName;
		FeatureImage = featureImage;
		Unit = unit;
		BigUnit = bigUnit;
		CostPrice = costPrice;
		SellPrice = sellPrice;
		SellPrice1 = sellPrice1;
		SellPrice2 = sellPrice2;
		CategoryId = categoryId;
		CategoryAnalyseId = categoryAnalyseId;
		BusinessType = businessType;
		SupplierId=supplierId;
		CreateDate = createDate;
		UpdateDate = updateDate;
		CreateUser = createUser;
		UpdateUser = updateUser;
		this.enabled = enabled;
		BigUnitName = bigUnitName;
		CategoryName = categoryName;
		SupplierName = supplierName;
		UnitName = unitName;
		BusinessTypeName = businessTypeName;
		ProductCode=productCode;
	}
	public ViewGridProduct() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
