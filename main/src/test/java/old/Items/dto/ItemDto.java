package old.Items.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDto {

    private Integer id;
    private String name;
    private String description;
    private Integer ownerId;
}
