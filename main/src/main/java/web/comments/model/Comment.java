package web.comments.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
@Table(name = "comments")
public class Comment {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;

    @Column(name = "text", nullable = false, length = 4000)
    private String text;

    @Column(name = "item_id", nullable = false)
    private Integer itemId;

    @Column(name = "author_id", nullable = false)
    private Integer authorId;

    @Column(name = "created", nullable = false)
    private Timestamp created;
//    @ManyToOne
//    @JoinColumn(name = "item_id", referencedColumnName = "id")
//    private Items itemsByItemId;
//    @ManyToOne
//    @JoinColumn(name = "author_id", referencedColumnName = "id")
//    private User usersByAuthorId;
//    @OneToMany(mappedBy = "commentsByCommentId")
//    private Collection<Dislikes> dislikesById;
//    @OneToMany(mappedBy = "commentsByCommentId")
//    private Collection<Likes> likesById;

}
