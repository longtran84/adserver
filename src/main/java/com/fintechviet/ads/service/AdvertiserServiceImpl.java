package com.fintechviet.ads.service;

import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.repository.AdvertiserRepository;
import com.fintechviet.search.AdvertiserSpecification;
import com.fintechviet.search.SearchCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specifications;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvertiserServiceImpl implements AdvertiserService {
    @Autowired
    private AdvertiserRepository advertiserRepository;

    @Override
    public void save(Advertiser advertiser) {
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
    public List<Advertiser> search(Advertiser advertiser) {
        AdvertiserSpecification spec1 =
                new AdvertiserSpecification(new SearchCriteria("firstName", ":", "john"));
        AdvertiserSpecification spec2 =
                new AdvertiserSpecification(new SearchCriteria("lastName", ":", "doe"));

        return advertiserRepository.findAll(Specifications.where(spec1).and(spec2));
    }
}
