package web.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import web.model.Comment;
import web.model.Item;
import web.repository.CommentRepository;
import web.repository.ItemRepository;

import java.io.ByteArrayInputStream;
import java.security.Principal;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class CommentController {
    private final CommentRepository commentRepository;

    @GetMapping("/comments/{itemId}")
    private ResponseEntity<?> getCommentsByItemId(@PathVariable Integer itemId){
        List<Comment> comments = commentRepository.findAllByItemId(itemId);
        return ResponseEntity.ok()
                .body(comments);
    }

}
