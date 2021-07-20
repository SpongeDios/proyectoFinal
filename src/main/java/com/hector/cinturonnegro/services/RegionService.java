package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.repositories.BaseRepository;
import com.hector.cinturonnegro.repositories.RegionRepository;
import org.springframework.stereotype.Service;

@Service
public class RegionService extends BaseService<Region>{
    private final RegionRepository regionRepository;

    public RegionService(RegionRepository regionRepository) {
        super(regionRepository);
        this.regionRepository = regionRepository;
    }
}
