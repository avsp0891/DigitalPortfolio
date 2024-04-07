package old.Items.controllers;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;
import web.Items.dto.ItemDto;
import web.user.dto.UserDto;

@Slf4j
@RequiredArgsConstructor
@RestController
@RequestMapping(path = "/items")
public class ItemController {

   private final ItemService itemService;


//    @GetMapping
//    @ResponseStatus(OK)
//    public List<CommentDto> findAll() {
//        log.info("Вернуть список всех комментариев.");
//        return commentService.findAll();
//    }
//
//    @GetMapping("/{id}")
//    @ResponseStatus(OK)
//    public CommentDto findById(@PathVariable(value = "id") Integer id) {
//        log.info("Найти комментарий {}.", id);
//        return commentService.findById(id);
//    }

//    @PostMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    @ResponseStatus(CREATED)
//    public ItemDto add(@RequestHeader("X-Sharer-User-Id") Integer userId,
//                       @RequestParam("photoFile") MultipartFile photoFile,
//                       @RequestParam("description") String description) {
//        log.info("Создание Фотографии {}.", photoFile.getOriginalFilename());
//        return itemService.add(userId, photoFile, description);
//    }

//    @PatchMapping("/{id}")
//    public CommentDto change(@PathVariable(value = "id") Integer id, @RequestBody CommentDto commentDto) {
//        log.info("Изменение комментария {}.", commentDto.getId());
//        return commentService.change(id, commentDto);
//    }
//
//    @DeleteMapping("/{id}")
//    public CommentDto deleteById(@PathVariable(value = "id") Integer id) {
//        log.info("Удаление комментария {}.", id);
//        return commentService.deleteById(id);
//    }

}
