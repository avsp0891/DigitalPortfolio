package web.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import web.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
}
