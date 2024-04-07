package old.comments.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import web.comments.model.Comment;

public interface CommentRepository extends JpaRepository<Comment, Integer> {
}
