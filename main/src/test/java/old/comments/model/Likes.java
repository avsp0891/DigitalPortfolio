package old.comments.model;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import web.comments.model.Comment;
import web.model.User;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
//@Entity
public class Likes {
    @Id
    @Basic
    @Column(name = "owner_id", nullable = false)
    private long ownerId;

    @Id
    @Basic
    @Column(name = "comment_id", nullable = false)
    private long commentId;
    @ManyToOne
    @JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
    private User usersByOwnerId;
    @ManyToOne
    @JoinColumn(name = "comment_id", referencedColumnName = "id", nullable = false)
    private Comment commentByCommentId;

}
