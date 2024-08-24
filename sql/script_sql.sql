USE Kaggle
GO

--En caso no existe la tabla
IF NOT EXISTS (SELECT * FROM sys.tables WHERE object_id = OBJECT_ID(N'dbo.olympics') AND type='U')
	CREATE TABLE dbo.olympics ( 
	Rank INT,
	Country VARCHAR(100),
	Country_Code VARCHAR(50),
	Gold INT,
	Silver INT,
	Bronze INT,
	Total INT
	)
GO

--Si ya existe la tabla
TRUNCATE TABLE dbo.olympics;
GO

--Importar data desde archivo
BULK INSERT dbo.olympics
FROM 'C:\Users\USUARIO\Documents\proyecto_parcial\python\dataset\olympics2024.csv'
WITH
(
	FIRSTROW = 2, -- empieza en la 2da fila, ya que la 1era es la cabecera
	FIELDTERMINATOR = ',', --indicamos separador de columnas
	ROWTERMINATOR = '0X0a' --hace referencia a salto de linea
)
GO

