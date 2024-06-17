package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import web.model.Cat;
import web.model.User;

import java.util.List;

@Transactional
public interface CatRepository extends JpaRepository<Cat, Integer> {

    List<Cat> findAllByUserId(Integer userId);
}
