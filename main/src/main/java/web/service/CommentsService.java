package web.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import web.model.Comment;
import web.model.Item;
import web.model.User;
import web.repository.CommentRepository;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class CommentsService {

    public static String formatDateTime(LocalDateTime dateTime) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy HH:mm:ss");
        return dateTime.format(formatter);
    }

    private final CommentRepository repository;
    private final UserService userService;

    public List<Comment> findAllByItemId(Integer itemId) {
        List<Comment> result = repository.findAllByItemId(itemId);
        for (Comment comment: result){
            comment.setDateOfCreatedToString(formatDateTime(comment.getDateOfCreated()));
        }
        return result;
    }

    public Comment add(Principal principal, Comment comment, Item item) {
        User user = userService.getUserByPrincipal(principal);
        comment.setItem(item);
        comment.setUser(user);
        return repository.save(comment);
    }

}
