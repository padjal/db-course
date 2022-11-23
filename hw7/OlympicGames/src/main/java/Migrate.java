

public class Migrate {
    public static void main(String[] args) {
        Flyway flyway = new Flyway();
        flyway.setDataSource("jdbc:postgresql://localhost:5433/recipes", "postgres", "postgres");
        flyway.migrate();
    }
}
