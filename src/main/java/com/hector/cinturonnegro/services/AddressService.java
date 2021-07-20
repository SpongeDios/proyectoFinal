package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Address;
import com.hector.cinturonnegro.models.Comuna;
import com.hector.cinturonnegro.models.Region;
import com.hector.cinturonnegro.models.User;
import com.hector.cinturonnegro.repositories.AddressRepository;
import com.hector.cinturonnegro.repositories.BaseRepository;
import com.hector.cinturonnegro.repositories.ComunaRepository;
import com.hector.cinturonnegro.repositories.RegionRepository;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class AddressService extends BaseService<Address>{
    private final AddressRepository addressRepository;
    private final ComunaRepository comunaRepository;
    private final RegionRepository regionRepository;

    public AddressService(AddressRepository addressRepository, ComunaRepository comunaRepository, RegionRepository regionRepository) {
        super(addressRepository);
        this.addressRepository = addressRepository;
        this.comunaRepository = comunaRepository;
        this.regionRepository = regionRepository;
    }


}
