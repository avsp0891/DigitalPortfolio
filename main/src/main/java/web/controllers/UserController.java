package web.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import web.model.User;
import web.service.UserService;

@Slf4j
@RequiredArgsConstructor
@Controller
public class UserController {

    private final UserService userService;


    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/registration")
    public String registration() {
        return "registration";
    }

    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

//    @GetMapping("/hello")
//    public String securityUrl(){
//        return "hello";
//    }


//    @GetMapping
//    @ResponseStatus(OK)
//    public List<UserDto> findAll() {
//        log.info("Вернуть список всех пользователей.");
//        return userService.findAll();
//    }
//
//    @GetMapping("/{id}")
//    @ResponseStatus(OK)
//    public UserDto findById(@PathVariable(value = "id") Integer id) {
//        log.info("Найти пользователя {}.", id);
//        return userService.findById(id);
//    }
//
//    @PostMapping
//    @ResponseStatus(CREATED)
//    public UserDto add(@RequestBody UserDto userDto) {
//        log.info("Создание пользователя {}.", userDto.getName());
//        return userService.add(userDto);
//    }
//
//    @PatchMapping("/{id}")
//    public UserDto change(@PathVariable(value = "id") Integer id, @RequestBody UserDto userDto) {
//        log.info("Изменение пользователя {}.", userDto.getId());
//        return userService.change(id, userDto);
//    }
//
//    @DeleteMapping("/{id}")
//    public UserDto deleteById(@PathVariable(value = "id") Integer id) {
//        log.info("Удаление пользователя {}.", id);
//        return userService.deleteById(id);
//    }

}
