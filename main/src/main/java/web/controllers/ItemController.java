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
import web.service.CommentsService;
import web.service.ItemService;

import java.security.Principal;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ItemController {

    private final ItemService itemService;
    private final CommentsService commentsService;


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

    @PostMapping("/items/delete/{id}")
    public String deleteById(@PathVariable Integer id) {
        itemService.deleteById(id);
        return "redirect:/";
    }

    private static void sortCommentsByDateDescending(List<Comment> comments) {
        comments.sort((c1, c2) -> c2.getDateOfCreated().compareTo(c1.getDateOfCreated()));
    }
}
