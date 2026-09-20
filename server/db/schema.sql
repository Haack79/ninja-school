-- =========================================
-- USERS
-- Account/login information
-- =========================================

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- NINJAS
-- Each user owns one ninja (for now) 
-- =========================================

CREATE TABLE IF NOT EXISTS ninjas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL UNIQUE,
    name TEXT NOT NULL,
    level INTEGER NOT NULL DEFAULT 1,
    health INTEGER NOT NULL DEFAULT 100,
    experience INTEGER NOT NULL DEFAULT 0,
    gold INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users(id)
        ON DELETE CASCADE
);


-- =========================================
-- NINJA ATTRIBUTES
-- One-to-one relationship with ninja
-- =========================================

CREATE TABLE IF NOT EXISTS ninja_attributes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ninja_id INTEGER NOT NULL UNIQUE,

    strength INTEGER NOT NULL DEFAULT 10,
    agility INTEGER NOT NULL DEFAULT 10,
    intelligence INTEGER NOT NULL DEFAULT 10,
    wisdom INTEGER NOT NULL DEFAULT 10,
    charisma INTEGER NOT NULL DEFAULT 10,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE
);


-- =========================================
-- STYLES
-- Available visual styles
-- =========================================

CREATE TABLE IF NOT EXISTS styles (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT,
    color TEXT NOT NULL,
    eye_color TEXT,
    size INTEGER NOT NULL DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- NINJA STYLE
-- Allows a ninja to select a style
-- =========================================

CREATE TABLE IF NOT EXISTS ninja_styles (
    ninja_id INTEGER PRIMARY KEY,
    style_id INTEGER NOT NULL,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (style_id) REFERENCES styles(id)
);


-- =========================================
-- MISSIONS
-- Missions available to all ninjas
-- =========================================

CREATE TABLE IF NOT EXISTS missions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    difficulty INTEGER NOT NULL DEFAULT 1,
    xp_reward INTEGER NOT NULL DEFAULT 0,
    gold_reward INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- COMPLETED MISSIONS
-- many-to-many relationship:
-- ninjas <-> missions
-- =========================================

CREATE TABLE IF NOT EXISTS completed_missions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ninja_id INTEGER NOT NULL,
    mission_id INTEGER NOT NULL,
    completed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (mission_id) REFERENCES missions(id),

    UNIQUE(ninja_id, mission_id)
);


-- =========================================
-- SKILLS
-- Skills available in Ninja School
-- =========================================

CREATE TABLE IF NOT EXISTS skills (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- NINJA SKILLS
-- many-to-many:
-- ninjas <-> skills
-- =========================================

CREATE TABLE IF NOT EXISTS ninja_skills (
    ninja_id INTEGER NOT NULL,
    skill_id INTEGER NOT NULL,
    learned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (skill_id) REFERENCES skills(id),

    UNIQUE(ninja_id, skill_id)
);


-- =========================================
-- EQUIPMENT
-- Equipment definitions
-- =========================================

CREATE TABLE IF NOT EXISTS equipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    price INTEGER NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- INVENTORY
-- Equipment owned by each ninja
-- =========================================

CREATE TABLE IF NOT EXISTS inventory (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ninja_id INTEGER NOT NULL,
    equipment_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    equipped INTEGER NOT NULL DEFAULT 0,
    acquired_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (equipment_id) REFERENCES equipment(id),

    UNIQUE(ninja_id, equipment_id)
);


-- =========================================
-- ACHIEVEMENTS
-- Achievement definitions
-- =========================================

CREATE TABLE IF NOT EXISTS achievements (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- NINJA ACHIEVEMENTS
-- many-to-many: many ninjas can have many achievements and many achievements can be earned by many ninjas
-- ninjas <-> achievements
-- =========================================

CREATE TABLE IF NOT EXISTS ninja_achievements (
    ninja_id INTEGER NOT NULL,
    achievement_id INTEGER NOT NULL,
    earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (achievement_id) REFERENCES achievements(id),

    UNIQUE(ninja_id, achievement_id)
);


-- =========================================
-- LOGS
-- Activity history for each ninja
-- =========================================

CREATE TABLE IF NOT EXISTS logs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ninja_id INTEGER NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE
);


-- =========================================
-- REWARDS
-- Special rewards that can be earned
-- =========================================

CREATE TABLE IF NOT EXISTS rewards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- =========================================
-- NINJA REWARDS
-- many-to-many relationship:
-- ninjas <-> rewards
-- =========================================

CREATE TABLE IF NOT EXISTS ninja_rewards (
    ninja_id INTEGER NOT NULL,
    reward_id INTEGER NOT NULL,
    earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (ninja_id) REFERENCES ninjas(id)
        ON DELETE CASCADE,

    FOREIGN KEY (reward_id) REFERENCES rewards(id),

    UNIQUE(ninja_id, reward_id)
);