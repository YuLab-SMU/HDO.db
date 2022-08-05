\name{DOmetadata}
\alias{DOmetadata}
\title{Annotation of DO Identifiers to DO Terms}
\description{
    This data set gives mappings between DO identifiers and their
    respective terms.
}
\details{
    Each DO identifier is mapped to a \code{DOTerms} object that has 2 slots:
    name: DO name;
    value: The value


    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 20220706


}

\examples{
    # Convert the object to a data.frame
    library(AnnotationDbi)
    xx <- toTable(DOmetadata)
}
\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page}
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene}
}
\keyword{datasets}

