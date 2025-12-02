(defun AddPrinterSupportPaths ( / pc3 ctb pmp addPath)

  ;; Paths you provided
  (setq pc3 "C:/ProgramData/Autodesk/ApplicationPlugins/SpNwDo.bundle/Contents/Support/Plotters")
  (setq ctb "C:/ProgramData/Autodesk/ApplicationPlugins/SpNwDo.bundle/Contents/Support/Plotters/Plot styles")
  (setq pmp "C:/ProgramData/Autodesk/ApplicationPlugins/SpNwDo.bundle/Contents/Support/Plotters/PMP Files")

  ;; Function to test and add missing support path
  (defun addPath (envVar newPath / curr lowerCurr lowerPath)
    (setq curr (getenv envVar))
    (if (not curr) (setq curr ""))

    ;; lowercase for reliable comparison
    (setq lowerCurr (vl-string-lower-case curr))
    (setq lowerPath (vl-string-lower-case newPath))

    ;; Only add if not already in the variable
    (if (not (vl-string-search lowerPath lowerCurr))
      (setenv envVar
              (if (= curr "")
                newPath
                (strcat curr ";" newPath)
              )
      )
    )
  )

  ;; Add missing paths only:
  (addPath "PrinterConfigDir" pc3)       ;; PC3
  (addPath "PrinterStyleSheetDir" ctb)   ;; CTB/STB
  (addPath "PrinterDescDir" pmp)         ;; PMP

  (princ)
)

(defun AddPrinterSupportPathsDebug ( / )
  (prompt "\nUpdatePrinterPath.lsp loaded successfully!\n")
  (princ)
)
(AddPrinterSupportPathsDebug)