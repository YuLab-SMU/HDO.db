packagedir <- ".//DOyulab.db"
sqlite_path <- paste(packagedir, sep=.Platform$file.sep, "inst", "extdata")
if(!dir.exists(sqlite_path)){dir.create(sqlite_path,recursive = TRUE)}
dbfile <- file.path(sqlite_path, "DO.sqlite")
unlink(dbfile)

###################################################
### create database
###################################################
## Create the database file
library(RSQLite)
drv <- dbDriver("SQLite")
db <- dbConnect(drv, dbname=dbfile)
## dbDisconnect(db)
DOANCESTOR <- doancestor
colnames(DOANCESTOR) <- c("doid", "ancestor")
dbWriteTable(conn = db, "do_ancestor", DOANCESTOR, row.names=FALSE)

## DOTERM
doobo <- parse_do("HumanDO.obo")
doterm <- doobo$doinfo[, c(1,2)]
colnames(doterm) <- c("do_id", "Term")
DOTERM <- doterm
dbWriteTable(conn = db, "do_term", DOTERM, row.names=FALSE, overwrite = TRUE)


## DOPARENTS
DOPARENTS <- doobo$rel
colnames(DOPARENTS) <- c("doid", "parent")
dbWriteTable(conn = db, "do_parents", DOPARENTS, row.names=FALSE)


metadata <- metadata<-rbind(c("DBSCHEMA","DO_DB"),
		c("DBSCHEMAVERSION","2.0"),
		c("DOSOURCENAME","Disease Ontology"),
		c("DOSOURCURL","https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo"),
		c("DOSOURCEDATE","20220706"))#,
		#c("DOVERSION","2806"))	

metadata <- as.data.frame(metadata)
colnames(metadata) <- c("name", "value") #makeAnnDbPkg规定的
dbWriteTable(conn = db, "metadata", metadata, row.names=FALSE, overwrite = TRUE)



map.counts<-rbind(c("TERM", nrow(DOTERM)),
		# c("OBSOLETE","$obsolete_counts"),
		c("CHILDREN", nrow(DOPARENTS)),
		c("PARENTS", nrow(DOPARENTS)),
		c("ANCESTOR", nrow(DOANCESTOR)),
		c("OFFSPRING", nrow(DOANCESTOR)))


map.counts <- as.data.frame(map.counts)
colnames(map.counts) <- c("map_name","count")
dbWriteTable(conn = db, "map_counts", map.counts, row.names=FALSE)

dbListTables(db)
dbListFields(conn = db, "metadata")
dbReadTable(conn = db,"metadata")


map.metadata <- rbind(c("TERM", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"),
		    c("OBSOLETE", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"),
		    c("CHILDREN", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"),
		    c("PARENTS", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"),
		    c("ANCESTOR", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"),
		    c("OFFSPRING", "Disease Ontology", "https://github.com/DiseaseOntology/HumanDiseaseOntology/blob/main/src/ontology/HumanDO.obo","20220706"))	
map.metadata <- as.data.frame(map.metadata)
colnames(map.metadata) <- c("map_name","source_name","source_url","source_date")
dbWriteTable(conn = db, "map_metadata", map.metadata, row.names=FALSE, overwrite = TRUE)


dbListTables(db)
dbListFields(conn = db, "map_metadata")
dbReadTable(conn = db,"map_metadata")
dbDisconnect(db)

