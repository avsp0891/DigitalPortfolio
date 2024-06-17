package web.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import web.model.Cat;
import web.model.Item;
import web.model.Logo;
import web.repository.LogoRepository;

import java.io.IOException;
import java.security.Principal;
@Service
@RequiredArgsConstructor
public class LogoService {

    private final LogoRepository logoRepository;


    public Logo add(MultipartFile image) {
        Logo logo = new Logo();
        logo.setOriginalFileName(image.getOriginalFilename());
        logo.setSize(image.getSize());
        logo.setContentType(image.getContentType());
        try {
            logo.setBytes(image.getBytes());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return logoRepository.save(logo);
    }

}
