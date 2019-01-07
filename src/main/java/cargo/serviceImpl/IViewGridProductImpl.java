package cargo.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import cargo.domain.ViewGridProduct;
import cargo.repository.ViewGridProductRepository;
import cargo.service.IViewGridProduct;

@Service
public class IViewGridProductImpl implements IViewGridProduct  {

	@Autowired
	private ViewGridProductRepository viewGridProductRepository;
	@Override
	public Page<ViewGridProduct> findAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return viewGridProductRepository.findAll(pageable);
	}
	@Override
	public Page<ViewGridProduct> findByObjectAttribute(
			ViewGridProduct viewGridProduct, Pageable pageable) {
		String whereClause = " WHERE 1=1 ";
		
		if(!StringUtils.isEmpty(viewGridProduct.getProductName())){
			whereClause += " AND ( lower(ProductName) like lower('%" + viewGridProduct.getProductName()+"%') ";
			whereClause += " OR id like '%" + viewGridProduct.getProductName()+"%' ) ";
		}
		if(!StringUtils.isEmpty(viewGridProduct.getCategoryId())){
			whereClause += " AND CategoryId = '" + viewGridProduct.getCategoryId() +"'";
		}
		if(!StringUtils.isEmpty(viewGridProduct.getSupplierId())){
			whereClause += " AND SupplierId = '" + viewGridProduct.getSupplierId() +"' ";
		}
		return viewGridProductRepository.findQuery(whereClause, pageable);
	}

}
