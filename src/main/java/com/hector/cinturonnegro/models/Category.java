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
@Table( name = "categories" )
public class Category extends BaseModel{
    //NOMBRE DE LA CATEGORIA
    @NotNull
    @NotBlank( message = "Must have a Name" )
    @Size( min = 5, max = 25, message = "Enter a Name between 5 to 25 characters" )
    private String name;
}
