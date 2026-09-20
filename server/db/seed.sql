-- =========================================
-- MISSIONS
-- =========================================

INSERT OR IGNORE INTO missions
    (name, description, difficulty, xp_reward, gold_reward)
VALUES
    (
        'Infiltrate the Refrigerator',
        'Acquire the sacred pudding (or other snack) without alerting the household.',
        1,
        100,
        20
    ),
    (
        'Cross the Living Room',
        'Navigate the LEGO minefield without making a sound.',
        2,
        150,
        30
    ),
    (
        'Defeat the Vacuum',
        'Face the loud mechanical beast feared by pets everywhere.',
        3,
        250,
        50
    ),
    (
        'The Midnight Snack',
        'Reach the kitchen after midnight without being detected.',
        4,
        400,
        100
    ),
    (
        'The Final Chore',
        'Complete your chores before anyone reminds you.',
        5,
        1000,
        500
    );


-- =========================================
-- SKILLS
-- =========================================

INSERT OR IGNORE INTO skills
    (name, description)
VALUES
    (
        'Stealth',
        'Move quietly enough that nobody asks what you are doing.'
    ),
    (
        'Nunchucks',
        'Swing two sticks around while attempting to look professional.'
    ),
    (
        'Smoke Bomb',
        'Disappear dramatically when a conversation becomes inconvenient.'
    ),
    (
        'Wall Running',
        'Run along walls briefly before gravity remembers you exist.'
    ),
    (
        'Advanced Refrigerator Infiltration',
        'Open the refrigerator without activating the mysterious light.'
    );


-- =========================================
-- EQUIPMENT
-- =========================================

INSERT OR IGNORE INTO equipment
    (name, description, price)
VALUES
    (
        'Wooden Sword',
        'Mostly harmless. Mostly.',
        25
    ),
    (
        'Smoke Bomb',
        'For disappearing dramatically.',
        50
    ),
    (
        'Ninja Hood',
        'Increases mysteriousness by approximately 37 percent.',
        75
    ),
    (
        'Suspiciously Sharp Chopstick',
        'Nobody knows why this is considered equipment.',
        10
    );


-- =========================================
-- ACHIEVEMENTS
-- =========================================

INSERT OR IGNORE INTO achievements
    (name, description)
VALUES
    (
        'First Steps',
        'Complete your first ninja mission.'
    ),
    (
        'Master of Stealth',
        'Complete five missions.'
    ),
    (
        'Touch Grass',
        'Reach level 5.'
    ),
    (
        'Actual Ninja',
        'Reach level 10.'
    );


-- =========================================
-- STYLES
-- =========================================

INSERT OR IGNORE INTO styles
    (name, description, color, eye_color, size)
VALUES
    (
        'Classic',
        'Traditional mysterious ninja attire.',
        'black',
        'brown',
        1
    ),
    (
        'Shadow',
        'For ninjas who believe black was not already dark enough.',
        'dark-gray',
        'red',
        1
    ),
    (
        'Tiny Terror',
        'Small, fast, and probably carrying a smoke bomb.',
        'blue',
        'green',
        0
    );