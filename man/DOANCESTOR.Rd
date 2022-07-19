\name{DOANCESTOR}
\alias{DOANCESTOR}
\title{Annotation of DO Identifiers to their Ancestors} 
\description{
  This data set describes associations between DO 
  terms and their ancestor  terms, based on the directed acyclic
  graph (DAG) defined by the Disease Ontology Consortium. The format is an R
  object mapping the DO  terms to all ancestor terms, where an
  ancestor term is a more general DO term that precedes
  the given DO term in the DAG (in other words, the parents, and all
  their parents, etc.).
}
\details{
  Each DO  term is mapped to a vector of ancestor DO  terms.
  
  
    
  Mappings were based on data provided by: Disease Ontology
  With a date stamp from the source of: 20150323 (sub_version 2806)


}
\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page} 
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene} 
}
\keyword{datasets}

