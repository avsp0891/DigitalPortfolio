package old.comments.model;

import javax.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import web.comments.model.Comment;
import web.model.User;

import java.util.Collection;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
//@Entity
public class Items {
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    private long id;
    @Basic
    @Column(name = "name", nullable = true, length = 255)
    private String name;
    @Basic
    @Column(name = "description", nullable = true, length = 4000)
    private String description;
    @Basic
    @Column(name = "available", nullable = true)
    private Boolean available;
    @Basic
    @Column(name = "owner_id", nullable = false)
    private long ownerId;
    @OneToMany(mappedBy = "itemsByItemId")
    private Collection<Comment> commentById;
    @ManyToOne
    @JoinColumn(name = "owner_id", referencedColumnName = "id", nullable = false)
    private User usersByOwnerId;

}
