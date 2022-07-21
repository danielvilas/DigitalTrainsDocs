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
\ProvidesClass{DccDiyTools}[2022/06/24 Dcc Diy Tools Master Document Class v0.1]

\RequirePackage[dvipsnames,table]{xcolor}


\usepackage{etoolbox}
\usepackage{graphicx}
\usepackage{float}




\usepackage{tikz}
%\usepackage{chngpage}
\usepackage{tcolorbox}

\usepackage{tabularx}
\usepackage{multirow}
\usepackage{makecell}




\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} 
\ProcessOptions\relax 

\LoadClass{article}

\usepackage[oneside]{sidenotes}

%%---------------------
%% Datos para el Documento DanielBahn
%%---------------------
\newcommand{\dbType}[1]{\renewcommand{\dbType}{#1}}
\newcommand{\dbCode}[1]{\renewcommand{\dbCode}{#1}}
\newcommand{\dbDate}[1]{\renewcommand{\dbDate}{#1}}
\newcommand{\dbStatus}[1]{\renewcommand{\dbStatus}{#1}}
\newcommand{\dbVersion}[1]{\renewcommand{\dbVersion}{#1}}
\newcommand{\subtitle}[1]{\renewcommand{\subtitle}{#1}}
\newcommand{\dbImage}[1]{\renewcommand{\dbImage}{#1}}
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

\setlength{\parskip}{6pt}


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
            {\fontsize{40pt}{42pt}\selectfont\subtitle \par}

            {\Large\fontseries{l}\selectfont{\@author}\par}
            {\small\usefont{T1}{MontserratAlternates-TOsF}{b}{n}(\dbStatus \ v\dbVersion)}\par
            \vspace{5\baselineskip}
            \includegraphics{\dbImage}

            
        %\end{addmargin}
    \end{pagcompleta}

    %\dbOldMaketitle

    \newpage
 
 
 
}
\makeatother

%% ----------------
%% Simple pics for diagrams
%% ----------------

\tikzset{
    screwTerminal/.pic={
        
         \draw[fill=gray] (-0.5,-0.25) rectangle +(1,0.5);
         \draw[fill=lightgray] (-0.25,0) circle(.16);
         \draw [color=white, line width=2pt,cap=butt] (-.33,.08) -- (-.17,-.08);
         \draw[fill=lightgray] (0.25,0) circle(.16);
         \draw [color=white, line width=2pt,cap=butt] (.25,.12) -- (.25,-.12);
         \node (-west) at (-0.6,0) {};
         \node (-cable-down) at (-0,-0.35) {};
         \node (-cable-up) at (-0,0.35) {};
    }
}

\tikzset{
    jack/.pic={
        \draw[fill=black!75]  (-.4, 0.3) arc(90:270:0.3)
        -- +(0.3,0) -- +(0.3,0.6) -- +(0,0.6);
        %\draw[fill=black!75] (-1,-0.3) rectangle +(1,0.6);
        
        \draw[fill=lightgray!75] (-0.2,-0.25) rectangle +(0.6,0.5);
        \draw[fill=black!75] (0.4,-0.2) rectangle +(0.1,0.4);
        \draw[fill=lightgray!75] (0.5,-0.25) rectangle +(0.2,0.5);
        %\draw[red] (-1,0.3) rectangle +(1.4,-0.6);
        \node (-cable) at (-0.8,0) {};
        \node (-point) at (0.8,0) {};
   }
}

\tikzset{
    JstXh2/.pic={
        % \draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        % \draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        % \draw [very thin, green] (-1,-1) grid (1,1);
        
        \draw [color=lightgray, line width=3pt,cap=round] (.15,0.3) -- (.15,-.45);
        \draw [color=lightgray, line width=3pt,cap=round] (-.15,0.3) -- (-.15,-.45);

        \draw[fill=white] (-0.4,0.2) -- (-0.4,-0.5) -- (-0.2,-0.5) 
            -- (-0.2,-.1) -- (0.2, -.1) -- (0.2,-0.5)
            -- (0.4,-0.5) -- (0.4, 0.2) --(-0.4,0.2);
        \draw[fill=white] (-0.4,0.2) rectangle +(0.1,0.3);
        \draw[fill=white] (0.4,0.2) rectangle +(-0.1,0.3);

        \node (-cable) at (-0,-0.6) {};
        \node (-pcb) at (-0,0.6) {};
   }
}

\tikzset{
    JstXh4/.pic={
        % \draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        % \draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        % \draw [very thin, green] (-1,-1) grid (1,1);
        
        \draw [color=lightgray, line width=3pt,cap=round] (.45,0.3) -- (.45,-.45);
        \draw [color=lightgray, line width=3pt,cap=round] (.15,0.3) -- (.15,-.45);
        \draw [color=lightgray, line width=3pt,cap=round] (-.15,0.3) -- (-.15,-.45);
        \draw [color=lightgray, line width=3pt,cap=round] (-.45,0.3) -- (-.45,-.45);

        \draw[fill=white] (-0.7,0.2) -- (-0.7,-0.5) -- (-0.5,-0.5) 
            -- (-0.5,-.1) -- (-0.35,-.1) -- (-.35,-.45) 
            -- (.35,-.45) -- (.35,-.1)
            -- (0.5, -.1) -- (0.5,-0.5)
            -- (0.7,-0.5) -- (0.7, 0.2) --(-0.7,0.2);

        \draw[fill=white] (-0.7,0.2) rectangle +(0.1,0.3);
        \draw[fill=white] (0.7,0.2) rectangle +(-0.1,0.3);

        \node (-cable) at (-0,-0.6) {};
        \node (-pcb) at (-0,0.6) {};
        \node (-p0) at (-.45,0.5) {};
        \node (-p1) at (-.15,0.5) {};
        \node (-p2) at (.15,0.5) {};
        \node (-p3) at (.45,0.5) {};
        \node (-c0) at (-.45,-0.6) {};
        \node (-c1) at (-.15,-0.6) {};
        \node (-c2) at (.15,-0.6) {};
        \node (-c3) at (.45,-0.6) {};
   }
}

\tikzset{
    SmallDiode/.pic={
        %\draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        %\draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        %\draw [very thin, green] (-1,-1) grid (1,1);
        \draw (-0.2,0) -- (0.2,0);
        \draw [fill=black!75] (-0.1, -0.1) -- (0.1,0)
            -- (-0.1, 0.1) --(-0.1, -0.1) ;
        \draw (0.1,0.1) -- (0.1,-0.1);
        \node[](-p) at (-0.2,0) {};
        \node[](-n) at (0.2,0) {};
    
   }
}

\tikzset{
    pics/JumperPadNO/.style ={
      code = {
      
        \draw [gray, fill=gray!75] (-0.5,0.2) -- (-0.5,0.6) arc (180:90:0.3)
            -- (0.2,0.9) arc (90:0:.3) -- (0.5,0.2)
            -- (-0.5,0.2);
        
        \draw [gray, fill=gray!75] (-0.5,-0.2) -- (-0.5,-0.6) arc (-180:-90:0.3)
            -- (0.2,-0.9) arc (-90:0:.3) -- (0.5,-0.2)
            -- (-0.5,-0.2);
        
    }}
}
\tikzset{
    pics/JumperPadNC/.style ={
      code = {
        \draw [yellow, fill=yellow!75] (-0.2,0.3) rectangle (0.2,-0.3);
        
        \pic[] at (0,0) {JumperPadNO};
        
        \node[](-cut1) at (-0.5,0) {};
        \node[](-cut2) at (0.5,0) {};
    }}
}


\tikzset{
    pics/SmallLed/.style args={#1}{
      code = {
        \draw (-0.2,0) -- (0.2,0);
        \draw [fill=#1!75] (-0.1, -0.1) -- (0.1,0)
            -- (-0.1, 0.1) --(-0.1, -0.1) ;
        \draw (0.1,0.1) -- (0.1,-0.1);
        
        \draw [] (0.04,0.06) -- +(0.04,0.08);
        \draw [] (0.0,0.08) -- +(0.04,0.08);
        
        \node[](-p) at (-0.2,0) {};
        \node[](-n) at (0.2,0) {};
    }}
}

\tikzset{
    pics/SmallOpto/.style={
      code = {
        % \draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        % \draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        % \draw [very thin, green] (-1,-1) grid (1,1);
        \pic[rotate=-90] at (-0.2,0) {SmallLed=black};
        \draw[line width=1pt] (0.1,0.2) -- (0.1,-0.2);
        \draw[] (0.3,0.3) -- (0.1,0.1);
        \draw[] (0.3,-0.3) -- (0.1,-0.1);
        \draw[fill=black!75, cap=round] (0.3,-0.25) -- (0.3,-0.3)
            -- (0.25,-0.3) -- (0.3,-0.25);
        
    }}
}

\tikzset{
    pics/DccIface/.style={
      code = {
        % \draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        % \draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        % \draw [very thin, green] (-1,-1) grid (1,1);
        \pic[] at (0.8,0) {SmallOpto};
        \draw[] (-1.3,-0.5) rectangle +(2.6,1);

        \node[above] at (-0.5,0){DCC};
        \node[below] at (-0.5,0){Interface};

        \node[](-east-out)at(1.4,0.15){};
        \node[](-east-in)at(1.4,-0.15){};
        \node[](-east)at(1.4,0){};

        \node[](-west-out)at(-1.4,-0.15){};
        \node[](-west-in)at(-1.4,0.15){};
        \node[](-west)at(-1.4,0){};
        
    }}
}

\tikzset{
    DiodeBrigde/.pic={
        %\draw [step=0.1,very thin, yellow] (-1,-1) grid (1,1);
        %\draw [step=0.5,very thin, red] (-1,-1) grid (1,1);
        %\draw [very thin, green] (-1,-1) grid (1,1);
        \draw  (-0.6, -0.3) rectangle +(1.2,0.6); 
        \pic[scale=0.5, rotate=45]  at (-0.1,0.1) {SmallDiode};
        \pic[scale=0.5, rotate=45]  at (0.1,-0.1) {SmallDiode};
        \pic[scale=0.5, rotate=-45]  at (0.1,0.1) {SmallDiode};
        \pic[scale=0.5, rotate=-45]  at (-0.1,-0.1) {SmallDiode};

        \node[scale=0.25] at (0.25,0) {$+$};
        \node[scale=0.25] at (-0.25,0) {$-$};
        \node[scale=0.25] at (0,0.25) {$\sim$};
        \node[scale=0.25] at (0,-0.25) {$\sim$};
 
        \node[scale=0.5] at (-0.45,0) {AC};
        \node[scale=0.5] at (0.45,0) {CC};
        \node(-ac) at (-0.7,0) {};
        \node(-cc) at (0.7,0) {};
   }
}

