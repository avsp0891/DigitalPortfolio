package web.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import web.model.Role;
import web.model.User;
import web.repository.UserRepository;

import java.security.Principal;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserService {

    private final UserRepository repository;
    private final PasswordEncoder passwordEncoder;

    public boolean createUser(User user) {
        if (user.getEmail().equals("")) {
            return false;
        }
        if (repository.findByEmail(user.getEmail()) != null) {
            return false;
        }
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        log.info("Сохранение пользователя с email " + user.getEmail());
        repository.save(user);
        return true;
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return repository.findByEmail(principal.getName());
    }


}
