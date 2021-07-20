package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Publication;
import com.hector.cinturonnegro.repositories.BaseRepository;
import com.hector.cinturonnegro.repositories.PublicationRepository;
import org.springframework.stereotype.Service;

@Service
public class PublicationService extends BaseService<Publication>{
    private final PublicationRepository publicationRepository;

    public PublicationService(PublicationRepository publicationRepository) {
        super(publicationRepository);
        this.publicationRepository = publicationRepository;
    }
}