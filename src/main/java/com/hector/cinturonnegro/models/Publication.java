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
@Table( name = "publications" )
public class Publication extends BaseModel{
    //TITULO
    @NotNull
    @NotBlank( message = "Must have a Title")
    @Size( min = 5, max = 25, message = "Enter a Title between 5 to 25 characters" )
    private String title;
    //DESCRIPCION
    @NotNull
    @NotBlank( message = "Must have a Description")
    @Size( min = 5, max = 255, message = "Enter a Description between 5 to 255 characters" )
    private String description;
    //PRECIO
    @NotNull
    @NotBlank
    private Integer price;
    //FOTO PUBLICACION
    @NotNull
    @NotBlank
    private String photo_publication;
    //TIPO DE PUBLICACION
    @NotNull
    @NotBlank
    private Integer type_publication;

    ///////////////RELACIONES///////////////

    //RELACION CON USER
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user")
    private User user;

    //RELACION CON FEEDBACK
    @OneToMany(mappedBy = "publication", fetch = FetchType.LAZY)
    private List<Feedback> feedback;

    //RELACION CON CATEGORY
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "category")
    private Category category;

}
