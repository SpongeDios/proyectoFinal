package com.hector.cinturonnegro.models;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "messages" )
public class Message extends BaseModel{
    //MENSAJE
    @NotNull
    @NotBlank( message = "El mensaje debe contener texto" )
    @Size( min = 5, max = 255, message = "Ingresa un mensaje entre 5 a 255 caracteres" )
    private String text;

    //RELACION CON USER
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receptor")
    private User receptor;

}
