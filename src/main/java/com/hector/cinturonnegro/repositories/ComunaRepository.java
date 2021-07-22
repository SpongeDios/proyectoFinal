package com.hector.cinturonnegro.repositories;

import com.hector.cinturonnegro.models.Comuna;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComunaRepository extends BaseRepository<Comuna>{

        //Busca comunas por nombre de comunas
    List<Comuna> findByNameComunaContaining(String nameComuna);
    List<Comuna> findAllByRegionId(Long id);

}
