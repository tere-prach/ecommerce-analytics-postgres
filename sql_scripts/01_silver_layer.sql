-- Cleaning and transformation of data.

CREATE OR REPLACE VIEW vw_customers AS
(
SELECT 
	customer_unique_id AS customer_id,
	customer_id AS purchase_id,
	COALESCE(LOWER(TRIM(customer_city)), 'unknown') AS customer_city,
	COALESCE(CAST(UPPER(TRIM(customer_state)) AS VARCHAR(10)), 'unknown') AS customer_state
FROM olist_customers_dataset
WHERE customer_id IS NOT NULL AND customer_unique_id IS NOT NULL
);
