package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import web.model.Comment;

import java.util.List;

@Transactional
public interface CommentRepository extends JpaRepository<Comment, Integer> {

    List<Comment> findAllByItemId(Integer itemId);
}
