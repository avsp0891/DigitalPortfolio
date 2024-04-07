package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import web.model.Item;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Integer> {

    List<Item> findAll();
    Item findById(Long id);

//    List<Item> findByOwnerId(Integer ownerId);

}
