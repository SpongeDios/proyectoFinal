package com.hector.cinturonnegro.repositories;

import com.hector.cinturonnegro.models.Publication;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PublicationRepository extends BaseRepository<Publication>{

    // Buscar publicaciones por titulo
    List<Publication> findByTitle(String title);

}
