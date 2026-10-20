SET LOADFORMAT XLSX

LOAD TABLE ansokning 'resultat-ansokningsomgang-2025.xlsx' NEW;

COMMIT;
