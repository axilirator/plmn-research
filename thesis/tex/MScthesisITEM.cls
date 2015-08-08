% Document class for project reports and master's theses
% Author: Laurent Paquereau - Department of Telematics, NTNU

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MScthesisITEM} [2012/11/10 v1.0 LaTeX2e ITEM MSc thesis document class]

% Base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions\relax
\LoadClass[10pt,b5paper]{memoir}

% Fixes
\RequirePackage{etex}
\RequirePackage{iftex}

% Colors
\RequirePackage{xcolor}

% Text and encoding
%\ifPDFTeX
   \RequirePackage[utf8]{inputenc}
   \RequirePackage[T1]{fontenc}

   \RequirePackage{lmodern}
%\else
%   \ifXeTeX
%     \RequirePackage{xltxtra}
%   \else 
%     \RequirePackage{luatextra}
%   \fi
%   \defaultfontfeatures{Ligatures=TeX}
%\fi

% Layout
\setlrmarginsandblock{25mm}{*}{0.91}
\setulmarginsandblock{7pc}{*}{1}
\checkandfixthelayout

% Hyphenation, kerning
\RequirePackage{microtype}

% Spacing
\setSpacing{1.1}

% Paragraphs
\clubpenalty  = 5000
\widowpenalty = 5000

\setlength{\parindent}{1.5em}
\setlength{\parskip}{1em}

% Divisors
\setsecnumdepth{subsection}

% Float positioning
\RequirePackage{afterpage}

% Lists
\RequirePackage{enumitem}
\RequirePackage{textcomp}
\renewcommand{\labelitemi}{\textendash}
\renewcommand{\labelitemii}{\textopenbullet}

% Columns
\RequirePackage{multicol}

% Tables
\RequirePackage{tabularx}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\renewcommand{\arraystretch}{1.2}

% Links
\RequirePackage{hyperref}
\RequirePackage{memhfixc}
\hypersetup{
  colorlinks=true, 
  urlcolor=black, 
  linkcolor=black,
  citecolor=black
}
\urlstyle{same}

% Graphics
\RequirePackage{graphicx}
\RequirePackage{pdfpages}
\RequirePackage{wrapfig}
\captionnamefont{\bfseries}

%% In case you need to have subfigures; note that there will be a warning for the caption package
% \let\subcaption\undefined
% \let\subfloat\undefined
% \RequirePackage[bf]{caption}
% \RequirePackage{subcaption}
% \setlength{\abovecaptionskip}{5.5pt}
% \setlength{\belowcaptionskip}{4.2pt}

% Mathematics
\RequirePackage{amsmath}
\RequirePackage{amscd}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{needspace}

