package old.Items.service;

import lombok.RequiredArgsConstructor;
import old.Items.repository.ItemRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import old.Items.model.Item;


import old.Items.dto.ItemDto;
import old.Items.dto.ItemMapper;
import web.service.UserService;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ItemServiceImpl implements ItemService {

    @Value("${upload.path}")
    private String uploadPath;
    private final ItemRepository repository;
    private final UserService userService;


    @Override
    public ItemDto findById(Integer userId, Integer id) {
        return null;
    }

    @Override
    public ItemDto add(Integer userId, MultipartFile photoFile, String description) {
//        userService.findUserOrException(userId);
        if (photoFile != null) {
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "_" + photoFile.getOriginalFilename();
            try {
                photoFile.transferTo(new File(uploadPath + "/" + resultFileName));
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
            ItemDto dto = new ItemDto();
            dto.setName(resultFileName);
            dto.setDescription(description);
            dto.setOwnerId(userId);
            Item item = repository.save(ItemMapper.toItem(dto));
            return ItemMapper.toItemDto(item);
        }
        throw new RuntimeException();
    }

    @Override
    public ItemDto deleteById(Integer userId, Integer id) {
        return null;
    }

    @Override
    public Item findOrException(Integer id) {
        return null;
    }
}
