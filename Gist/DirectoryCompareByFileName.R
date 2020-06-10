#' Compare two directories with files by file names.
#'
#' @param path1 A string.
#' @param path2 A string.
#' @param pattern1 A string.
#' @param pattern2 A string.
#' @return The res data.frame with difference between directories.
#' @examples
#' res <-
#'     DirectoryCompareByFileName(
#'         path1 = "C:/PDF/",
#'         path2 = "C:/TXT/",
#'         pattern1 = "\\.pdf",
#'         pattern2 = "\\.txt"
#'     )

DirectoryCompareByFileName <-
    function(path1, path2, pattern1, pattern2)
    {
        filesPath1 <-
            list.files(path = path1,
                       pattern = pattern1,
                       recursive = TRUE)

        filesPath2 <-
            list.files(path = path2,
                       pattern = pattern2,
                       recursive = TRUE)

        filesPath1 <- gsub(pattern1, "", filesPath1)
        filesPath2 <- gsub(pattern2, "", filesPath2)

        pattern1Diff <-
            setdiff(x = filesPath1, y = filesPath2)
        pattern2Diff <-
            setdiff(x = filesPath2, y = filesPath1)

        if (length(pattern1Diff) > 0) {
            pattern1Diff <-
                data.frame(FileName = pattern1Diff, stringsAsFactors = FALSE)
        } else {
            pattern1Diff <-
                data.frame(FileName = "All files from path1 exists in path2")
        }

        if (length(pattern2Diff) > 0) {
            pattern2Diff <-
                data.frame(FileName = pattern2Diff, stringsAsFactors = FALSE)
        } else {
            pattern2Diff <-
                data.frame(FileName = "All files from path2 exists in path1")
        }

        pattern1Diff$FilePath <- path1
        pattern2Diff$FilePath <- path2

        pattern1Diff$FileMask <- pattern1
        pattern2Diff$FileMask <- pattern2

        pattern1Diff$Direction <- "->"
        pattern2Diff$Direction <- "<-"

        res <- rbind(pattern1Diff, pattern2Diff)

        return(res)
    }

