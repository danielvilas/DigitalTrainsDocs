%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Daniel Bahn Master Document
% LaTeX Class
% Version 0.1 (Jun 24, 2022)
% 
% Author:
% Daniel (daniel.vilas@gmail.com)
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DanielBahn}[2022/06/24 Daniel Bahn Master Document Class v0.1]

\usepackage{etoolbox}
\usepackage{graphicx}
\usepackage{float}
\usepackage{tikz}
\usepackage{chngpage}
\usepackage{tcolorbox}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} 
\ProcessOptions\relax 

\LoadClass{article}

%%---------------------
%% Datos para el Documento DanielBahn
%%---------------------
\newcommand{\dbType}[1]{\renewcommand{\dbType}{#1}}
\newcommand{\dbCode}[1]{\renewcommand{\dbCode}{#1}}
\newcommand{\dbDate}[1]{\renewcommand{\dbDate}{#1}}
\newcommand{\dbStatus}[1]{\renewcommand{\dbStatus}{#1}}
\newcommand{\dbVersion}[1]{\renewcommand{\dbVersion}{#1}}

%%---------------------
%% Configuracion de la pagina
%%---------------------


\usepackage[
	top=2cm, 
	bottom=2cm, 
	left=1cm, 
	right=5.25cm, 
	marginparwidth=4.25cm, 
	marginparsep=1cm, 
	footskip=1.5cm, 
	headsep=0.8cm,
	headheight=1cm, 
	%showframe 
]{geometry}

\newenvironment{pagcompleta}{ 
	\begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax} 
}{
	\end{adjustwidth}
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} 
\usepackage[T1]{fontenc} 

\usepackage{mathpazo} 

\usepackage[sfdefault]{plex-sans} 
\usepackage{plex-serif} 
\usepackage{plex-mono} 


%%---------------------
%% Titulo, nueva pagina y personalizacion
%%---------------------
\let\dbOldMaketitle\@maketitle

\makeatletter
\def\@maketitle{%
 %   \dbOldMaketitle
    \thispagestyle{empty} % Suppress headers and footers on this page
    \begin{pagcompleta}
        %\begin{addmargin}[4cm]{-1cm}
            
            \tikz[remember picture,overlay] \node[opacity=0.3,inner sep=0pt] at ([xshift=\marginparsep/2]current page.center){\includegraphics[width=15cm]{example-image}};
            \centering
            \hfill\includegraphics[width=2cm]{example-image-1x1} 
            \parbox[b][2cm][t]{2.5cm}{
                \vfill
                \parbox[b][0.25cm][c]{2.5cm}{ }
                \parbox[b][0.5cm][c]{2.5cm}{
                    \centering \dbType
                }
                \parbox[b][0.5cm][c]{2.5cm}{
                    \centering {\Large\textbf{\dbDate-\dbCode}}
                }
                \parbox[b][0.5cm][c]{2.5cm}{
                    \centering \dbStatus \ v\dbVersion
                }
                \parbox[b][0.25cm][c]{2.5cm}{ }
                
            }\par
            %\setlength{\parindent}{-100pt}
            \vspace{10\baselineskip}
            \large \dbType \ {\textbf{\dbDate-\dbCode}}\par
            {\fontsize{60pt}{64pt}\usefont{T1}{qzc}{m}{it}\@title \par}

            {\Large\fontseries{l}\selectfont{\@author}\par}
            {\small\usefont{T1}{MontserratAlternates-TOsF}{b}{n}(\dbStatus \ v\dbVersion)}\par
 
        %\end{addmargin}
    \end{pagcompleta}

    %\dbOldMaketitle

    \newpage
 
 
 
}
\makeatother