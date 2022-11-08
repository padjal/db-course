import models.Country;
import models.Event;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;
import javax.transaction.UserTransaction;
import java.io.Console;
import java.util.Iterator;
import java.util.List;

public class Main {
    private static SessionFactory factory;

    private static StandardServiceRegistry standardServiceRegistry;

    public static void main(String[] args) {
        StandardServiceRegistry standardServiceRegistry=new StandardServiceRegistryBuilder()
                .configure("hibernate.cfg.xml")
                .build();
        Metadata meta=new MetadataSources(standardServiceRegistry).getMetadataBuilder().build();

        SessionFactory factory=meta.getSessionFactoryBuilder().build();
        Session session=factory.openSession();

        TypedQuery query=session.createQuery("from Event");
        List<Event> list=query.getResultList();

//        for (var event :
//                list) {
//            System.out.println(event);
//        }

        var events = list.toArray();
        System.out.println(events[0]);
    }
}
