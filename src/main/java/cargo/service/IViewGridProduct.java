package cargo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import cargo.domain.ViewGridProduct;


public interface IViewGridProduct {

	Page<ViewGridProduct> findAll(Pageable pageable);
	Page<ViewGridProduct> findByObjectAttribute(ViewGridProduct viewGridProduct,Pageable pageable);
}
