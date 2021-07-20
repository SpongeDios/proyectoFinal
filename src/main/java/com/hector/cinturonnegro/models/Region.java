package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "regiones" )
public class Region extends BaseModel{
    @NotNull
    private String nameRegion;

    ///////////RELACION CON COMUNAS////////////////
    @OneToMany(mappedBy = "region", fetch = FetchType.LAZY)
    private List<Comuna> comunas;
}
