import org.hibernate.SessionFactory;
import org.hibernate.boot.Metadata;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class InitHibernate {
    public static StandardServiceRegistry standardServiceRegistry;
    public static Metadata metadata;
    public static SessionFactory factory;

    static {
        standardServiceRegistry=new StandardServiceRegistryBuilder()
                .configure("hibernate.cfg.xml")
                .build();

        metadata=new MetadataSources(standardServiceRegistry).getMetadataBuilder().build();

        factory = metadata.getSessionFactoryBuilder().build();
    }
}
