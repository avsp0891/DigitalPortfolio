package web.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import web.model.Role;
import web.model.User;
import web.repository.UserRepository;

@Service
@RequiredArgsConstructor
@Slf4j
public class UserServiceImpl implements UserService {

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


//    @Override
//    public List<UserDto> findAll() {
//        return UserMapper.toUserDtoList(repository.findAll());
//    }
//
//    @Override
//    public UserDto findById(Integer id) {
//        User user = findUserOrException(id);
//        return UserMapper.toUserDto(user);
//    }
//
//    @Override
//    public UserDto add(UserDto userDto) {
//        User user = repository.save(UserMapper.toUser(userDto));
//        return UserMapper.toUserDto(user);
//    }
//
//    @Override
//    public UserDto change(Integer id, UserDto userDto) {
//        User oldUser = findUserOrException(id);
//        User newUser = UserMapper.toUser(userDto);
//        if (newUser.getName() != null) {
//            oldUser.setName(newUser.getName());
//        }
//        if (newUser.getEmail() != null) {
//            oldUser.setEmail(newUser.getEmail());
//        }
//        return UserMapper.toUserDto(repository.save(oldUser));
//    }
//
//    @Override
//    public UserDto deleteById(Integer id) {
//        UserDto user = findById(id);
//        repository.deleteById(id);
//        return user;
//    }
//
//    @Override
//    public User findUserOrException(Integer id) {
//        Optional<User> user = repository.findById(id);
//        if (user.isEmpty()) {
//            throw new UserNotFoundException("Пользователь с id " + id + " не найден.");
//        } else {
//            return user.get();
//        }
//    }
}
