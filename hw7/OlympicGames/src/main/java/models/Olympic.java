package models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "olympics")
public class Olympic {

    @Id
    @Column(name = "olympic_id")
    private String id;

    @ManyToOne
    @JoinColumn(name = "country_id",
    foreignKey = @ForeignKey(name = "country_id"))
    private Country country;

    @Column(name = "city")
    private String city;

    @Column(name = "year")
    private int year;

    @Column(name = "startdate")
    private Date startDate;

    @Column(name = "enddate")
    private Date endDate;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "Olympic{" +
                "id='" + id + '\'' +
                ", countryId='" + country + '\'' +
                ", city='" + city + '\'' +
                ", year=" + year +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                '}';
    }
}
