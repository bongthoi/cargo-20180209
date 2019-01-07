package cargo.service;

import java.util.List;

import cargo.domain.BusinessType;

public interface IBusinessType {

	List<BusinessType> findAll();
}
