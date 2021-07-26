package com.hector.cinturonnegro.models;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

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

    @Min(1)
    private int rol;

    //RELACION CON USER
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "receptor")
    private User receptor;

    //RELACION CON PUBLICATION
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "publication")
    private Publication publication;

    //RELACION SELF JOIN PARA RESPUESTAS  (Responde Publicaciones)
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "message_id")
    private Message message;

    @OneToMany(mappedBy = "message", fetch = FetchType.LAZY)
    private List<Message> respuestas;

    public void addRespuesta(Message respuesta){
        this.respuestas.add(respuesta);
    }



}
