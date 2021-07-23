package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "comunas" )
public class Comuna extends BaseModel{
    @NotNull
    @Size(min = 3, max = 45)
    private String nameComuna;

    ///////////////RELACION CON REGIONES//////////////
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "region")
    private Region region;

    ///////////////RELACION CON DIRECCION////////////////
    @OneToMany(mappedBy = "comuna", fetch = FetchType.LAZY)
    private List<Address> userAddress;
}
