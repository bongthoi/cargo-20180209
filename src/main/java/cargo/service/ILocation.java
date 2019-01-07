package cargo.service;

import java.util.List;

import cargo.domain.Location;

public interface ILocation {

	List<Location> findAll();
}
