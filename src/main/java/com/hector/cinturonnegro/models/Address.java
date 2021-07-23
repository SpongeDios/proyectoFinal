package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "addresses" )
public class Address extends BaseModel{
    @Max(45)
    @NotNull
    @NotBlank(message = "Debe tener una Dirección")
    private String nameCalle;

    ///////////////RELACION CON USUARIOS/////////////////
    @OneToMany(mappedBy = "address", fetch = FetchType.LAZY)
    private List<User> userAddress;

    public void addUser(User user){
        this.userAddress.add(user);
    }

    ///////////////RELACION CON COMUNAS///////////////////
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "comuna")
    private Comuna comuna;

    public Address(String calle, Comuna comuna){
        this.nameCalle = calle;
        this.comuna = comuna;
    }

    /////////////RELACION CON PUBLICACION///////////////////
    @OneToMany(mappedBy = "address", fetch = FetchType.LAZY)
    private List<Publication> publications;

}
