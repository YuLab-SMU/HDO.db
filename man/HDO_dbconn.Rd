
\name{HDO_dbconn}

\alias{HDO_dbconn}
\alias{HDO_dbfile}
\alias{HDO_dbschema}
\alias{HDO_dbInfo}


\title{Collect information about the package annotation DB}

\description{
    Some convenience functions for getting a connection object to
    (or collecting information about) the package annotation DB.
}

\usage{
    HDO_dbconn()
    HDO_dbfile()
    HDO_dbschema(file="", show.indices=FALSE)
    HDO_dbInfo()
}


\arguments{
    \item{file}{
        A connection, or a character string naming the file to print to (see
        the \code{file} argument of the \code{\link[base]{cat}} function for
        the details).
    }
    \item{show.indices}{
        The CREATE INDEX statements are not shown by default.
        Use \code{show.indices=TRUE} to get them.
    }
}

%\arguments{
%    \item{file}{
%        A connection, or a character string naming the file to print to (see
%        the \code{file} argument of the \code{\link[base]{cat}} function for
%        the details).
%    }
%    \item{show.indices}{
%        The CREATE INDEX statements are not shown by default.
%        Use \code{show.indices=TRUE} to get them.
%    }
%}

\details{
    \code{HDO_dbconn} returns a connection object to the
    package annotation DB.    IMPORTANT: HDOn't call
    \code{\link[DBI:dbConnect]{dbDisconnect}} on the connection object
    returned by \code{HDO_dbconn} or you will break all the
    \code{\link[AnnotationDbi:AnnDbObj-class]{AnnDbObj}} objects defined
    in this package!

    \code{HDO_dbfile} returns the path (character string) to the
    package annotation DB (this is an SQLite file).

    \code{HDO_dbschema} prints the schema definition of the
    package annotation DB.

    \code{HDO_dbInfo} prints other information about the package
    annotation DB.
}

\value{
    \code{HDO_dbconn}: a DBIConnection object representing an
    open connection to the package annotation DB.

    \code{HDO_dbfile}: a character string with the path to the
    package annotation DB.

    \code{HDO_dbschema}: none (invisible \code{NULL}).

    \code{HDO_dbInfo}: none (invisible \code{NULL}).
}

\seealso{
    \code{\link[DBI:dbSendQuery]{dbGetQuery}},
    \code{\link[DBI:dbConnect]{dbConnect}},
    \code{\link[AnnotationDbi:AnnDbObj-class]{dbconn}},
    \code{\link[AnnotationDbi:AnnDbObj-class]{dbfile}},
    \code{\link[AnnotationDbi:AnnDbObj-class]{dbschema}},
    \code{\link[AnnotationDbi:AnnDbObj-class]{dbInfo}}
}

\examples{
    ## Count the number of rows in the "hdo_term" table:
    HDO_dbconn()
}

\keyword{utilities}
\keyword{datasets}

