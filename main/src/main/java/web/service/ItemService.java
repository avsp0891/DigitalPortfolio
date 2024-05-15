package web.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import web.model.Comment;
import web.model.Item;
import web.model.Likes;
import web.model.User;
import web.repository.CommentRepository;
import web.repository.ItemRepository;
import web.repository.LikesRepository;
import web.repository.UserRepository;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ItemService {

    private final ItemRepository repository;
    private final UserRepository userRepository;
    private final LikesRepository likesRepository;
    private final CommentRepository commentRepository;


    public List<Item> findAll() {
        return repository.findAll();
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


}
