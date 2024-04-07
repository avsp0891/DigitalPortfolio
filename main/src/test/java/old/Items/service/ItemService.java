package old.Items.service;



import org.springframework.web.multipart.MultipartFile;
import old.Items.dto.ItemDto;
import old.Items.model.Item;

public interface ItemService {


    ItemDto findById(Integer userId, Integer id);

    ItemDto add(Integer userId, MultipartFile photoFile, String itemDto);

    ItemDto deleteById(Integer userId, Integer id);

    Item findOrException(Integer id);
}
