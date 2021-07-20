package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "comunas" )
public class Comuna extends BaseModel{
    @NotNull
    private String name_comuna;

    ///////////////RELACION CON REGIONES//////////////
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "region")
    private Region region;

    ///////////////RELACION CON DIRECCION////////////////
    @OneToOne(mappedBy="comuna", cascade=CascadeType.ALL, fetch= FetchType.LAZY)
    private Address address;
}
