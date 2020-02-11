install.packages("RPostgreSQL", repos='http://cran.us.r-project.org') 
library (RPostgreSQL)
# Connection à la base de données Postgres

drv <- dbDriver ("PostgreSQL") 
con <- dbConnect (drv, dbname = "lizmap",
					host = "localhost", port = 5432,
					user = "postgres", password = "postgres")
					
# Récuparation des colonnes de la table en BDD
data_sel <- dbGetQuery(con,
	"
	select * from poi84 where fclass in (select fclass from poi84 group by fclass having count(fclass)>100);
	")
