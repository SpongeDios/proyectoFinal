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
        return publicationRepository.findByTitle(title);
    }
    public List<Comuna> comunaList(String nameComuna) {
        return publicationRepository.findByNameComunaContaining(nameComuna);
    }
    public List<Region> regionList(String nameRegion) {
        return publicationRepository.findByNameRegionContaining(nameRegion);
    }
}