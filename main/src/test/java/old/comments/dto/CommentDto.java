package old.comments.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {

    private long id;
    private String text;
    private Integer itemId;
    private Integer authorId;
    private Timestamp created;

}
