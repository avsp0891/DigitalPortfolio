package old.comments.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import web.comments.dto.CommentDto;
import web.comments.service.CommentService;

import java.util.List;

import static org.springframework.http.HttpStatus.CREATED;
import static org.springframework.http.HttpStatus.OK;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping(path = "/comments")
public class CommentController {

    private final CommentService commentService;

    @GetMapping
    @ResponseStatus(OK)
    public List<CommentDto> findAll() {
        log.info("Вернуть список всех комментариев.");
        return commentService.findAll();
    }

    @GetMapping("/{id}")
    @ResponseStatus(OK)
    public CommentDto findById(@PathVariable(value = "id") Integer id) {
        log.info("Найти комментарий {}.", id);
        return commentService.findById(id);
    }

    @PostMapping
    @ResponseStatus(CREATED)
    public CommentDto add(@RequestHeader("X-Sharer-User-Id") Integer userId,
                                @RequestBody CommentDto commentDto) {
        log.info("Создание комментария {}.", commentDto.getId());
        return commentService.add(userId, commentDto);
    }

    @PatchMapping("/{id}")
    public CommentDto change(@PathVariable(value = "id") Integer id, @RequestBody CommentDto commentDto) {
        log.info("Изменение комментария {}.", commentDto.getId());
        return commentService.change(id, commentDto);
    }

    @DeleteMapping("/{id}")
    public CommentDto deleteById(@PathVariable(value = "id") Integer id) {
        log.info("Удаление комментария {}.", id);
        return commentService.deleteById(id);
    }

}
