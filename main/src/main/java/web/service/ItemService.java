package web.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import web.model.Item;
import web.model.User;
import web.repository.ItemRepository;
import web.repository.UserRepository;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService {

    private final ItemRepository repository;
    private final UserRepository userRepository;


    public List<Item> findAll() {
        return repository.findAll();
    }

//    public List<Item> findByOwnerId(Integer ownerId) {
//        return repository.findByOwnerId(ownerId);
//    }

    public Item findById(Integer id) {
        return repository.findById(id).orElse(null);
    }

    public Item add(Principal principal, Item item, MultipartFile image) {
        item.setUser(getUserByPrincipal(principal));
        item.setName(image.getName());
        item.setOriginalFileName(image.getOriginalFilename());
        item.setSize(image.getSize());
        item.setContentType(image.getContentType());
        try {
            item.setBytes(image.getBytes());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return repository.save(item);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) {
            return new User();
        }
        return userRepository.findByEmail(principal.getName());
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }


}
