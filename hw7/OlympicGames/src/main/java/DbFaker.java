import com.github.javafaker.Faker;
import models.Athlete;
import models.Olympiad;
import models.Team;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import java.util.*;

public class DbFaker {
    private static Faker faker;
    private static List<Team> teams;

    static{
        faker = new Faker();
    }

    public static void main(String[] args) {
        teams = createTeams(25);

        persistCollection(teams);

        // Create athletes
        var athletes = createAthletes(100);
        var olympiads = createOlympiads(5);

        persistCollection(athletes);
        persistCollection(olympiads);
    }

    private static List<Athlete> createAthletes(int numberOfAthletes){
        Random rand = new Random();
        List<Athlete> athletes = new ArrayList<>();

        for (int i = 0; i<numberOfAthletes; i++){
            var newAthlete = new Athlete();
            newAthlete.setName(faker.name().fullName());
            newAthlete.setId(faker.number().numberBetween(100000, 999999));
            newAthlete.setBirthdate(faker.date().birthday());
            newAthlete.setCountry(faker.country().countryCode3());
            newAthlete.setGender((faker.number().numberBetween(0, 2) % 2 == 0 ? "M" : "F"));

            // Team
            if(i % 5 != 0){
                newAthlete.setTeamId(teams.get(rand.nextInt(teams.size())).getId());
            }

            newAthlete.setOlympicCertId(faker.number().randomDigit());

            athletes.add(newAthlete);
        }

        return athletes;
    }

    private static List<Team> createTeams(int numberOfTeams){
        List<Team> teams = new ArrayList<>();

        for (int i = 0; i < numberOfTeams; i++){
            var newTeam = new Team();

            newTeam.setName(faker.esports().team());
            newTeam.setSport(faker.esports().game());
            newTeam.setId(faker.number().numberBetween(100000, 999999));
            newTeam.setCountry(faker.country().countryCode3());

            teams.add(newTeam);
        }

        return teams;
    }

    private static List<Olympiad> createOlympiads(int numberOfOlympiads){
        List<Olympiad> olympiads = new ArrayList<>();
        var seasons = Arrays.stream(new String[] {"spring", "summer", "autumn", "winter"}).toList();

        for (int i = 0; i < numberOfOlympiads; i++){
            var newOlympiad = new Olympiad();

            newOlympiad.setCity(faker.address().city());
            newOlympiad.setSeason(seasons.get(faker.number().numberBetween(0, 4)));
            newOlympiad.setId(faker.number().numberBetween(100000, 999999));
            newOlympiad.setYear(faker.date().birthday().getYear());
            newOlympiad.setCountry(faker.country().countryCode3());

            olympiads.add(newOlympiad);
        }

        return olympiads;
    }

    private static <T> void persistCollection(List<T> collection) {
        for (var item :
                collection) {
            Session session = InitHibernate.factory.openSession();
            session.beginTransaction();
            session.save(item);
            session.getTransaction().commit();
            session.close();
        }
    }
}
