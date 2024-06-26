package web.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import web.model.*;
import web.repository.*;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService {

    private final ItemRepository repository;
    private final UserRepository userRepository;
    private final LikesRepository likesRepository;
    private final CommentRepository commentRepository;
    private final CatRepository catRepository;


    public List<Item> findAll() {
        List<Item> list = repository.findAll();
        list.sort(DateOfCreatedComparator);
//        return repository.findAll();
        return list;
    }


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
    @Transactional
    public void deleteById(Integer id, Principal principal) {
        Item item = findById(id);
        if (item.getUser().getId().equals(getUserByPrincipal(principal).getId())){
            for (Likes l: likesRepository.findAllByItemId(item.getId())){
                likesRepository.deleteById(l.getId());
            }
            for (Comment c: commentRepository.findAllByItemId(item.getId())){
                commentRepository.deleteById(c.getId());
            }
            repository.delete(item);
        }
    }

    public static Comparator<Item> DateOfCreatedComparator = (item1, item2) -> item2.getDateOfCreated().compareTo(item1.getDateOfCreated());


}
