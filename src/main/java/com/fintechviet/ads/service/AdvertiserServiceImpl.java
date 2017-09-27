package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.model.Role;
import com.fintechviet.ads.model.User;
import com.fintechviet.ads.repository.AdvertiserRepository;
import com.fintechviet.ads.repository.RoleRepository;
import com.fintechviet.ads.repository.UserRepository;
import com.fintechviet.search.AdvertiserSpecification;
import com.fintechviet.search.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {
    @Autowired
    private AdvertiserRepository advertiserRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private Md5PasswordEncoder md5PasswordEncoder;

    private static String DEFAULT_PASSWORD = "12345678";

    @Override
    public void save(Advertiser advertiser) {
		if (advertiser.getId() == null) {
			User user = new User();
			user.setUsername(advertiser.getEmail());
			user.setPassword(md5PasswordEncoder.encodePassword(DEFAULT_PASSWORD, null));
			user.setRoles(new HashSet<Role>() {
				{
					add(roleRepository.findOne(2l));
				}
			});

			userRepository.save(user);
		}

        advertiserRepository.save(advertiser);
    }

    @Override
    public void delete(Advertiser advertiser) {
        advertiserRepository.delete(advertiser);
    }

    @Override
    public Advertiser findByEmail(String email) {
        return advertiserRepository.findByEmail(email);
    }

    @Override
    public List<Advertiser> getAllAdvertisers() {
        return advertiserRepository.findAll();
    }

    @Override
    public List<Advertiser> getAdvertiserByEmail(String email) {
        List<Advertiser> ads = new ArrayList<Advertiser>();
        ads.add(advertiserRepository.findByEmail(email));
        return ads;
    }

    @Override
    public List<Advertiser> search(Advertiser advertiser) {
        AdvertiserSpecification spec1 =
                new AdvertiserSpecification(new SearchCriteria("firstName", ":", "john"));
        AdvertiserSpecification spec2 =
                new AdvertiserSpecification(new SearchCriteria("lastName", ":", "doe"));

        return advertiserRepository.findAll(Specifications.where(spec1).and(spec2));
    }

	@Override
	public void approveAdvertisers(Long id, boolean approved) {
		String status = approved ? "ACTIVE": "INACTIVE";
		advertiserRepository.approveAdvertiser(status, id);
		
	}

    @Override
    public void update(Advertiser advertiser) {
        advertiserRepository.save(advertiser);
    }
    
}
