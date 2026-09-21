-- Dev-only seed. Password below is "Admin@123" hashed with BCrypt (strength 10).
-- Remove or guard this migration before any real environment.

INSERT INTO users (email, password_hash, full_name, role, status)
VALUES ('admin@collegebuddy.local',
        '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy',
        'Admin User',
        'ADMIN',
        'ACTIVE')
ON DUPLICATE KEY UPDATE email = email;
