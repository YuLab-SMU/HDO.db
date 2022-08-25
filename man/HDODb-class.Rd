\name{HDODb-objects}
\docType{class}

% Classes
\alias{HDODb-class}



% select and select related methods
\alias{columns}
\alias{columns,HDODb-method}


\alias{keytypes}
\alias{keytypes,HDODb-method}

% \alias{keys} %Not aliased here because it is already aliased in Bimap-keys.Rd
\alias{keys}
\alias{keys,HDODb-method}


\alias{select}
\alias{select,HDODb-method}





\title{AnnotationDb objects and their progeny, methods etc.}

\description{
  \code{AnnotationDb} is the virtual base class for all annotation
  packages.  It contain a database connection and is meant to be the
  parent for a set of classes in the Bioconductor annotation
  packages. These classes will provide a means of dispatch for a
  widely available set of \code{select} methods and thus allow the
  easy extraction of data from the annotation packages.

  \code{select}, \code{columns} and \code{keys} are used together to
  extract data from an \code{AnnotationDb} object (or any object derived
  from the parent class).  Examples of classes derived from the
  \code{AnnotationDb} object include (but are not limited to):
  \code{ChipDb}, \code{OrgDb} \code{HDODb}, \code{InparanoidDb} and
  \code{ReactomeDb}.

  \code{columns} shows which kinds of data can be returned for the
  \code{AnnotationDb} object.

  \code{keytypes} allows the user to discover which keytypes can be
  passed in to \code{select} or \code{keys} and the \code{keytype}
  argument.

  \code{keys} returns keys for the database contained in the
  \code{AnnotationDb} object .  This method is already documented in the
  keys manual page but is mentioned again here because it's usage with
  \code{select} is so intimate.  By default it will return the primary
  keys for the database, but if used with the \code{keytype} argument,
  it will return the keys from that keytype.

  \code{select} will retrieve the data as a data.frame based on
  parameters for selected \code{keys} \code{columns} and \code{keytype}
  arguments.  Users should be warned that if you call \code{select} and request
  columns that have multiple matches for your keys, select will return a
  data.frame with one row for each possible match.  This has the effect that if
  you request multiple columns and some of them have a many to one relationship
  to the keys, things will continue to multiply accordingly.


  So it's not a good
  idea to request a large number of columns unless you know that what you are
  asking for should have a one to one relationship with the initial set of keys.
  In general, if you need to retrieve a column (like GO) that has a many to one
  relationship to the original keys, it is most useful to extract that
  separately.


}

\usage{
  columns(x)
  keytypes(x)
  keys(x, keytype, ...)
  select(x, keys, columns, keytype, ...)

}

\arguments{
  \item{x}{the \code{AnnotationDb} object. But in practice this will mean an
    object derived from an \code{AnnotationDb} object such as a \code{OrgDb} or
    \code{ChipDb} object.}
  \item{keys}{the keys to select records for from the database.  All possible
    keys are returned by using the \code{keys} method.}
  \item{columns}{the columns or kinds of things that can be retrieved
    from the database.  As with \code{keys}, all possible columns are
    returned by using the \code{columns} method.}
  \item{keytype}{the keytype that matches the keys used.  For the
    \code{select} methods, this is used to indicate the kind of ID being used
    with the keys argument. For the \code{keys} method this is used to
    indicate which kind of keys are desired from \code{keys}
  }

  \item{...}{other arguments.  These include:
    \describe{
      \item{pattern:}{the pattern to match (used by keys)}
      \item{column:}{the column to search on. This is used by keys and is
    for when the thing you want to pattern match is different from
    the keytype, or when you want to simply want to get keys that
    have a value for the thing specified by the column argument.}
      \item{fuzzy:}{TRUE or FALSE value.  Use fuzzy matching? (this is
    used with pattern by the keys method)}
    }
  }

}

\value{
  \code{keys},\code{columns} and \code{keytypes} each return a character
    vector or possible values.  \code{select} returns a data.frame.
}

\author{Marc Carlson}


\examples{
## display the columns
## use doid keys
dokeys <- head(keys(HDO.db))
res <- select(x = HDO.db, keys = dokeys, keytype = "doid",
    columns = c("offspring", "term", "parent"))

## use term keys
dokeys <- head(keys(HDO.db, keytype = "term"))
res <- select(x = HDO.db, keys = dokeys, keytype = "term",
    columns = c("offspring", "doid", "parent"))
}


\keyword{classes}
\keyword{methods}

