package com.hector.cinturonnegro.repositories;

import com.hector.cinturonnegro.models.Region;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RegionRepository extends BaseRepository<Region>{

    //Buscar regiones por nombre
    List<Region> findByNameRegionContaining(String nameRegion);

}
