package innocence741.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import innocence741.model.CarRentalCompany;
import innocence741.model.CarRentalCompanyDAO;

@Transactional(rollbackFor = {Throwable.class})
public class CarRentalCompanyService {

	@Autowired
	private CarRentalCompanyDAO carRentalCompanyDAO;
	
	public boolean updateCarRentalCompany(CarRentalCompany cBean) {
		return carRentalCompanyDAO.updateCarRentalCompany(cBean);
	}

	
	public boolean updateCarRentalCompanyWithoutPic(CarRentalCompany cBean) {
		return carRentalCompanyDAO.updateCarRentalCompanyWithoutPic(cBean);
	}
	
	public CarRentalCompany getCarRentalCompanyBean(BigDecimal sn_rentalcompany) {
		return carRentalCompanyDAO.getCarRentalCompanyBean(sn_rentalcompany);
	}
	
	public boolean delCarRentalCompany(BigDecimal sn_rentalcompany) {
		return carRentalCompanyDAO.delCarRentalCompany(sn_rentalcompany);
	}
	
	public boolean createCarRentalCompany(CarRentalCompany carRentalCompany) {
		return carRentalCompanyDAO.createCarRentalCompany(carRentalCompany);
	}
}

