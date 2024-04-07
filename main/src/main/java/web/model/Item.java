package web.model;


import lombok.Data;
import web.model.User;

import javax.persistence.*;
import java.time.LocalDateTime;


@Data
@Entity
@Table(name = "items")
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "name")
    private String name;
    @Column(name = "description")
    private String description;
//    @Column(name = "owner_id")
//    private Integer ownerId;
    @Column(name = "originalFileName")
    private String originalFileName;
    @Column(name = "size")
    private Long size;
    @Column(name = "contentType")
    private String contentType;
    @Lob
    private byte[] bytes;
    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User user;
    private LocalDateTime dateOfCreated;
    @PrePersist
    private void init(){
        dateOfCreated = LocalDateTime.now();
    }

}
