-- name: CreateChirp :one
INSERT INTO chirps(id, user_id, body, created_at, updated_at)
VALUES (
    gen_random_uuid(),
    $2,
    $1,
    NOW(),
    NOW()
)

RETURNING *;


-- name: GetChirps :many
SELECT * FROM chirps ORDER BY created_at ASC;
