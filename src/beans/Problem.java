/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package beans;
import com.google.appengine.api.datastore.Blob;
import com.googlecode.objectify.annotation.*;
/**
 *
 * @author Kent
 */
@Entity
@Index // Active l'indexation par défaut
@Cache
public class Problem {
	@Id Long id;
    private String sujet;
	@Unindex private String details; //ne sera pas indexé
    private String categorie;
    private String email;
    private String nom;
    private String telephone;
    private String lat;
    private String lng;
    private String dateProblem;
    private String urlImage;
    Blob image;
    
    public Blob getImage() {
        return image;
    }

    public void setImage(Blob image) {
        this.image = image;
    }

   

    public String getUrlImage() {
        return urlImage;
    }

    public void setUrlImage(String urlImage) {
        this.urlImage = urlImage;
    }

    public Problem() {} // Constructeur vide obligatoire pour Objectify
    
    public String getDateProblem() {
        return dateProblem;
    }

    public void setDateProblem(String dateProblem) {
        this.dateProblem = dateProblem;
    }
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    
    public String getLat() {
        return lat;
    }

    public void setLat(String lat) {
        this.lat = lat;
    }

    public String getLng() {
        return lng;
    }

    public void setLng(String lng) {
        this.lng = lng;
    }

    
    /**
     * @return the sujet
     */
    public String getSujet() {
        return sujet;
    }

    /**
     * @param sujet the sujet to set
     */
    public void setSujet(String sujet) {
        this.sujet = sujet;
    }

    /**
     * @return the details
     */
    public String getDetails() {
        return details;
    }

    /**
     * @param details the details to set
     */
    public void setDetails(String details) {
        this.details = details;
    }

    /**
     * @return the categorie
     */
    public String getCategorie() {
        return categorie;
    }

    /**
     * @param categorie the categorie to set
     */
    public void setCategorie(String categorie) {
        this.categorie = categorie;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }

    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    
}
