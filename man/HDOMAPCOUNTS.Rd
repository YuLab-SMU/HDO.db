\name{HDOMAPCOUNTS} 

\alias{HDOMAPCOUNTS}


\title{Number of mapped keys for the maps in package HHDO.db}

\description{
    HDOMAPCOUNTS provides the "map count" (i.e. the
    count of mapped keys) for each map in package HHDO.db.
}

\details{    
    This "map count" information is precalculated and stored in the
    package annotation DB. This allows some quality control and is used by
    the \code{\link[AnnotationDbi:AnnDbPkg-checker]{checkMAPCOUNTS}}
    function defined in AnnotationDbi to compare and validate different
    methods (like \code{count.mappedkeys(x)} or
    \code{sum(!is.na(as.list(x)))}) for getting the "map count" of a given
    map.
}

\examples{
    # Convert the object to a list
    xx <- as.list(HDOCHILDREN)
}


\seealso{
    \code{\link[AnnotationDbi:Bimap-keys]{mappedkeys}},
    \code{\link[AnnotationDbi:Bimap-keys]{count.mappedkeys}},
    \code{\link[AnnotationDbi:AnnDbPkg-checker]{checkMAPCOUNTS}}
}

\keyword{datasets}

