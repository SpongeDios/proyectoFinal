package com.hector.cinturonnegro.repositories;

import com.hector.cinturonnegro.models.Comuna;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComunaRepository extends BaseRepository<Comuna>{

//    //Buscar comunas por nombre
//    List<Comuna> findByNameComunaContaining(String nameComuna);
}
