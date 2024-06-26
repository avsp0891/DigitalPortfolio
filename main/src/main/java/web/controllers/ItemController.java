package web.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import web.model.Comment;
import web.model.Item;
import web.model.User;
import web.service.CommentsService;
import web.service.ItemService;
import web.service.LikesService;
import web.service.UserService;

import java.security.Principal;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ItemController {

    private final UserService userService;
    private final ItemService itemService;
    private final CommentsService commentsService;
    private final LikesService likesService;
    private final UserController userController;


    @GetMapping("/")
    public String items(Model model, Principal principal) {
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("user", itemService.getUserByPrincipal(principal));
        model.addAttribute("url", "/");
        return "items";
    }

    @GetMapping("/items/{id}")
    public String itemsInfo(@PathVariable Integer id, Model model, Principal principal) {
        Item item = itemService.findById(id);
        model.addAttribute("item", item);
        model.addAttribute("author", item.getUser());
        model.addAttribute("user", itemService.getUserByPrincipal(principal));
        model.addAttribute("url", "items/" + id);
        List<Comment> comments = commentsService.findAllByItemId(item.getId());
        sortCommentsByDateDescending(comments);
        model.addAttribute("comments", comments);
        return "items-info";
    }

    @PostMapping("/items/create")
    public String add(@RequestParam("image") MultipartFile image, Item item, Principal principal) {
        itemService.add(principal, item, image);
        return "redirect:/";
    }

    @PostMapping("/items/{itemId}/comments/create")
    private String addComment(@PathVariable Integer itemId, Comment comment, Model model, Principal principal) {
        Item item = itemService.findById(itemId);
        commentsService.add(principal, comment, item);
        return itemsInfo(itemId, model, principal);
    }

    @PostMapping("/items/delete/{itemId}")
    public String deleteById(@PathVariable Integer itemId, Principal principal, Model model) {
        itemService.deleteById(itemId, principal);
        return userController.userInfo(userService.getUserByPrincipal(principal), model, principal);
    }

    @PostMapping("/items/{itemId}/likes/add")
    public String addLike(@PathVariable Integer itemId, Principal principal) {
        likesService.add(principal, itemService.findById(itemId));
        return "redirect:/";
    }

    private static void sortCommentsByDateDescending(List<Comment> comments) {
        comments.sort((c1, c2) -> c2.getDateOfCreated().compareTo(c1.getDateOfCreated()));
    }
}
