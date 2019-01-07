package cargo.domain;
import static com.nurkiewicz.jdbcrepository.JdbcRepository.pk;

import java.util.Date;

import org.springframework.data.domain.Persistable;

public class Inventory implements Persistable<Object[]> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8432401999757028116L;

	private transient boolean persisted;

	private String LogicWarehouseId;
	private String ProductId;
	private String ProductCode;
	private String ProductName;
	private int RealQuantity;
	private int DocumentQuantity;
	private Date ModifyTime;
	

	@Override
	public Object[] getId() {
		return pk(LogicWarehouseId, ProductId);
	}

	@Override
	public boolean isNew() {
		return !persisted;
	}

	public boolean isPersisted() {
		return persisted;
	}

	public void setPersisted(boolean persisted) {
		this.persisted = persisted;
	}

	public String getLogicWarehouseId() {
		return LogicWarehouseId;
	}

	public void setLogicWarehouseId(String logicWarehouseId) {
		LogicWarehouseId = logicWarehouseId;
	}

	public String getProductId() {
		return ProductId;
	}

	public void setProductId(String productId) {
		ProductId = productId;
	}

	public String getProductName() {
		return ProductName;
	}

	public void setProductName(String productName) {
		ProductName = productName;
	}

	public int getRealQuantity() {
		return RealQuantity;
	}

	public void setRealQuantity(int realQuantity) {
		RealQuantity = realQuantity;
	}

	public int getDocumentQuantity() {
		return DocumentQuantity;
	}

	public void setDocumentQuantity(int documentQuantity) {
		DocumentQuantity = documentQuantity;
	}

	public Date getModifyTime() {
		return ModifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		ModifyTime = modifyTime;
	}



	public String getProductCode() {
		return ProductCode;
	}

	public void setProductCode(String productCode) {
		ProductCode = productCode;
	}

	public Inventory(String logicWarehouseId, String productId,String productCode,
			String productName, int realQuantity, int documentQuantity,
			Date modifyTime) {
		super();
		LogicWarehouseId = logicWarehouseId;
		ProductId = productId;
		ProductCode=productCode;
		ProductName = productName;
		RealQuantity = realQuantity;
		DocumentQuantity = documentQuantity;
		ModifyTime = modifyTime;
		
		this.persisted=false;
	}

	public Inventory() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
