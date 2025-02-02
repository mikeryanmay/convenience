% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotDiffSplits.R
\name{plotDiffSplits}
\alias{plotDiffSplits}
\title{Plots the difference between splits of different runs}
\usage{
plotDiffSplits(
  output,
  minimumESS = 625,
  fill_color = NULL,
  filename = NULL,
  per_run = FALSE,
  xlab = NULL,
  ylab = NULL,
  ...
)
}
\arguments{
\item{output}{A list of convenience.diag type}

\item{minimumESS}{The threshold for the ESS, default value is 625}

\item{fill_color}{The color for the dots on the plot}

\item{filename}{A filename to save the table, if NULL the table will be printed}

\item{per_run}{If the plot should distinguish the pairwise comparison between runs with different symbols. Default value is FALSE}

\item{...}{(various) Additional arguments passed to plot()}
}
\description{
Plots the difference between splits of different runs
}
