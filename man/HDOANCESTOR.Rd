\name{HDOANCESTOR}
\alias{HDOANCESTOR}
\title{Annotation of HDO Identifiers to their Ancestors} 
\description{
    This data set describes associations between HDO 
    terms and their ancestor    terms, based on the directed acyclic
    graph (DAG) defined by the Disease Ontology Consortium. The format is an R
    object mapping the HDO    terms to all ancestor terms, where an
    ancestor term is a more general HDO term that precedes
    the given HDO term in the DAG (in other words, the parents, and all
    their parents, etc.).
}
\details{
    Each HDO    term is mapped to a vector of ancestor HDO    terms.
    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 20220706


}

\examples{
    # Convert the object to a list
    xx <- as.list(HDOANCESTOR)
}

\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page} 
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} 
}
\keyword{datasets}

