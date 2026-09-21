-- Login form: single `users` table.
-- password_hash holds a BCrypt hash (60 chars); plain passwords are never stored.

CREATE TABLE IF NOT EXISTS users (
    id                    BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    email                 VARCHAR(150)    NOT NULL,
    password_hash         VARCHAR(100)    NOT NULL,
    full_name             VARCHAR(120)    DEFAULT NULL,
    role                  ENUM('STUDENT', 'FACULTY', 'ADMIN')     NOT NULL DEFAULT 'STUDENT',
    status                ENUM('ACTIVE', 'INACTIVE', 'LOCKED')    NOT NULL DEFAULT 'ACTIVE',
    failed_login_attempts INT UNSIGNED    NOT NULL DEFAULT 0,
    last_login_at         DATETIME        DEFAULT NULL,
    created_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at            DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uk_users_email (email),
    KEY idx_users_status (status)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci;
