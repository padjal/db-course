package models;


import org.hibernate.annotations.Type;

import javax.persistence.*;

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

    @ManyToOne
    @JoinColumn(name = "olympic_id",
    foreignKey = @ForeignKey(name = "olympic_id"))
    private Olympic olympic;

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

    public Olympic getOlympic() {
        return olympic;
    }

    public void setOlympic(Olympic olympic) {
        this.olympic = olympic;
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

    @Override
    public String toString() {
        return "Event{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", eventType='" + eventType + '\'' +
                ", olympic=" + olympic +
                ", isTeamEvent=" + isTeamEvent +
                ", numPlayersInTeam=" + numPlayersInTeam +
                ", resultNotedIn='" + resultNotedIn + '\'' +
                '}';
    }
}
