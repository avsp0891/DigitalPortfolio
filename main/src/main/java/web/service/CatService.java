package web.service;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import web.model.Cat;
import web.model.User;
import web.repository.CatRepository;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Slf4j
public class CatService {

    private final UserService userService;

    private final CatRepository catRepository;

    public Cat findById(Integer id){
        return catRepository.findById(id).get();
    }

    public List<Cat> findAllByUserId(Integer userId) {
        return catRepository.findAllByUserId(userId);
    }

    public Cat add(Principal principal, Cat cat) {
        User user = userService.getUserByPrincipal(principal);
        cat.setUser(user);
        return catRepository.save(cat);
    }



}
