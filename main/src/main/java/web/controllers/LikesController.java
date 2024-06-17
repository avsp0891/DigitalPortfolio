package web.controllers;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import web.model.Likes;
import web.repository.LikesRepository;
import web.service.ItemService;
import web.service.LikesService;

import java.security.Principal;
import java.util.List;

@RestController
@RequiredArgsConstructor
public class LikesController {

    private final LikesRepository repository;

    private final LikesService likesService;

    private final ItemService itemService;

    @GetMapping("/likes/{id}")
    private Like getImageById(@PathVariable Integer id) {
        List<Likes> likes = repository.findAllByItemId(id);
        return new Like(likes.size());
    }

//    @PostMapping("/items/{itemId}/likes/add")
//    public String addLike(@PathVariable Integer itemId, Principal principal) {
//        int newLikesCount = likesService.add(principal, itemService.findById(itemId));
//        return "{\"likesCount\":" + newLikesCount + "}";
//    }

    @AllArgsConstructor
    @Data
    private static class Like{
        private int likes;
    }

}
