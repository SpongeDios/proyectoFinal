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
@Table( name = "users", uniqueConstraints = @UniqueConstraint( columnNames = "email" ) )//Hola holaa
public class User extends BaseModel{
    //NOMBRE
    @NotNull
    @NotBlank( message = "Must have a First Name")
    @Size( min = 2, max = 20, message = "Enter a Name between 2 and 20 characters" )
    private String firstname;
    //APELLIDO
    @NotNull
    @NotBlank( message = "Must have a Last Name")
    @Size( min = 2, max = 20, message = "Enter a Last Name between 2 and 20 characters" )
    private String lastname;
    //FOTO USUARIO
    private String photo;
    //TELEFONO
    @NotNull
    @NotBlank( message = "Must have a Phone Number" )
    @Size( min = 12 )
    private String phone;
    //EMAIL
    @NotNull
    @Column( unique = true )
    @Email( message = "Email must be valid" )
    private String email;
    //PASSWORD
    @NotNull
    @Size( min = 8, message = "Password must be greater than 8 characters" )
    private String password;
    //PASSWORD CONFIRMATION
    @Transient
    private String passwordConfirmation;
    //REGION
    @NotNull
    private String region;
    //COMUNA
    @NotNull
    private String comuna;
    //ROL
    @Min( 1 )
    private int rol;


}
