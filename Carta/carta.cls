

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{carta}[2017/03/15]

% Documento con espacios vacíos
\newif\ifvacio
\DeclareOption{vacio}{\vaciotrue}

% Cualquier otra opción se pasa a 'memoir'
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}

% Procesar las opciones
\ProcessOptions\relax

% Cargar la clase base ('article')
% --------------------------------

\LoadClass[12pt, letterpaper]{letter}

% Paquetes requeridos
% -------------------
% General
\RequirePackage[spanish]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lipsum}
\RequirePackage{array}
\RequirePackage{multicol}

% Nuevos comandos especiales
% --------------------------
\newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}}

\newcommand{\linea}[1]{$\vcenter{\hbox{\rule{#1}{0.1pt}}}$}

\newcommand{\ajustado}{\itemsep0pt\parskip0pt\parsep0pt}

\ifvacio
	\newcommand{\seleccionar}{\raisebox{4pt}{\circle{8}}}
\else
	\newcommand{\seleccionar}[1]{\raisebox{4pt}{\circle#1{8}}}
\fi

% Tipografía
% ----------
\usepackage{libertine}
\usepackage[T1]{fontenc}
\renewcommand*{\ttdefault}{cmtt}

% Formato de la página y área de escritura
% ----------------------------------------
\usepackage{geometry}                         
	\geometry{left=21mm,right=21mm,top=21mm,bottom=21mm}
    
% Textos predefinidos

\newcommand{\introestudiante}{Estudiante Escuela de Ingeniería Eléctrica}
\newcommand{\introguia}{Docente Escuela de Ingeniería Eléctrica}
\newcommand{\introdirector}{Director Escuela de Ingeniería Eléctrica}

% Definición de datos globales 
% ------------------------------


\def\autor#1{\gdef\@autor{#1}}
\def\carne#1{\gdef\@carne{#1}}
\def\guia#1{\gdef\@guia{#1}}
\def\director#1{\gdef\@director{#1}}
\def\fecha#1{\gdef\@fecha{#1}}
\def\sem#1{\gdef\@sem{#1}}
\def\ano#1{\gdef\@ano{#1}}



% Formato de las firmas
% ------------------------

\newcommand{\firmas}{
\begin{center}
\vspace{4em}
\begin{tabular}{C{8cm}C{8cm}}
	\vspace{3em}\linea{7cm}
	& \vspace{3em}\linea{7cm}
	\\
	\ifvacio\else\normalfont\@guia\fi
	& \ifvacio\else\normalfont\@autor\fi 
	\\ 
	\itshape\introguia \vspace{4em}
	& \itshape\introestudiante \vspace{4em}
	\\ 
	\vspace{3em}
	\linea{7cm} 
	& 
	\\
	\ifvacio\else\normalfont\@director\fi
	& 
	\\ 
	\itshape\introdirector
	&
\end{tabular}
\end{center}
}

%%%%%%%%%
\endinput
%%%%%%%%%
