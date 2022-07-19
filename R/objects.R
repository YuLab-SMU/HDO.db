createAnnDbBimaps <- getFromNamespace('createAnnDbBimaps','AnnotationDbi')
createMAPCOUNTS <- getFromNamespace('createMAPCOUNTS','AnnotationDbi')
prefixAnnObjNames <- getFromNamespace('prefixAnnObjNames','AnnotationDbi')


DO_DB_AnnDbBimap_seeds <- list(
    list(
        objName="PARENTS",
        Class="AnnDbBimap",
        L2Rchain=list(
            list(
                tablename="do_parents",
                Lcolname="doid",
                Rcolname="parent"
            )
        )
    ),
    
    list(
        objName="ANCESTOR",
        Class="AnnDbBimap",
        L2Rchain=list(
            list(
                tablename="do_ancestor",
                Lcolname="doid",
                Rcolname="ancestor"
            )  
        )
    ),
   
    list(
        objName="TERM",
       	Class="AnnDbBimap",
        L2Rchain=list(
            list(
                tablename="do_term",
                Lcolname="do_id",
                Rcolname="Term"
            )
        )
    )
)

createAnnObjs.DO_DB <- function(prefix, objTarget, dbconn, datacache)
{
    #Now skip here
    #checkDBSCHEMA(dbconn, "DO_DB") 

    ## AnnDbBimap objects
    seed0 <- list(
        objTarget=objTarget,
        datacache=datacache
    )
    #ann_objs <- createAnnDbBimaps(DO_DB_AnnDbBimap_seeds, seed0)
    ann_objs <- createAnnDbBimaps(DO_DB_AnnDbBimap_seeds, seed0)

    ## Reverse maps
    ann_objs$CHILDREN <- revmap(ann_objs$PARENTS, objName = "CHILDREN")
    ann_objs$OFFSPRING <- revmap(ann_objs$ANCESTOR, objName = "OFFSPRING")

    
    ## 1 special map that is not an AnnDbBimap object (just a named integer vector)
    #ann_objs$MAPCOUNTS <- createMAPCOUNTS(dbconn, prefix)
    ann_objs$MAPCOUNTS <- createMAPCOUNTS(dbconn, prefix)

    #prefixAnnObjNames(ann_objs, prefix)	
    prefixAnnObjNames(ann_objs, prefix)
}




