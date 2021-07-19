package com.hector.cinturonnegro.models;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table( name = "feedbacks" )
public class Feedback extends BaseModel{
    @NotNull
    @Min(1)
    @Max(5)
    private Integer rating;
    @NotNull
    @NotBlank( message = "Must have a Comment" )
    @Size( min = 5, max = 255, message = "Enter a Comment between 5 to 255" )
    private String comment;
    private String photo_feedback;

}
