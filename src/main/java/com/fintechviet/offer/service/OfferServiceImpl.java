package com.fintechviet.offer.service;

import com.fintechviet.offer.model.OffersEntity;
import com.fintechviet.offer.repository.OfferRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by tungn on 8/4/2017.
 */
@Service
public class OfferServiceImpl implements OfferService {
    @Autowired
    private OfferRepository offerRepository;
    @Override
    public void save(OffersEntity offer) {
        offerRepository.save(offer);
    }
}
