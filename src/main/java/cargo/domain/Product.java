package cargo.domain;

import java.math.BigDecimal;
import java.util.Date;

import javax.validation.constraints.Min;

import org.hibernate.validator.constraints.EAN;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.data.domain.Persistable;

public class Product  implements Persistable<String>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4886592322593759450L;


	private transient boolean persisted;

	@NotEmpty
	@EAN
	private String id;//EAN13
	
	private String FeatureImage;
	
	@NotEmpty
	private String ProductName;
	
	private String ProductDes;
	private String ProductGuide;
	
	@Min(1)
	private int Unit;
	
	@Min(1)
	private int BigUnit;
	
	@Range(min=0,max=1999999999)
	private BigDecimal  CostPrice;
	
	@Range(min=0,max=1999999999)
	private BigDecimal  SellPrice;
	
	@Range(min=0,max=1999999999)
	private BigDecimal  SellPrice1;
	
	@Range(min=0,max=1999999999)
	private BigDecimal  SellPrice2;
	
	@NotEmpty
	private String SupplierId;
	
	@NotEmpty
	private String CategoryId;
	
	@NotEmpty
	private String CategoryAnalyseId;
	
	@Min(1)
	private int BusinessType;
	
	@NotEmpty
	private String ProductCode;
	
	private Date CreateDate;
	private Date UpdateDate;
	private String CreateUser;
	private String UpdateUser;
	private int enabled;
	
	
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
	public String getProductDes() {
		return ProductDes;
	}
	public void setProductDes(String productDes) {
		ProductDes = productDes;
	}
	public String getProductGuide() {
		return ProductGuide;
	}
	public void setProductGuide(String productGuide) {
		ProductGuide = productGuide;
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
	public String getSupplierId() {
		return SupplierId;
	}
	public void setSupplierId(String supplierId) {
		SupplierId = supplierId;
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
	public void setId(String id) {
		this.id = id;
	}
	
	public String getFeatureImage() {
		return FeatureImage;
	}
	public void setFeatureImage(String featureImage) {
		FeatureImage = featureImage;
	}
	
	
	
	public String getProductCode() {
		return ProductCode;
	}
	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}
	public Product(String id,String featureImage, String productName, String productDes,
			String productGuide, int unit, int bigUnit, BigDecimal costPrice,
			BigDecimal sellPrice, BigDecimal sellPrice1,BigDecimal sellPrice2,
			String supplierId, String categoryId, String categoryAnalyseId,
			int businessType, Date createDate, Date updateDate,
			String createUser, String updateUser, int enabled,String productCode) {
		this.id = id;
		this.FeatureImage=featureImage;
		ProductName = productName;
		ProductDes = productDes;
		ProductGuide = productGuide;
		Unit = unit;
		BigUnit = bigUnit;
		CostPrice = costPrice;
		SellPrice = sellPrice;
		SellPrice1 = sellPrice1;
		SellPrice2 = sellPrice2;
		SupplierId = supplierId;
		CategoryId = categoryId;
		CategoryAnalyseId = categoryAnalyseId;
		BusinessType = businessType;
		CreateDate = createDate;
		UpdateDate = updateDate;
		CreateUser = createUser;
		UpdateUser = updateUser;
		this.enabled = enabled;
		ProductCode=productCode;
		this.persisted = false;
		
	}
	public Product() {
		// TODO Auto-generated constructor stub
		this.BusinessType=0;
		this.Unit=0;
		this.BigUnit=0;
		this.CostPrice=new BigDecimal("0.00");
		this.SellPrice1=new BigDecimal("0.00");
		this.SellPrice=new BigDecimal("0.00");
		this.SellPrice2=new BigDecimal("0.00");
		this.CategoryAnalyseId="0000000000000";
		
	}
}
