package com.hector.cinturonnegro.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;
import java.util.List;

@NoRepositoryBean
public interface BaseRepository<T> extends CrudRepository<T, Long> {
    List<T> findAll();
}