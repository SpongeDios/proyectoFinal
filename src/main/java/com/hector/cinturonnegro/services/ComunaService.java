package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.repositories.ComunaRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComunaService extends BaseService<Comuna>{
    private final ComunaRepository comunaRepository;

    public ComunaService(ComunaRepository comunaRepository) {
        super(comunaRepository);
        this.comunaRepository = comunaRepository;
    }
//    public List<Comuna> comunaList(String nameComuna) {
//        return comunaRepository.findByNameComunaContaining(nameComuna);
//    }
}
