package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import web.model.User;

@Transactional
public interface UserRepository extends JpaRepository<User, Integer> {
    User findByEmail(String email);


}
