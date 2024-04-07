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
import web.model.Item;
import web.repository.UserRepository;
import web.service.ItemService;

import java.security.Principal;

@Slf4j
@RequiredArgsConstructor
@Controller
public class ItemController {

    private final ItemService itemService;


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
        return "items-info";
    }

    @PostMapping("/items/create")
    public String add(@RequestParam("image") MultipartFile image, Item item, Principal principal) {
        itemService.add(principal, item, image);
        return "redirect:/";
    }

    @PostMapping("/items/delete/{id}")
    public String deleteById(@PathVariable Integer id) {
        itemService.deleteById(id);
        return "redirect:/";
    }

}
