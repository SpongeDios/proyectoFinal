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
    @NotBlank( message = "Must have a Text" )
    @Size( min = 5, max = 255, message = "Enter a Message between 5 to 255 characters" )
    private String text;

    //RELACION CON USER
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receptor_id")
    private User receptor;

}
