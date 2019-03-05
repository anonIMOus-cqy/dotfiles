(TeX-add-style-hook
 "twla"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("attachfile2" "dvips")))
   (TeX-run-style-hooks
    "amsmath"
    "amssymb"
    "amsfonts"
    "ulem"
    "needspace"
    "setspace"
    "etoolbox"
    "array"
    "xfrac"
    "titlesec"
    "geometry"
    "xcolor"
    "siunitx"
    "graphicx"
    "framed"
    "mdframed"
    "ntheorem"
    "attachfile2"
    "asymptote"
    "titling")
   (TeX-add-symbols
    '("norm" 1)
    '("abs" 1)
    '("ceil" 1)
    '("floor" 1)
    '("overbar" 1)
    "thmproof"
    "ii"
    "dg"
    "st"
    "nd"
    "Tau"
    "CC"
    "RR"
    "QQ"
    "ZZ"
    "NN"
    "FF"
    "arcsec"
    "lcm"
    "liff"
    "lthen"
    "surjto"
    "injto"
    "dom"
    "img"
    "ran"
    "Dom"
    "Img"
    "Ran"
    "vspan"
    "rk"
    "nul"
    "rank"
    "problem"
    "subproblem"
    "subsubproblem")
   (LaTeX-add-environments
    "proof"
    "solution"
    "subproof")
   (LaTeX-add-counters
    "probl"
    "probll"
    "problll")
   (LaTeX-section-list-add-locally
     '(("problem" 2)
       ("subproblem" 3)
       ("subsubproblem" 4)))
   (if (fboundp 'reftex-add-section-levels)
     (reftex-add-section-levels
       '(("problem" . 2)
         ("subproblem" . 3)
         ("subsubproblem" . 4)))))
 :latex)

