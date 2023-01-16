ALTER TABLE items ADD create_userid int(11) NOT NULL DEFAULT 0;
ALTER TABLE items ADD visible_owner tinyint(1) DEFAULT 0;
UPDATE items SET create_userid = userid WHERE create_userid = 0;
UPDATE items SET visible_owner = 1 WHERE create_userid = userid;
