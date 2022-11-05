package models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "countries")
public class Country {

    @Id
    @Column(name = "country_id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name="area_sqkm")
    private int areaSqKm;

    @Column(name="population")
    private int population;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAreaSqKm() {
        return areaSqKm;
    }

    public void setAreaSqKm(int areaSqKm) {
        this.areaSqKm = areaSqKm;
    }

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    @Override
    public String toString() {
        return "Country{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", areaSqKm=" + areaSqKm +
                ", population=" + population +
                '}';
    }
}
