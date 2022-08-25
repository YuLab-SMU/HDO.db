\name{HDOCHILDREN}
\alias{HDOCHILDREN}
\title{Annotation of HDO Identifiers to their Children} 
\description{
This data set describes associations between HDO 
    terms and their direct children    terms, based on the directed acyclic
    graph (DAG) defined by the Disease Ontology Consortium. The format is an R
    object mapping the HDO    terms to all direct children terms, where a
    direct child term is a more specific HDO term that is immediately preceded
    by the given HDO term in the DAG.
}
\details{
    Each HDO term is mapped to a vector of children HDO terms.
    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 20220706


}
\examples{
    # Convert the object to a list
    xx <- as.list(HDOCHILDREN)
}


\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page} 
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} 
}
\keyword{datasets}