\newtheoremstyle{atheorem}%               % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {\itshape}%                             % Body font
  {}%                                     % Indent amount
  {\bfseries}%                            % Theorem head font
  {}%                                     % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {\thmname{#1}\thmnumber{ #2. }\thmnote{ #3}}%  % Theorem head spec (can be left empty, meaning `normal')

\newtheoremstyle{adefinition}%            % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {}%                                     % Body font
  {}%                                     % Indent amount
  {\bfseries}%                            % Theorem head font
  {}%                                     % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {\thmname{#1}\thmnumber{ #2. }\thmnote{ #3}}%  % Theorem head spec (can be left empty, meaning `normal')
  

\theoremstyle{atheorem} 
\numberwithin{equation}{chapter}

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{proposition}[theorem]{Proposition}

\theoremstyle{adefinition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{finalremark}[theorem]{Final Remark}
\newtheorem{remark}[theorem]{Remark}
\newtheorem{observation}[theorem]{Observation}
\newtheorem{example}[theorem]{Example}
\newtheorem{recommendation}{Recommendation}
\newtheorem{question}{Question}

\newcommand\xqed[1]{%
  \leavevmode\unskip\penalty9999 \hbox{}\nobreak\hfill
  \quad\hbox{#1}}
\newcommand\exampleqed{\xqed{$\triangle$}}

% Code
\RequirePackage{listings}
\RequirePackage[chapter]{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}

% Page style
\makepagestyle{ruled}
\makeevenhead{ruled}{{\small\thepage \ \ \ \leftmark}}{}{}
\makeoddhead{ruled}{}{}{{\small\rightmark} \ \ \ \thepage}
\makepsmarks{ruled}{%
\createmark{chapter}{left}{shownumber}{}{. }
\createmark{section}{right}{shownumber}{}{. }
\createplainmark{toc}{both}{\contentsname}
\createplainmark{lof}{both}{\listfigurename}
\createplainmark{lot}{both}{\listtablename}
\createplainmark{bib}{both}{\bibname}
\createplainmark{index}{both}{\indexname}
\createplainmark{glossary}{both}{\glossaryname}
}
\pagestyle{ruled}

% Pages with chapter headings
\makepagestyle{plain}
  \makeevenfoot{plain}{\thepage}{}{}
  \makeoddfoot{plain}{}{}{\thepage}

% Chapter style - based on hansen style, http://www.tex.ac.uk/tex-archive/info/latex-samples/MemoirChapStyles/
\RequirePackage{calc}
\definecolor{chaptercolor}{gray}{0.8}
% helper macros
\newcommand\numlifter[1]{\raisebox{-2cm}[0pt][0pt]{\smash{#1}}}
\newcommand\numindent{\kern37pt}
\newlength\chaptertitleboxheight

\makechapterstyle{hansen2}{
  \renewcommand\printchaptername{%
    \raggedleft%
    \begingroup%
    \leavevmode%
    \chapnamefont%
    \strut%
    \chaptername%
    \endgroup%
  }
  \renewcommand\printchapternum{%
    \begingroup%
    \leavevmode%
    \chapnumfont%
    \strut%
    \numlifter{\thechapter}%
    \endgroup%
  }
  \renewcommand*{\printchapternonum}{%
    \vphantom{\begingroup%
      \leavevmode%
      \chapnumfont%
      \numlifter{\vphantom{9}}%
      \endgroup}
    \afterchapternum}
  \setlength\midchapskip{0pt}
  \setlength\beforechapskip{0.5\baselineskip}
  \setlength{\afterchapskip}{3\baselineskip}
  \renewcommand\chapnumfont{%
    \fontsize{4cm}{0cm}%
    \bfseries%
    \color{chaptercolor}%
  }
    \renewcommand\chapnamefont{%
    \fontsize{2.0em}{1.25cm}%
    \bfseries%
    \color{chaptercolor}%
  }
  \renewcommand\chaptitlefont{%
    \normalfont%
    \Huge%
    \bfseries%
    \raggedleft%
  }%
  \settototalheight\chaptertitleboxheight{%
    \parbox{\textwidth}{\chaptitlefont \strut bg\\bg\strut}}
  \renewcommand\printchaptertitle[1]{%
    \parbox[t][\chaptertitleboxheight][t]{\textwidth}{%
      \microtypesetup{protrusion=false}%
      \chaptitlefont\strut ##1\strut}%
  }
}
\chapterstyle{hansen2}

% Abstract and acknowledgments
\renewcommand{\abstractnamefont}{\bfseries\Large} 
\renewcommand{\abstracttextfont}{\normalfont\normalsize}

% Table of contents
\setcounter{tocdepth}{2} % show also subsections in the table of content
\renewcommand*{\sectionrefname}{Section~}

% Bibliography
\RequirePackage[square,numbers]{natbib}
\renewcommand*{\bibname}{References}
\renewenvironment{thebibliography}[1]{%
  \setlength{\bibitemsep}{-\parsep - 0.5em}
  \setlength\bibindent{0em}
  \setSpacing{1}
  \setlength{\parindent}{-1em}
  \sloppy
  \clubpenalty4000
  \widowpenalty4000
  \bibsection
  \begin{bibitemlist}{#1}}{\end{bibitemlist}\postbibhook}

\renewcommand*{\biblistextra}{% 
  \vspace{1em}
  \setlength{\leftmargin}{1.5em}% 
  \setlength{\itemindent}{-0.5em}% 
  \addtolength{\itemindent}{\labelsep}}
  
% Glossary; undefine some commands from memoir.cls to avoid generating warnings
\let\theglossary\@undefined
\let\endtheglossary\@undefined  
\let\printglossary\undefined
\let\glossarymark\undefined
\RequirePackage[nonumberlist,toc,acronym,xindy]{glossaries}
\renewcommand\@pnumwidth{2em} % adjust page number column width

% Language
\RequirePackage[english]{babel}

% Title page and project description
\let\ordinal\undefined
\RequirePackage{datetime}
\newdateformat{dateITEM}{\monthname[\THEMONTH] \THEYEAR}

\let\@supervisor\@empty
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}
\newcommand{\thesupervisor}{\@supervisor}
\let\@professor\@empty
\newcommand{\professor}[1]{\def\@professor{#1}}
\newcommand{\theprofessor}{\@professor}

\newcommand{\titlefont}{\fontsize{2.3em}{0em}\sffamily}
\newcommand{\authorfont}{\fontsize{1.6em}{0em}\sffamily\bfseries}
\newcommand{\frontpagefont}{\fontsize{1.15em}{1.3em}\sffamily}
\newcommand{\newlinetitle}{\par\noindent }
\newcommand*{\titleITEM}{%
  \renewcommand{\arraystretch}{1}
  \thispagestyle{empty}
  \begingroup
    \vbox{%
      \vspace*{-1cm}
      {\noindent\includegraphics[width=6cm]{./figs/ntnu-logo.pdf}\par}\vspace{3cm}
      {\noindent\titlefont\@title\par}\vspace{1.8cm}
      {\noindent\authorfont\@author\par}
    }%
    \vfill
    \vbox{%
      \frontpagefont
      {\noindent%
       \begin{tabular}{@{}ll}
         Submission date:       & \dateITEM\@date \\
         Responsible professor: & \@professor     \\
         Supervisor:            & \@supervisor    \\
       \end{tabular}\par
      }\vspace{.5cm}
      {\noindent Norwegian University of Science and Technology\\Department of Telematics}
    }%
    \null
  \endgroup%
  \cleardoublepage%
  \renewcommand{\arraystretch}{1.2}
}
