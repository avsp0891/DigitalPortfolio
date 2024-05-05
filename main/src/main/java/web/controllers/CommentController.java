package web.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import web.model.Comment;
import web.repository.CommentRepository;

import java.util.List;

@RestController
@RequiredArgsConstructor
public class CommentController {
    private final CommentRepository commentRepository;

    @GetMapping("/comments/{itemId}")
    private ResponseEntity<?> getCommentsByItemId(@PathVariable Integer itemId) {
        List<Comment> comments = commentRepository.findAllByItemId(itemId);
        return ResponseEntity.ok()
                .body(comments);
    }

}
