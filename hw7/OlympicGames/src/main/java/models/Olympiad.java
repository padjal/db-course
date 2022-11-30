package models;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Table(name = "olympiads")
public class Olympiad {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "olympiad_id", nullable = false)
    private Integer id;

    @Column(name = "year")
    private Integer year;

    @Column(name = "city", length = 20)
    private String city;

    @Column(name = "season", length = 1)
    private String season;

    @Column(name = "country", length = 3)
    private String country;

    @ManyToMany
    @JoinTable(name = "participation_olympiad",
            joinColumns = @JoinColumn(name = "olympiad_id"),
            inverseJoinColumns = @JoinColumn(name = "athlete_id"))
    private Set<Athlete> athletes = new LinkedHashSet<>();

    public Set<Athlete> getAthletes() {
        return athletes;
    }

    public void setAthletes(Set<Athlete> athletes) {
        this.athletes = athletes;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}