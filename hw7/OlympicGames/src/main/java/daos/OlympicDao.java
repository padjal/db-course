package daos;

import models.Olympic;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;
import java.util.Optional;

public class OlympicDao implements Dao<Olympic>{
    Session currentSession;

    Transaction currentTransaction;

    @Override
    public Optional<Olympic> get(long id) {
        return Optional.empty();
    }

    @Override
    public List<Olympic> getAll() {
        return null;
    }

    @Override
    public void save(Olympic olympic) {

    }

    @Override
    public void update(Olympic olympic, String[] params) {

    }

    @Override
    public void delete(Olympic olympic) {

    }
}
