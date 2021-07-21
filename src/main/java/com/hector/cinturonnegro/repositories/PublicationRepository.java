package com.hector.cinturonnegro.repositories;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.Region;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicationRepository extends BaseRepository<Publication>{

    // Buscar publicaciones por titulo
    List<Publication> findByTitle(String title);
    // Buscar comunas por nombre de comuna
    List<Comuna> findByNameComunaContaining(String nameComuna);
    // Bucar regiones por nombre de region
        List<Region> findByNameRegionContaining(String nameRegion);
}
