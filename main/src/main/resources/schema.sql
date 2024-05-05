CREATE TABLE IF NOT EXISTS users
(
    id
    BIGINT
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    NOT
    NULL,
    name
    VARCHAR
(
    255
) NOT NULL,
    email VARCHAR
(
    512
) NOT NULL,
    password VARCHAR
(
    512
) NOT NULL,
    CONSTRAINT pk_user PRIMARY KEY
(
    id
),
    CONSTRAINT UQ_USER_EMAIL UNIQUE
(
    email
)
    );

CREATE TABLE IF NOT EXISTS items
(
    id
    BIGINT
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    NOT
    NULL,
    name
    VARCHAR
(
    255
),
    description VARCHAR
(
    4000
),
    CONSTRAINT pk_item PRIMARY KEY
(
    id
)
    );

CREATE TABLE IF NOT EXISTS comments
(
    id
    BIGINT
    GENERATED
    BY
    DEFAULT AS
    IDENTITY
    NOT
    NULL,
    text
    VARCHAR
(
    4000
) NOT NULL,
    CONSTRAINT pk_comment PRIMARY KEY
(
    id
)
    );



CREATE TABLE IF NOT EXISTS Likes
(
    owner_id
    BIGINT
    NOT
    NULL,
    item_id
    BIGINT
    NOT
    NULL,
    CONSTRAINT
    FK_ITEM_ON_OWNER
    FOREIGN
    KEY
(
    owner_id
) REFERENCES users
(
    id
),
    CONSTRAINT
    FK_ITEM_ON_COMMENT
    FOREIGN
    KEY
(
    item_id
) REFERENCES items
(
    id
));
CREATE TABLE IF NOT EXISTS dislikes
(
    owner_id
    BIGINT
    NOT
    NULL,
    item_id
    BIGINT
    NOT
    NULL,
    CONSTRAINT
    FK_ITEM_ON_OWNER
    FOREIGN
    KEY
(
    owner_id
) REFERENCES users
(
    id
),
    CONSTRAINT
    FK_ITEM_ON_COMMENT
    FOREIGN
    KEY
(
    item_id
) REFERENCES items
(
    id
)
    );



