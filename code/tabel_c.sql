CREATE OR REPLACE TABLE
`projectz.dataset.tabel_c` AS
SELECT 
	tbla.ID as ID
	data_a
	data_b
FROM `projectx.dataset.tabel_a` tbla
LEFT JOIN `projecty.dataset.tabel_b` tblb ON tbla.ID=tblb.ID;
