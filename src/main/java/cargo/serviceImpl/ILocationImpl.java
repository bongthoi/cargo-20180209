package cargo.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cargo.domain.Location;
import cargo.repository.LocationRepository;
import cargo.service.ILocation;

@Service
public class ILocationImpl  implements ILocation{

	@Autowired
	private LocationRepository locationRepository;
	
	@Override
	public List<Location> findAll() {
		// TODO Auto-generated method stub
		return locationRepository.findAll();
	}

}
