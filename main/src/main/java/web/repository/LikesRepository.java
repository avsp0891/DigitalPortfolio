package web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import web.model.Item;
import web.model.Likes;

import java.util.List;

public interface LikesRepository extends JpaRepository<Likes, Integer> {

    List<Likes> findAll();

    List<Likes> findAllByItemId(Integer id);


}
