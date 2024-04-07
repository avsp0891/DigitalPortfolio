package old.comments.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import web.comments.dto.CommentDto;
import web.comments.dto.CommentMapper;
import web.comments.model.Comment;
import web.comments.repository.CommentRepository;
import web.comments.service.CommentService;
import web.service.UserService;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CommentServiceImpl implements CommentService {

    private final CommentRepository repository;
    private final UserService userService;

    @Override
    public List<CommentDto> findAll() {
        return CommentMapper.toCommentDtoList(repository.findAll());
    }

    @Override
    public CommentDto findById(Integer id) {
        Comment comment = findOrException(id);
        return CommentMapper.toCommentDto(comment);
    }

    @Override
    public CommentDto add(Integer userId, CommentDto commentDto) {
//        userService.findUserOrException(userId);
        commentDto.setAuthorId(userId);
        commentDto.setCreated(new Timestamp(System.currentTimeMillis()));
        Comment comment = repository.save(CommentMapper.toComment(commentDto));
        return CommentMapper.toCommentDto(comment);
    }

    @Override
    public CommentDto change(Integer id, CommentDto commentDto) {
        Comment oldComment = findOrException(id);
        Comment newComment = CommentMapper.toComment(commentDto);
//        if (newComment.getName() != null) {
//            oldComment.setName(newUser.getName());
//        }
//        if (newUser.getEmail() != null) {
//            oldComment.setEmail(newUser.getEmail());
//        }
        return CommentMapper.toCommentDto(repository.save(oldComment));
    }

    @Override
    public CommentDto deleteById(Integer id) {
        CommentDto commentDto = findById(id);
        repository.deleteById(id);
        return commentDto;
    }

    @Override
    public Comment findOrException(Integer id) {
        Optional<Comment> comment = repository.findById(id);
        if (comment.isPresent()) {
            throw new RuntimeException("Пользователь с id " + id + " не найден.");
        } else {
            return comment.get();
        }
    }
}
