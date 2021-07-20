package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.*;
import java.util.List;

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
    private String firstName;
    //APELLIDO
    @NotNull
    @NotBlank( message = "Must have a Last Name")
    @Size( min = 2, max = 20, message = "Enter a Last Name between 2 and 20 characters" )
    private String lastName;
    //FOTO
    private String photo;
    //TELEFONO
    @NotNull
    @NotBlank( message = "Must have a Phone Number" )
    @Size( min = 12, message = "The Phone Number must have 12 characters")
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
//    //REGION
//    @NotNull
//    private String region;
//    //COMUNA
//    @NotNull
//    private String comuna;
    //ROL
    @NotNull
    @Min( 1 )
    private int rol;

    ///////////RELACIONES/////////////

    //RELACION CON PUBLICATION
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Publication> publications;

    //RELACION CON FEEDBACK
    @OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
    private List<Feedback> feedbacks;

    //SELF-JOIN CON MESSAGES
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "messages",
            joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "receptor_id")
    )
    private List<User> receptor;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "messages",
            joinColumns = @JoinColumn(name = "receptor_id"),
            inverseJoinColumns = @JoinColumn(name = "user_id")
    )
    private List<User> userSender;




}
