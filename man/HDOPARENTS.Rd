\name{HDOPARENTS}
\alias{HDOPARENTS}
\title{Annotation of HDO Identifiers to their Parents} 
\description{
    This data set describes associations between HDO
    terms and their direct parent    terms, based on the directed acyclic
    graph (DAG) defined by the Disease Ontology Consortium. The format is an R
    object mapping the HDO    terms to all direct parent terms, where a
    direct parent term is a more general HDO term that immediately precedes
    the given HDO term in the DAG.
}
\details{
    Each HDO    term is mapped to a named vector of HDO    terms. The name
    associated with the parent term will be either \emph{isa}, \emph{partof},
    where \emph{isa} indicates that the child term is a more specific version
    of the parent, and    \emph{partof} indicate that the
    child term is a part of the parent. 


    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 220220706


}
\examples{
    xx <- as.list(HDOPARENTS)
}
\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page} 
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} 
}
\keyword{datasets}

