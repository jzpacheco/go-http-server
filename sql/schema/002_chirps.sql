-- +goose Up
CREATE TABLE chirps (
    id uuid PRIMARY KEY, 
    user_id uuid REFERENCES users ON DELETE CASCADE,
    body TEXT NOT NULL UNIQUE,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

-- +goose Down
DROP TABLE chirps;
