package cargo.service;

import java.util.List;

import cargo.domain.LogicalWarehouse;

public interface ILogicalWarehouse {

	public List<LogicalWarehouse> findAll();
}
