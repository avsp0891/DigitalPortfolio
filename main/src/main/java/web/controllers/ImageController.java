package web.controllers;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import web.model.Item;
import web.repository.ItemRepository;

import java.io.ByteArrayInputStream;

@RestController
@RequiredArgsConstructor
public class ImageController {
    private final ItemRepository itemRepository;

    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Integer id) {
        Item item = itemRepository.findById(id).orElse(null);
        return ResponseEntity.ok()
                .header("fileName", item.getOriginalFileName())
                .contentType(MediaType.valueOf(item.getContentType()))
                .contentLength(item.getSize())
                .body(new InputStreamResource(new ByteArrayInputStream(item.getBytes())));
    }


}
