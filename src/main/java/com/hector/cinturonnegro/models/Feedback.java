package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "feedbacks" )
public class Feedback extends BaseModel{
    //PUNTUACION
    @NotNull
    @Min(1)
    @Max(5)
    private Integer rating;
    //COMENTARIO
    @NotNull
    @NotBlank( message = "Must have a Comment" )
    @Size( min = 5, max = 255, message = "Enter a Comment between 5 to 255" )
    private String comment;
    //FOTO RETROALIMENTACION
    private String photo_feedback;

    //RELACION CON USER
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user")
    private User user;

    //RELACION CON PUBLICATION
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "publication")
    private Publication publication;

}
