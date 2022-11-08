package models;

import org.hibernate.annotations.Type;

import javax.persistence.*;

@Entity
@Table(name = "results")
public class Result {
    @Id
    @Column(name = "event_id")
    private String id;

    @ManyToOne
//    @JoinColumn(name = "player_id",
//    foreignKey = @ForeignKey(name = "player_id"))
//    @Type(type = "models.Player")
    private Player player;

    @Column(name = "medal")
    private String medal;

    @Column(name = "result")
    private double result;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Player getPlayerId() {
        return player;
    }

    public void setPlayerId(Player player) {
        this.player = player;
    }

    public String getMedal() {
        return medal;
    }

    public void setMedal(String medal) {
        this.medal = medal;
    }

    public double getResult() {
        return result;
    }

    public void setResult(double result) {
        this.result = result;
    }
}
