package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.repositories.RegionRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegionService extends BaseService<Region>{
    private final RegionRepository regionRepository;

    public RegionService(RegionRepository regionRepository) {
        super(regionRepository);
        this.regionRepository = regionRepository;
    }
    public List<Region> regionList(String nameRegion) {
        return regionRepository.findByNameRegionContaining(nameRegion);
    }
}
