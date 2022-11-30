package models;

import javax.persistence.*;

@Entity
@Table(name = "event_results")
public class EventResult {
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "event_id")
    private Event event;

    @Id
    @Column(name = "participant_id")
    private Integer participantId;

    @Column(name = "participant_place")
    private Integer participantPlace;

    public Integer getParticipantPlace() {
        return participantPlace;
    }

    public void setParticipantPlace(Integer participantPlace) {
        this.participantPlace = participantPlace;
    }

    public Integer getParticipantId() {
        return participantId;
    }

    public void setParticipantId(Integer participantId) {
        this.participantId = participantId;
    }

    public Event getEvent() {
        return event;
    }

    public void setEvent(Event event) {
        this.event = event;
    }
}