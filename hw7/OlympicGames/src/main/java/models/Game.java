package models;

import javax.persistence.*;

@Entity
@Table(name = "games")
public class Game {
    @Id
    @Column(name = "game_id", nullable = false)
    private Integer gameId;

    @Column(name = "type_of_athletes", length = 50)
    private String typeOfAthletes;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "event_id")
    private Event event;

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }

    public String getTypeOfAthletes() {
        return typeOfAthletes;
    }

    public void setTypeOfAthletes(String typeOfAthletes) {
        this.typeOfAthletes = typeOfAthletes;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }
}