package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import web.model.Item;
import web.model.User;

import java.util.List;
@Transactional
public interface ItemRepository extends JpaRepository<Item, Integer> {

    List<Item> findAll();
    Item findById(Long id);


}
