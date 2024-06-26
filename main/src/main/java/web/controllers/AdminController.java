package web.controllers;


import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import web.model.User;
import web.service.UserService;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
@PreAuthorize("hasAuthority('ROLE_ADMIN')")
public class AdminController {
    private final UserService userService;

    @GetMapping("/admin")
    public String admin(Model model, Principal principal) {
        model.addAttribute("users", userService.findAll());
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        model.addAttribute("url", "/admin");
        if (user.isAdmin()) {
            return "admin";
        } else {
            return "redirect:/";
        }

    }

    @PostMapping("/admin/user/ban/{id}")
    public String userBan(@PathVariable("id") Integer id) {
        userService.banUser(id);
        return "redirect:/admin";
    }

//    @GetMapping("/admin/user/edit/{user}")
//    public String userEdit(@PathVariable("user") User user, Model model, Principal principal) {
//        model.addAttribute("user", user);
//        model.addAttribute("user", userService.getUserByPrincipal(principal));
//        model.addAttribute("roles", Role.values());
//        return "user-edit";
//    }

//    @PostMapping("/admin/user/edit")
//    public String userEdit(@RequestParam("userId") User user, @RequestParam Map<String, String> form) {
//        userService.changeUserRoles(user, form);
//        return "redirect:/admin";
//    }
}
