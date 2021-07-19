package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

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
    //FOTO DE LA PUBLICACION
    @NotNull
    @NotBlank
    private String photo_publication;
    //TIPO  DE PUBLICACION
    @NotNull
    @NotBlank
    private Integer type_publication;

}
