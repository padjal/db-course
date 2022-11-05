package models;


import org.hibernate.annotations.Target;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "events")
public class Event {

    @Id
    @Column(name = "event_id")
    private String id;

    @Column(name = "name")
    private String name;

    @Column(name = "eventtype")
    private String eventType;

    @Column(name = "olympic_id")
    private String olympicId;

    @Column(name = "is_team_event")
    private boolean isTeamEvent;

    @Column(name = "num_players_in_team")
    private int numPlayersInTeam;

    @Column(name = "result_noted_in")
    private String resultNotedIn;

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

    public String getEventType() {
        return eventType;
    }

    public void setEventType(String eventType) {
        this.eventType = eventType;
    }

    public String getOlympicId() {
        return olympicId;
    }

    public void setOlympicId(String olympicId) {
        this.olympicId = olympicId;
    }

    public boolean isTeamEvent() {
        return isTeamEvent;
    }

    public void setTeamEvent(boolean teamEvent) {
        isTeamEvent = teamEvent;
    }

    public int getNumPlayersInTeam() {
        return numPlayersInTeam;
    }

    public void setNumPlayersInTeam(int numPlayersInTeam) {
        this.numPlayersInTeam = numPlayersInTeam;
    }

    public String getResultNotedIn() {
        return resultNotedIn;
    }

    public void setResultNotedIn(String resultNotedIn) {
        this.resultNotedIn = resultNotedIn;
    }
}
