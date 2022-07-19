
datacache <- new.env(hash=TRUE, parent=emptyenv())

DO <- function() showQCData("DO", datacache)
DO_dbconn <- function() dbconn(datacache)
DO_dbfile <- function() dbfile(datacache)
DO_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache, file=file, show.indices=show.indices)
DO_dbInfo <- function() dbInfo(datacache)
# DO_dbschema <- function(){writeLines(strwrap(readLines(system.file("DBschemas","schemas_1.0","DO_DB.sql", package ="DOyulab.db")),indent=2, exdent=4))}

.onLoad <- function(libname, pkgname)
{
    dbfile <- system.file("extdata", "DO.sqlite", package=pkgname, lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)
    ## Create the AnnObj instances
    # ann_objs <- createAnnObjs.SchemaChoice("DO_DB", "DO", "DO", dbconn, datacache)
    ann_objs <- createAnnObjs.DO_DB("DO", "DO", dbconn, datacache)
    mergeToNamespaceAndExport(ann_objs, pkgname)   
    # packageStartupMessage(AnnotationDbi:::annoStartupMessages("DOyulab.db"))   
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(DO_dbconn())
}

