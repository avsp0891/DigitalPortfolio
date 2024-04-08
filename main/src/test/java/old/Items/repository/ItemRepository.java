package old.Items.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import old.Items.model.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {
}
