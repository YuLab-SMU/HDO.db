\name{HDOmetadata}
\alias{HDOmetadata}
\title{Annotation of HDO Identifiers to HDO Terms}
\description{
    This data set gives mappings between HDO identifiers and their
    respective terms.
}
\details{
    Each HDO identifier is mapped to a \code{HDOTerms} object that has 2 slots:
    name: HDO name;
    value: The value


    Mappings were based on data provided by: Disease Ontology
    With a date stamp from the source of: 20220706


}

\examples{
    # Convert the object to a data.frame
    library(AnnotationDbi)
    xx <- toTable(HDOmetadata)
}
\references{
\url{http://do-wiki.nubic.northwestern.edu/index.php/Main_Page}
%and \url{http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=gene}
}
\keyword{datasets}

