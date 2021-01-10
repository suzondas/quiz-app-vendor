CREATE OR REPLACE VIEW exam_results AS 
SELECT
	A.id doc_id,
	COUNT(A.id) total,
	E.`year`,
	E.`session`,
	E.module_id,
	A.reg_no,
	A.doc_name,
	SUM(E.total_mark) total_mcq_mark,
	SUM(E.correct_mark) mcq_correct_mark,
	SUM(E.wrong_mark) mcq_wrong_mark,
	SUM(E.final_mark) mcq_final_mark,
	SUM(B.mark_obtained) assignment_mark,
	OSE.mcq saq_total,
	OSE.mcq_obtained saq_mark,
	OSE.essay essay_total,
	OSE.essay_obtained essay_mark,
	OSE.oral oral_total,
	OSE.oral_obtained oral_mark
FROM
	sif_admission A
LEFT JOIN doc_exams E ON A.id = E.doc_id
AND A.`year` = E.`year`
AND A.`session` = E.`session`
LEFT JOIN assignments B ON A.id = B.doc_id
AND A.`year` = B.`year`
AND A.`session` = B.`session`
AND E.module_id = B.module
AND E.unit_id = B.unit
LEFT JOIN on_site_exam OSE ON A.id = OSE.doc_id
AND A.`year` = OSE.`year`
AND A.`session` = OSE.`session`
AND E.module_id = OSE.module_id
WHERE
-- B.`status` = 'A' AND 
A.`status` = 1
-- OSE.`status` = 1
GROUP BY
	A.id
ORDER BY
	A.reg_no