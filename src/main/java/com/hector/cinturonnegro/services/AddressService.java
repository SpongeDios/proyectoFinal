package com.hector.cinturonnegro.services;

import com.hector.cinturonnegro.models.Address;
import com.hector.cinturonnegro.repositories.AddressRepository;
import com.hector.cinturonnegro.repositories.BaseRepository;
import org.springframework.stereotype.Service;

@Service
public class AddressService extends BaseService<Address>{
    private final AddressRepository addressRepository;

    public AddressService(AddressRepository addressRepository) {
        super(addressRepository);
        this.addressRepository = addressRepository;
    }
}
