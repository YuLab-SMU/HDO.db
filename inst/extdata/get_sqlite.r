packagedir <- "./HDO.db"
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


## DOTERM
doobo <- parse_do("HumanDO.obo")
doterm <- doobo$doinfo[, c(1,2)]
colnames(doterm) <- c("do_id", "Term")
DOTERM <- doterm
dbWriteTable(conn = db, "do_term", DOTERM, row.names=FALSE, overwrite = TRUE)

######
# dbListTables(db)
# dbListFields(conn = db, "do_term")
# dbReadTable(conn = db,"do_term")
######

## ALIAS
alias <- doobo$alias
colnames(alias) <- c("do_id", "alias")
ALIAS <- alias
dbWriteTable(conn = db, "do_alias", ALIAS, row.names=FALSE, overwrite = TRUE)

## SYNONYM
synonym <- doobo$synonym
colnames(synonym) <- c("do_id", "synonym")
SYNONYM <- synonym
dbWriteTable(conn = db, "do_synonym", SYNONYM, row.names=FALSE, overwrite = TRUE)

## DOPARENTS
DOPARENTS <- doobo$rel
colnames(DOPARENTS) <- c("doid", "parent")
dbWriteTable(conn = db, "do_parents", DOPARENTS, row.names=FALSE)

## DOANCESTOR
ancestor_list <- split(DOPARENTS[, 2], DOPARENTS[, 1])
getAncestor <- function(id) {
    ans_temp <- which(DOPARENTS[, 1] %in% ancestor_list[[id]])
    ids <- DOPARENTS[ans_temp, 2]
    content <- c(ancestor_list[[id]], ids)
    while(!all(is.na(ids))) {
        ans_temp <- which(DOPARENTS[, 1] %in% ids)
        ids <- DOPARENTS[ans_temp, 2]
        content <- c(content, ids)
    }
    content[!is.na(content)]
}

for (id in names(ancestor_list)) {
    ancestor_list[[id]] <- getAncestor(id)
}
ancestordf <- stack(ancestor_list)[, c(2, 1)]
ancestordf[, 1] <- as.character(ancestordf[, 1])
ancestordf <- unique(ancestordf)
DOANCESTOR <- ancestordf
colnames(DOANCESTOR) <- c("doid", "ancestor")
dbWriteTable(conn = db, "do_ancestor", DOANCESTOR, row.names=FALSE)


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
# dbWriteTable(conn = db, "map.counts", map.counts, row.names=FALSE)
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

