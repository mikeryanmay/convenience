#' Modified from RWTY
#'
#' Load all matching files from a directory or a list of files into a list of rwty.chain objects
#'
#' Finds trees and log files based on format definition, returns rwty.chain objects containing both
#'
#' @param path The path to the directory containing tree and log files
#' @param tree_files The list of tree files when the path is not provided
#' @param log_files The list of log files when the path is not provided
#' @param format File format, which is used to find tree and log files
#' Currently accepted values "revbayes" for RevBayes, "mb" for MrBayes, "beast" for Beast and "*beast" for StarBeast
#' @param labels A vector of names to assign to chains as they are read in
#' @param ... Further arguments to be passed to load.trees
#' 
#' @return output A list of rwty.chain objects containing the multiPhylos and the tables of values from the log files if available
#'
#' @export

loadMulti <- function(path = NULL, tree_files = NULL, log_files = NULL, format = "revbayes", labels=NA, ...){
  
  file.format <- get.format(format)
  
  output <- list()
  
  if ( !is.null(path) ){
    # Convert arguments to regex
    ext.tree <- paste0("\\",file.format$trees.suffix, "$")
    ext.p <- file.format$log.suffix
    
    # Find t and p files
    tfiles <- list.files(path, pattern=ext.tree, full.names=TRUE)
    pfiles <- unlist(lapply(tfiles, FUN = function(x) sub(ext.tree, ext.p, x)))
    
  }else {
    
    tfiles <- tree_files
    pfiles <- log_files
  }
  
  
  if(length(tfiles) == 0){
    stop("Couldn't find any tree files")
  }
  
  # Step through tfiles, find log files if available, load chains
  for(i in 1:length(tfiles)){
    print(basename(tfiles[i]))
    if(file.exists(pfiles[i])){
      output[[i]] <- loadTrees(tfiles[i], logfile = pfiles[i], format = format)
    }
    else{
      output[[i]] <- loadTrees(tfiles[i], format = format)
    }
  }
  
  # Add names to chains
  if(is.na(labels)){
    names(output) <- lapply(tfiles, FUN = function(x) basename (x))
  }
  else{
    names(output) <- labels
  }
  
  output
}