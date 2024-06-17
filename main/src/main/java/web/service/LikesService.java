package web.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import web.model.Comment;
import web.model.Item;
import web.model.Likes;
import web.model.User;
import web.repository.CommentRepository;
import web.repository.LikesRepository;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class LikesService {

    private final LikesRepository repository;
    private final UserService userService;

    public List<Likes> findAllByItemId(Integer itemId) {
        return repository.findAllByItemId(itemId);
    }

    public int add(Principal principal, Item item) {
        User user = userService.getUserByPrincipal(principal);
        if (!likeIsExist(user.getId(), item.getId())){
            Likes likes = new Likes();
            likes.setItemId(item.getId());
            likes.setOwnerId(user.getId());
            repository.save(likes);
        }
        return repository.findAllByItemId(item.getId()).size();
    }


    private boolean likeIsExist(int userId, int itemId){
        for (Likes l: findAllByItemId(itemId)){
            if (l.getOwnerId() == userId && l.getItemId()== itemId){
                return true;
            }
        }
        return false;
    }

}
