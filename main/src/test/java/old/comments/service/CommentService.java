package old.comments.service;



import web.comments.dto.CommentDto;
import web.comments.model.Comment;

import java.util.List;

public interface CommentService {

    List<CommentDto> findAll();

    CommentDto findById(Integer id);

    CommentDto add(Integer userId, CommentDto commentDto);

    CommentDto change(Integer id, CommentDto commentDto);

    CommentDto deleteById(Integer id);

    Comment findOrException(Integer id);
}
