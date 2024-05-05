with students_subjects as
(
    select  s.student_id,
            s.student_name,
            t.subject_name
    from    Students as s
            cross join Subjects as t
),
attended_examinations as
(
    select  student_id,
            subject_name,
            count(*) as attended_exams
    from    Examinations
    group by 1, 2
)
select  ss.student_id,
        ss.student_name,
        ss.subject_name,
        coalesce(ae.attended_exams, 0) as attended_exams
from    students_subjects as ss
        left join attended_examinations as ae
            on ss.student_id = ae.student_id
               and ss.subject_name = ae.subject_name
order by 1, 3;

-- Explanation:

-- We perform a CROSS JOIN between the Students table (s) and the Subjects table (t) to generate all possible combinations of students and subjects.
-- Then, we left join this result with a subquery that counts the number of attended exams for each student and subject combination in the Examinations table (e). We use IFNULL to handle the case where a student didn't attend any exam for a particular subject.
-- Finally, we order the result by student_id and subject_name as requested.
-- This query will give you the desired output with the number of times each student attended each exam.
