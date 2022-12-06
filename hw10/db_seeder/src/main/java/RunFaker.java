import com.github.javafaker.Faker;

import java.sql.*;
import java.util.Properties;

public class RunFaker {
    public final static int OBJECTS_NUM = 15000;

    public static void main(String[] args) {
        Faker faker = new Faker();

        try {
            String url = "jdbc:postgresql://localhost:5432/books?user=root&password=root";
            Connection conn = DriverManager.getConnection(url);

            for (int i = 0; i < OBJECTS_NUM; i++) {
                // Create objects and send to db
                CustomObject co = new CustomObject();
                co.setRowNum(i);
                co.setObjectName(faker.backToTheFuture().quote().replaceAll("\'", "\'\'"));
                co.setObjectType(faker.app().name().replaceAll("\'", "\'\'"));
                co.setOwner(faker.name().fullName().replaceAll("\'", "\'\'"));

                var test = "insert into all_objects(rownum, object_name, object_type, owner) VALUES (" +
                        co.getRowNum() + ", \'" + co.getObjectName() + "\', \'" + co.getObjectType() + "\', \'" + co.getOwner() +"\');";
                Statement st = conn.createStatement();
                st.execute("insert into all_objects(rownum, object_name, object_type, owner) VALUES (" +
                        co.getRowNum() + ", \'" + co.getObjectName() + "\', \'" + co.getObjectType() + "\', \'" + co.getOwner() +"\');");
                st.close();
            }

            conn.close();
        } catch (SQLException sqlException) {
            System.out.println("Problem reaching the database. Check connection info.");
        }

    }
}
