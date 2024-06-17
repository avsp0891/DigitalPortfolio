package web.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import web.model.Cat;
import web.model.Comment;
import web.model.Item;
import web.model.Logo;
import web.repository.CommentRepository;
import web.service.CatService;
import web.service.ItemService;
import web.service.LogoService;
import web.service.UserService;

import java.security.Principal;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CatController {
    private final CatService catService;
    private final LogoService logoService;
    private final ItemService itemService;
    private final UserService userService;

    @PostMapping("/cat/create")
    public String add(@RequestParam("image") MultipartFile image, Principal principal, Cat cat) {
        Logo logo;
        if (!image.isEmpty()){
            logo = logoService.add(image);
            cat.setLogoId(logo.getId());
        } else {
            cat.setLogoId(0);
        }
        catService.add(principal, cat);
        return "redirect:/";
    }

    @GetMapping("/cat/{id}")
    public String cat(@PathVariable Integer id, Model model, Principal principal) {
        model.addAttribute("items", itemService.findAll());
        model.addAttribute("user", itemService.getUserByPrincipal(principal));
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        model.addAttribute("cat", catService.findById(id));
        model.addAttribute("url", "cat/" + id);
        return "cats";
    }

}
