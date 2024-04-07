package web.comments.dto;


import web.comments.model.Comment;

import java.util.List;
import java.util.stream.Collectors;

public class CommentMapper {

    public static CommentDto toCommentDto(Comment comment) {
        return new CommentDto(
                comment.getId(),
                comment.getText(),
                comment.getItemId(),
                comment.getAuthorId(),
                comment.getCreated()
        );
    }

    public static Comment toComment(CommentDto commentDto) {
        return new Comment(
                commentDto.getId(),
                commentDto.getText(),
                commentDto.getItemId(),
                commentDto.getAuthorId(),
                commentDto.getCreated()
        );
    }

    public static List<CommentDto> toCommentDtoList(List<Comment> comments) {
        return comments.stream().map(CommentMapper::toCommentDto).collect(Collectors.toList());
    }
}
