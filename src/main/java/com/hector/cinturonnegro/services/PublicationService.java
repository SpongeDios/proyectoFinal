package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.repositories.PublicationRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublicationService extends BaseService<Publication>{
    private final PublicationRepository publicationRepository;

    public PublicationService(PublicationRepository publicationRepository) {
        super(publicationRepository);
        this.publicationRepository = publicationRepository;
    }

    public List<Publication> publicationList(String title) {
        return publicationRepository.findByTitleContaining(title);
    }

    public List<Publication> ouroHenrry(String query){
        return publicationRepository.findByRegionContaining(query);
    }

    public List<Publication> publicacionesPorComuna(String query){
        return publicationRepository.findByComunaContaining(query);
    }



}