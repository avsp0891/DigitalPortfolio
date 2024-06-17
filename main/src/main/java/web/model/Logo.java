package web.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "logo")
public class Logo {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "originalFileName")
    private String originalFileName;
    @Column(name = "size")
    private Long size;
    @Column(name = "contentType")
    private String contentType;
    @Lob
    private byte[] bytes;


}
