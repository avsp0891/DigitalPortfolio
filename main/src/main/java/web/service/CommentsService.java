package web.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import web.model.Comment;
import web.model.Item;
import web.model.User;
import web.repository.CommentRepository;

import java.security.Principal;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CommentsService {

    private final CommentRepository repository;
    private final UserService userService;

    public List<Comment> findAllByItemId(Integer itemId) {
        return repository.findAllByItemId(itemId);
    }

    public Comment add(Principal principal, Comment comment, Item item) {
        User user = userService.getUserByPrincipal(principal);
        comment.setItem(item);
        comment.setUser(user);
        return repository.save(comment);
    }

}
