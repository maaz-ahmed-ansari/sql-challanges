WITH job_count_cte AS
  (
    SELECT
      company_id,
      title,
      description,
      COUNT(job_id) AS job_count
    FROM
      job_listings
    GROUP BY
      company_id,
      title,
      description
  )
SELECT
  COUNT(DISTINCT company_id) AS duplicate_companies
FROM
  job_count_cte
WHERE
  job_count > 1;

-- Way 2
SELECT
  COUNT(*)
FROM
  (SELECT 
    DISTINCT company_id, title, description
  FROM job_listings
  GROUP BY company_id, title, description
  HAVING COUNT(*) > 1) x;
