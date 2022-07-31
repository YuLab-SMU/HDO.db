\name{DOCHILDREN}
\alias{DOCHILDREN}
\title{Annotation of DO Identifiers to their Children} 
\description{
This data set describes associations between DO 
    terms and their direct children    terms, based on the directed acyclic
    graph (DAG) defined by the Disease Ontology Consortium. The format is an R
    object mapping the DO    terms to all direct children terms, where a
    direct child term is a more specific DO term that is immediately preceded
    by the given DO term in the DAG.
}
\details{
    Each DO term is mapped to a vector of children DO terms.
    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 20150323 (sub_version 2806)


}
\examples{
    # Convert the object to a list
    xx <- as.list(DOCHILDREN)
}


\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page} 
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} 
}
\keyword{datasets}

