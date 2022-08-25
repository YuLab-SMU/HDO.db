
datacache <- new.env(hash=TRUE, parent=emptyenv())

HDO <- function() showQCData("HDO", datacache)
HDO_dbconn <- function() dbconn(datacache)
HDO_dbfile <- function() dbfile(datacache)
HDO_dbschema <- function(file="", show.indices=FALSE) dbschema(datacache,
    file=file, show.indices=show.indices)
HDO_dbInfo <- function() dbInfo(datacache)

.onLoad <- function(libname, pkgname)
{
    dbfile <- system.file("extdata", "HDO.sqlite", package=pkgname,
        lib.loc=libname)
    assign("dbfile", dbfile, envir=datacache)
    dbconn <- dbFileConnect(dbfile)
    assign("dbconn", dbconn, envir=datacache)

    HDODb <- setRefClass("HDODb", contains="GODb")
    ## Create the OrgDb object
    sPkgname <- sub(".db$","",pkgname)
    txdb <- loadDb(system.file("extdata", paste(sPkgname,
        ".sqlite",sep=""), package=pkgname, lib.loc=libname),
        packageName=pkgname)
    dbObjectName <- getFromNamespace("dbObjectName", "AnnotationDbi")
    dbNewname <- dbObjectName(pkgname,"HDODb")
    ns <- asNamespace(pkgname)
    assign(dbNewname, txdb, envir=ns)
    namespaceExport(ns, dbNewname)

    ## Create the AnnObj instances
    ann_objs <- createAnnObjs.HDO_DB("HDO", "HDO", dbconn, datacache)
    mergeToNamespaceAndExport(ann_objs, pkgname)
}

.onUnload <- function(libpath)
{
    dbFileDisconnect(HDO_dbconn())
}

