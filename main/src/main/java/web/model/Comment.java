package web.model;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

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
    private Integer id;

    @Column(name = "text", nullable = false, length = 4000)
    private String text;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn
    private Item item;

    @ManyToOne(cascade = CascadeType.REFRESH, fetch = FetchType.EAGER)
    @JoinColumn
    private User user;
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

}
