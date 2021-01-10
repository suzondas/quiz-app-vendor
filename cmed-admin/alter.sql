-- 08/09/2019
alter table doc_notice
	add email_sent boolean default false null;

alter table teacher_notice
	add email_sent boolean default 0 null;


-- 10/10/2017
ALTER TABLE `sif_admission`
  CHANGE `faculty_code` `module` INT(5) NOT NULL;
ALTER TABLE `assigned_teacher_doctors`
  ADD `module` INT(11) NULL
  AFTER `doc_id`;

-- 13/10/2017
ALTER TABLE `assignments_reply`
  ADD COLUMN `feedback_msg` TEXT NULL
  AFTER `attachment`,
  ADD COLUMN `feedback_attachment` VARCHAR(255) NULL
  AFTER `feedback_msg`,
  ADD COLUMN `feedback_at` DATETIME NULL ON UPDATE CURRENT_TIMESTAMP
  AFTER `feedback_attachment`;

-- 03/01/2018
DROP TABLE bigm_cmed.sif_admission_transition;

-- 07/01/2018
ALTER TABLE `sif_teacher`
  MODIFY COLUMN `photo` TEXT CHARACTER SET utf8
COLLATE utf8_general_ci NULL
  AFTER `mai_address`;

-- 11/01/2018
ALTER TABLE doc_exams
  ADD open_date DATETIME DEFAULT NULL  NULL;
ALTER TABLE doc_exams
  ADD close_date DATETIME DEFAULT NULL  NULL;

# 11/02/2018
ALTER TABLE `doc_exams`
  ADD COLUMN `created_by` VARCHAR(255) NULL
  AFTER `created_at`,
  ADD COLUMN `updated_at` DATETIME NULL
  AFTER `created_by`,
  ADD COLUMN `updated_by` VARCHAR(100) NULL
  AFTER `updated_at`;

--   24/06/18
ALTER TABLE sif_admission ADD complete_status tinyint(1) DEFAULT null  NULL COMMENT '1=Completed, Incomplete';

-- 03/07/2018
ALTER TABLE assigned_teacher_doctors ADD unit int NULL;
ALTER TABLE assigned_teacher_doctors MODIFY COLUMN unit int AFTER module;

-- 31/12/2018
ALTER TABLE `reading_materials` ADD `is_free` TINYINT(1) NOT NULL DEFAULT '0' AFTER `link`;
