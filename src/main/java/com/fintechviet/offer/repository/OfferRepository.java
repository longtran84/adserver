package com.fintechviet.offer.repository;

import com.fintechviet.offer.model.OffersEntity;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by tungn on 8/4/2017.
 */
public interface OfferRepository extends JpaRepository<OffersEntity, Long> {
}
