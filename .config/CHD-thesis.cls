%
%  Copyright 2023-2024 Danvilig-X
%
%  This work may be distributed and/or modified under the
%  conditions of the LaTeX Project Public License, either version 1.3
%  of this license or (at your option) any later version.
%  The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
%  and version 1.3 or later is part of all distributions of LaTeX
%  version 2005/12/01 or later.
%
%  The Current Maintainer of this work is Danvilig-X(danvilig@chd.edu.cn).
%
%  This work consists of the files CHD-thesis.cls.
%

%%%%%%%%%%%% cls 结构 %%%%%%%%%%%%%%
%% BASIC            %% 基本设置   %%
%% UTILITIES        %% 必需组件   %%
%% MATH & SYMBOLS   %% 数学符号   %%
%% PAGES & GEOMETRY %% 页面和编号 %%
%% FONTS            %% 字体       %%
%% VARIABLES        %% 变量       %%
%% ENVIRONMENTS     %% 基本环境   %%
%% COMPONETS        %% 文章结构   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                         BASIC                             %%%%%%%%%%
%%%%%%%%%%                        基本设置                           %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% document class information %%%
%%% 文档类信息 %%%
%%% 本模板基于XJTU-thesis(西安交通大学论文模板)修改得到 %%%
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{expl3}
\ProvidesClass{CHD-thesis}[2023/01/8 0.1.5 Chang'an University Template]
\def\CHDthesis{CHD-thesis}
\def\meta@version{0.1.5}
\def\metaversion{\meta@version}


%%% cls options %%%
%%% 文档类参数 %%%
\newif\iftyp@report           \typ@reportfalse
\newif\iftyp@slide            \typ@slidefalse
\newif\iftyp@bachelor         \typ@bachelorfalse
\newif\iftyp@master           \typ@masterfalse
\newif\iftyp@doctor           \typ@doctorfalse
\newif\ifthesis@blind         \thesis@blindfalse
\newif\ifthesis@english       \thesis@englishfalse
% \newif\ifthesis@pdflinks      \thesis@pdflinksfalse
% \newif\ifthesis@colorlinks    \thesis@colorlinksfalse

\DeclareOption{report}      {\typ@reporttrue}
\DeclareOption{bachelor}    {\typ@bachelortrue}
\DeclareOption{master}      {\typ@mastertrue}
\DeclareOption{doctor}      {\typ@doctortrue}
\DeclareOption{blind}       {\thesis@blindtrue}
\DeclareOption{english}     {\thesis@englishtrue}

\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{book}
}
\ProcessOptions\relax

\LoadClass[10.5pt,twoside,openany]{book}
\iftyp@slide\relax\else
  \iftyp@report\relax\else
    \iftyp@bachelor\relax\else
      \iftyp@master\relax\else
        \iftyp@doctor\relax\else
          \ClassError{CHD-thesis}%
            {You have to assign one of these options for this document: report, slide, bachelor, master or doctor.}{}
        \fi
      \fi
    \fi
  \fi
\fi

%%% compiler options %%%
%%% 编译器设置 %%%
\RequirePackage{ifxetex}
\RequireXeTeX




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                        UTILITIES                          %%%%%%%%%%
%%%%%%%%%%                        必需组件                           %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% color %%%
%%% 颜色 %%%
% \RequirePackage{color}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.92,0.92,0.92}
\definecolor{dimgray}{rgb}{0.9,0.9,0.9}
\definecolor{columbiablue}{rgb}{0.61, 0.87, 1.0}
%%% tikz %%%
\RequirePackage{tikz}
\RequirePackage{tikz-3dplot}
\usetikzlibrary{shapes,arrows,positioning,calc}


%%% chinese characters %%%
%%% 定义一些中文字符 %%%
\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}


%%% misc %%%
%%% 杂项 %%%
\RequirePackage{zhnumber}       % 中文数字
\RequirePackage{datetime2}      % 日期时间
\RequirePackage{indentfirst}    % 缩进
\RequirePackage{setspace}       % 缩进
\RequirePackage{etoolbox}
\RequirePackage{xpatch}
\RequirePackage{xparse}         % 多默认参数命令（需要LaTeX3）
\RequirePackage{calc}
\RequirePackage[normalem]{ulem}
\RequirePackage{ifthen}
\RequirePackage{realboxes}
\RequirePackage{blindtext}      % 生成测试文本
\RequirePackage{zhlipsum}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                     MATH & SYMBOLS                        %%%%%%%%%%
%%%%%%%%%%                        数学符号                           %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% AMS %%%
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{thmtools}
\RequirePackage[xindy,symbols,order=letter,nogroupskip]{glossaries}


%%% Symbols %%%
%%% 符号相关 %%%
\RequirePackage{upgreek}
\RequirePackage{pifont}
\RequirePackage{array}
\RequirePackage{commath}
\RequirePackage{siunitx}
\RequirePackage{mathtools}
\RequirePackage{mathspec}

\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
\newcommand*{\diff}{\mathop{}\!\mathrm{d}}
\newcommand{\mbf}[1]{\mathbf{#1}}
\newcommand{\Exp}{\mathrm{E}}
\newcommand{\seq}[2]{#1_1,#1_2,\cdots,#1_#2}
\newcommand{\iprod}[2]{\langle #1,#2 \rangle}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                     PAGES & GEOMETRY                      %%%%%%%%%%
%%%%%%%%%%                        页面和编号                         %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% GEOMETRY %%%
%%% 页边距 %%%
\RequirePackage[
  a4paper,
  left=26mm,
  right=26mm,
  top=2.1cm,
  bottom=2cm,
  includehead,
  includefoot,
  asymmetric,
  bindingoffset=0cm,
]{geometry}

\predisplaypenalty=0
\allowdisplaybreaks[4]
\raggedbottom


%%% PAGE %%%
%%% 页面 %%%
\RequirePackage{ifoddpage}
\RequirePackage{emptypage}
\RequirePackage{pdfpages}


\newcommand\pagecheck{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                          FONTS                            %%%%%%%%%%
%%%%%%%%%%                          字体                             %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{xeCJK}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage{anyfontsize}
\RequirePackage{mathrsfs}
\RequirePackage{amsfonts}
\RequirePackage[12pt]{ctex}

\renewcommand{\baselinestretch}{1.4}
\renewcommand{\CJKglue}{\hskip 0.56pt plus 0.08\baselineskip}

\setlength{\parindent}{2.1em}
\setlength{\parskip}{3pt plus1pt minus1pt}
\setlength{\intextsep}{9pt}
\setlength{\extrarowheight}{2pt}

\linespread{1.33}

%%% Default fonts for different fonts %%%
%%% 设置默认字体 %%%

\setCJKmainfont[AutoFakeBold=true,Path=.config/fonts/]{fzsong.ttf}
\newfontfamily{\heiti@letter}[Path=.config/fonts/]{fzhei.ttf}
\newfontfamily{\songti@letter}[Path=.config/fonts/]{fzsong.ttf}
\setallmainfonts[
  BoldFont=timesbd.ttf,
  ItalicFont=timesi.ttf,
  BoldItalicFont=timesbi.ttf,
  Path=.config/fonts/,
]{times.ttf}



%%% Rename Chineses Font size %%%
%%% 定义中文字号 %%%
\newcommand{\erhao}{\fontsize{22pt}{22pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{16pt}\selectfont}      % 三号, 1.0倍行距
\newcommand{\xiaosan}{\fontsize{15pt}{15pt}\selectfont}     % 小三, 1.0倍行距
\newcommand{\sihao}{\fontsize{14pt}{14pt}\selectfont}       % 四号, 1.0倍行距
\newcommand{\xiaosi}{\fontsize{12pt}{12pt}\selectfont}      % 小四, 1.0倍行距
\newcommand{\wuhao}{\fontsize{10.5pt}{10.5pt}\selectfont}   % 五号, 1.0倍行距
\newcommand{\xiaowu}{\fontsize{9pt}{9pt}\selectfont}        % 小五, 1.0倍行距




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                          VARIABLES                        %%%%%%%%%%
%%%%%%%%%%                          变量                             %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter

%%% basic varibales %%%
%%% 基本信息变量 %%%

%% 中文 %%
\newcommand{\zh@thetitle}{\chinesespace}
\newcommand{\zh@thedegree}{\chinesespace}
\newcommand{\zh@theauthor}{\chinesespace}
\newcommand{\zh@theadvisor}{\chinesespace}
\newcommand{\zh@theadvisorassociate}{\chinesespace}
\newcommand{\zh@theadvisorteam}{\chinesespace}
\newcommand{\zh@thesubmitdate}{\chinesespace}
\newcommand{\zh@thesubject}{\chinesespace}
\newcommand{\zh@UNIV}{长安大学}
\newcommand{\zh@themajor}{\chinesespace}
\newcommand{\zh@theadminclass}{\chinesespace}
\newcommand{\zh@theschool}{\chinesespace}
\newcommand{\zh@thedoctime}{\chinesespace}

%% 英文 %%
\newcommand{\en@thetitle}{\chinesespace}
\newcommand{\en@thedegree}{\chinesespace}
\newcommand{\en@theauthor}{\chinesespace}
\newcommand{\en@theadvisor}{\chinesespace}
\newcommand{\en@theadvisorassociate}{\chinesespace}
\newcommand{\en@theadvisorteam}{\chinesespace}
\newcommand{\en@thesubmitdate}{\chinesespace}
\newcommand{\en@thesubject}{\chinesespace}
\newcommand{\en@UNIV}{Chang'an University}
\newcommand{\en@themajor}{\chinesespace}
\newcommand{\en@theadminclass}{\chinesespace}
\newcommand{\en@theschool}{\chinesespace}

%% 不区分中英文或只有一种 %%
\newcommand{\zh@thedefensedate}{\chinesespace}
\newcommand{\zh@thedefenseloc}{\chinesespace}
\newcommand{\zh@thestuid}{\chinesespace}

%% 输入基本信息 %%
\renewcommand{\title}[2]{
  \renewcommand{\zh@thetitle}{#1}
  \renewcommand{\en@thetitle}{#2}
}
\newcommand{\degree}[2]{
  \renewcommand{\zh@thedegree}{#1}
  \renewcommand{\en@thedegree}{#2}
}
\renewcommand{\author}[2]{
  \renewcommand{\zh@theauthor}{#1}
  \renewcommand{\en@theauthor}{#2}
}
\newcommand{\advisor}[4]{
  \renewcommand{\zh@theadvisor}{#1 #2}
  \renewcommand{\en@theadvisor}{#4 #3}
}
\newcommand{\advisorassociate}[4]{
  \renewcommand{\zh@theadvisorassociate}{#1 #2}
  \renewcommand{\en@theadvisorassociate}{#4 #3}
}
\newcommand{\advisorteam}[2]{
  \renewcommand{\zh@theadvisorteam}{#1}
  \renewcommand{\en@theadvisorteam}{#2}
}
\newcommand{\defensedate}[3]{
  \renewcommand{\zh@thedefensedate}{#1 年 #2 月 #3 日}
}
\newcommand{\doctime}[2]{
  \renewcommand{\zh@thedoctime}{#1年#2月}
}
\newcommand{\defenseloc}[1]{
  \renewcommand{\zh@thedefenseloc}{#1}
}
\newcommand{\subject}[2]{
  \renewcommand{\zh@thesubject}{#1}
  \renewcommand{\en@thesubject}{#2}
}
\newcommand{\stumajor}[2]{
  \renewcommand{\zh@themajor}{#1}
  \renewcommand{\en@themajor}{#2}
}
\newcommand{\adminclass}[2]{
  \renewcommand{\zh@theadminclass}{#1}
  \renewcommand{\en@theadminclass}{#2}
}
\newcommand{\school}[2]{
  \renewcommand{\zh@theschool}{#1}
  \renewcommand{\en@theschool}{#2}
}
\newcommand{\stuid}[1]{
  \renewcommand{\zh@thestuid}{#1}
}
\newcommand\monthnametwod[1]{\ifnum #1 < 10 0\fi #1}

\newcommand{\monthname}[1]{
\ifcase#1 \or January \or February \or March \or April \or May \or June
\or July \or August \or September \or October \or November \or December
\fi}
\NewDocumentCommand{\submitdate}{O{\the\year} O{\the\month}}{
  \renewcommand{\zh@thesubmitdate}{#1 年 \monthnametwod{#2} 月}
  \renewcommand{\en@thesubmitdate}{\monthname{#2} #1}
}


%%% variables based on class options %%%
%%% 定义不同选项下的变量 %%%

%% 学士 %%
\iftyp@bachelor
  \def\chinesedegreename{本科}
  \def\englishdegreename{Bachelor}
  \def\chinesebooktitle{本科毕业设计（论文）}
  \def\englishbooktitle{Bachelor Thesis}
  \def\englishthesistype{A thesis}
\fi

%% 硕士 %%
\iftyp@master
  \def\chinesedegreename{硕士}
  \def\englishdegreename{Master}
  \def\chinesebooktitle{硕士学位论文}
  \def\englishbooktitle{Master Thesis}
  \def\englishthesistype{A thesis}
  \def\englishthesistypea{THESIS}
\fi

%% 博士 %%
\iftyp@doctor
  \def\chinesedegreename{博士}
  \def\englishdegreename{Doctor}
  \def\chinesebooktitle{博士学位论文}
  \def\englishbooktitle{Doctoral Dissertation}
  \def\englishthesistype{A dissertation}
  \def\englishthesistypea{DISSERTATION}
\fi

%% 页眉变量 %%
\ifthesis@english
  \def\display@header{\englishbooktitle~of \en@UNIV}
\else
  \def\display@header{\zh@UNIV\chinesebooktitle}
\fi




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                          ENVIRONMENTS                     %%%%%%%%%%
%%%%%%%%%%                          基本环境                         %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%% figures %%%
%%% 图片 %%%
\RequirePackage{graphicx}
\graphicspath{{./Figures/}{./.cofig/Icons/}}


%%% algorithm %%%
%%% 算法环境 %%%
\RequirePackage[ruled, algochapter,linesnumbered]{algorithm2e}
\SetKwRepeat{Do}{do}{while}


%%% colorbox %%%
%%% colobox %%%
\RequirePackage{tcolorbox}
\tcbuselibrary{listings,skins,breakable,xparse}
\newtcblisting{texcode}[2][]{
  #1,
  breakable,
  bicolor, colbacklower=white,
  listing options={
    style=tcblatex,
    keywordstyle=\color{blue},
    commentstyle=\color{green!50!black},
    numbers=none,
    numberstyle=\tiny\color{red!75!black}\emptyaccsupp,
    emptylines=1,
    escapeinside=
  },
}
\newtcblisting{texcodeonly}[2][]{
  #1,
  breakable,
  bicolor, colbacklower=white,
  listing only,
  listing options={
    style=tcblatex,
    keywordstyle=\color{blue},
    commentstyle=\color{green!50!black},
    numbers=none,
    numberstyle=\tiny\color{red!75!black}\emptyaccsupp,
    emptylines=1,
    escapeinside=
  },
}

%%% codes %%%
%%% 代码环境 %%%
\RequirePackage{listings}
\lstset{basicstyle = \ttfamily}

\lstdefinestyle{code}{
    backgroundcolor=\color{backcolour},     % 颜色
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\heiti\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=t,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    xleftmargin=10pt,
    framexleftmargin=10pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2,
    frame=tb,
    morekeywords = {as},
    deletendkeywords = {},
}

\DeclareDocumentCommand{\clist}{O{dimgray} v}{%
    \Colorbox{#1}{\csname lstinline\endcsname!#2!}%
}

%%% enumerate %%%
%%% 枚举环境 %%%
\RequirePackage{enumitem}
\setitemize{leftmargin=3em,itemsep=0em,partopsep=0em,parsep=0em,topsep=-0em}
\setenumerate{leftmargin=3.2em,itemsep=0em,partopsep=0em,parsep=0em,topsep=0em}


%%% theorem and proof %%%
%%% 定理与证明环境 %%%
\theoremstyle{plain}
\renewcommand{\qedsymbol}{$\blacksquare$}
\let\proof\undefined
\let\theorem\undefined
\declaretheoremstyle[%
  spaceabove=2pt, spacebelow=2pt,
  postheadspace=0.5em, headindent=0em,
  headpunct={},
]{style_theorem}
\declaretheoremstyle[%
  spaceabove=2pt, spacebelow=2pt,
  postheadspace=0.5em, headindent=2.2em,
  qed=\qedsymbol, headpunct={:},
]{style_proof}

\ifthesis@english
  \declaretheorem[name={Proof},style=style_proof,unnumbered,preheadhook={\setlength{\parindent}{5.4em}}]{proof}
  \declaretheorem[name={Theorem},style=style_theorem,numberwithin=chapter]{theorem}
  \declaretheorem[name={Axiom},style=style_theorem,numberlike=theorem]{axiom}
  \declaretheorem[name={Corollary},style=style_theorem,numberlike=theorem]{corollary}
  \declaretheorem[name={Lemma},style=style_theorem,numberlike=theorem]{lemma}
  \declaretheorem[name={Definition},style=style_theorem,numberlike=theorem]{definition}
  \declaretheorem[name={Example},style=style_theorem,numberlike=theorem]{example}
  \declaretheorem[name={Proposition},style=style_theorem,numberlike=theorem]{proposition}
  \declaretheorem[name={Assumption},style=style_theorem,numberlike=theorem]{assumption}
  \declaretheorem[name={Remark},style=style_theorem,numberlike=theorem]{remark}
  \declaretheorem[name={Problem},style=style_theorem,numberlike=theorem]{problem}
  \declaretheorem[name={Conjecture},style=style_theorem,numberlike=theorem]{conjecture}
\else
  \declaretheorem[name={证明},style=style_proof,unnumbered,preheadhook={\setlength{\parindent}{5.1em}}]{proof}
  \declaretheorem[name={定理},style=style_theorem,numberwithin=chapter]{theorem}
  \declaretheorem[name={公理},style=style_theorem,numberlike=theorem]{axiom}
  \declaretheorem[name={推论},style=style_theorem,numberlike=theorem]{corollary}
  \declaretheorem[name={引理},style=style_theorem,numberlike=theorem]{lemma}
  \declaretheorem[name={定义},style=style_theorem,numberlike=theorem]{definition}
  \declaretheorem[name={例子},style=style_theorem,numberlike=theorem]{example}
  \declaretheorem[name={命题},style=style_theorem,numberlike=theorem]{proposition}
  \declaretheorem[name={假设},style=style_theorem,numberlike=theorem]{assumption}
  \declaretheorem[name={注},style=style_theorem,numberlike=theorem]{remark}
  \declaretheorem[name={问题},style=style_theorem,numberlike=theorem]{problem}
  \declaretheorem[name={猜想},style=style_theorem,numberlike=theorem]{conjecture}
\fi


%%% footnote %%%
%%% 脚注 %%%
\RequirePackage[flushmargin,bottom,perpage,symbol*]{footmisc}

\DefineFNsymbols{circled}{
  {\ding{192}}{\ding{193}}{\ding{194}}
	{\ding{195}}{\ding{196}}{\ding{197}}
  {\ding{198}}{\ding{199}}{\ding{200}}{\ding{201}}}
\setfnsymbol{circled}

\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{13.5pt}

\renewcommand{\footnotesize}{\fontsize{10.5pt}{10.5pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9pt}{11.7pt}\selectfont}

% \newcommand{\astfootnote}[1]{
%   \let\oldthefootnote=\thefootnote
%   \let\oldfootnotelayout=\footnotelayout
%   \renewcommand\footnotelayout{\fontsize{10.7pt}{10.7pt}\selectfont}
%   \renewcommand{\thefootnote}{$\ast$}
%   \hspace{-0.5em}\footnote{#1}\hspace{-0.15em}
%   \let\thefootnote=\oldthefootnote
%   \let\footnotelayout=\oldfootnotelayout
% }

\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}


%%% head & foot %%%
%%% 页眉页脚 %%%
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}

%\setlength{\headheight}{15mm}
\setlength{\voffset}{-10mm}                        
\setlength{\topmargin}{0mm}
\setlength{\headheight}{5mm}
%\setlength{\headsep}{-2mm}
%\setlength{\footskip}{10mm}

\renewcommand{\headrule}{\hrule height 0.8pt}
%\renewcommand{\headrule}{\hrule height 0.5pt \vspace{0.8pt}\hrule height 0.5pt}
\renewcommand{\headrulewidth}{0.65pt}
\renewcommand{\footrulewidth}{0pt}

\fancyhf{}
\fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}



%%% title %%%
%%% 各级标题 %%%
\RequirePackage{titlesec}



% 根据2021年模板，共有7级标题
\setcounter{secnumdepth}{7}
% 添加第7级标题
\titleclass{\subsubparagraph}{straight}[\subparagraph]
\newcounter{subsubparagraph}
\renewcommand{\thesubsubparagraph}{\Alph{subsubparagraph}}

\titleformat{\chapter}[block]
  {\centering\fontsize{18pt}{18pt}\heiti\bfseries\thispagestyle{fancy}}{第\chinese{chapter}章}{1em}{}
\titleformat{\section}[block]
  {\fontsize{15pt}{15pt}\heiti\bfseries}{\arabic{chapter}.\arabic{section}}{7pt}{}
\titleformat{\subsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\bf}{\arabic{chapter}.\arabic{section}.\arabic{subsection}}{7pt}{}
\titleformat{\subsubsection}[block]
  {\fontsize{10.5pt}{10.5pt}\selectfont}{\arabic{subsubsection}）}{6pt}{}
\titleformat{\paragraph}[block]
  {\fontsize{10.5pt}{10.5pt}\selectfont}{（\arabic{paragraph}）}{6pt}{}
\titleformat{\subparagraph}[block]
  {\fontsize{10.5pt}{10.5pt}\selectfont}{\alph{subparagraph}）}{6pt}{}
\titleformat{\subsubparagraph}[block]
  {\fontsize{10.5pt}{10.5pt}\selectfont}{（ \alph{subsubparagraph}）}{6pt}{}

\titlespacing{\chapter}{0pt}{-8mm}{14pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{2em}{12pt}{6pt}
\titlespacing{\subsubsection}{2em}{12pt}{6pt}
\titlespacing{\paragraph}{2em}{12pt}{6pt}
\titlespacing{\subparagraph}{2em}{12pt}{6pt}
\titlespacing{\subsubparagraph}{2em}{12pt}{6pt}

%%% float %%%
%%% 浮动体 %%%
\RequirePackage{float}
\RequirePackage{newfloat}
\RequirePackage{multirow}
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{tabularx}
\RequirePackage{xltabular}
\RequirePackage{booktabs}

% 三线表样式
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{1.0pt}
\setlength{\arrayrulewidth}{0.5pt}

\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcolumntype{Z}{>{\raggedleft\arraybackslash}X}
\tabcolsep=1ex
\tabulinesep=\tabcolsep

% tikz
\newlength\tikzboxwidth
\newlength\tikzboxheight
\newcommand\tikzbox[1]{%
  \settowidth\tikzboxwidth{#1}%
  \settoheight\tikzboxheight{#1}%
  \begin{tikzpicture}
  \path[use as bounding box]
    (-0.5\tikzboxwidth,-0.5\tikzboxheight)rectangle
    (0.5\tikzboxwidth,0.5\tikzboxheight);
  \node[inner sep=\tabcolsep+0.5\arrayrulewidth,line width=0.5mm,draw=black]
    at(0,0){#1};
  \end{tikzpicture}%
}

\def\hlinew#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
  \reserved@a\@xhline}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}%

\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\AtBeginEnvironment{table}{
  \def\@floatboxreset{\centering}
}
\AtBeginEnvironment{tabular}{\wuhao}
\AtBeginEnvironment{tabularx}{\wuhao}
\AtBeginEnvironment{xltabular}{\wuhao}


%%% caption %%%
%%% 浮动体标题 %%%
\RequirePackage{caption}
\RequirePackage[labelformat=simple]{subcaption}

\captionsetup{figurewithin=chapter}
\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42pt}

\captionsetup[figure]{aboveskip=6pt, belowskip=0pt, labelsep=space,font=small}
\captionsetup[table]{aboveskip=6pt, belowskip=0pt, labelsep=space,font=small}
\captionsetup[sub]{font=small, belowskip=6pt}
\captionsetup[lstlisting]{font=small,labelfont=bf,singlelinecheck=off,labelsep=space}

\newcommand{\floatcontinue}[1]{\end{figure}\clearpage\begin{figure}[#1]\ContinuedFloat}

\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}
\renewcommand{\thesubfigure}{(\alph{subfigure})}

\AtBeginDocument{
  \renewcommand\thelstlisting{\arabic{chapter}-\arabic{lstlisting}}

}
\renewcommand{\thealgocf}{\arabic{chapter}-\arabic{algocf}}

\ifthesis@english
  \renewcommand{\figurename}{Figure}
  \renewcommand{\tablename}{Table}
  \renewcommand{\listfigurename}{List of Figures}
  \renewcommand{\listtablename}{List of Tables}
  \renewcommand{\lstlistingname}{Code}
  \SetAlgorithmName{Algorithm}{Algorithm}{List of Algorithms}
\else
  \renewcommand{\figurename}{图}
  \renewcommand{\tablename}{表}
  \renewcommand{\listfigurename}{图目录}
  \renewcommand{\listtablename}{表目录}
  \renewcommand{\lstlistingname}{源码}
  \SetAlgorithmName{算法}{算法}{算法列表}
\fi

\SetAlgoCaptionSeparator{\null}
\newcommand{\AlgoCapNameFmt}[1]{\fontsize{10.5pt}{10.5pt}\selectfont #1}
\SetAlgoCaptionLayout{AlgoCapNameFmt}


%%% CROSSREF & HYPERLINK %%%
%%% 交叉引用和超链接 %%%
\setlist{noitemsep}
\setlist{nolistsep}

\RequirePackage[hyphens]{xurl}
\urlstyle{rm}

\RequirePackage[
    hyperfootnotes=false,
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksdepth=2,
    breaklinks=true,
    pdfborder={0 0 0},
    citebordercolor={0 0 1},
    colorlinks=false,
    citecolor=black,
    linkcolor=black,
    urlcolor=black,
    psdextra=true,
]{hyperref}
\RequirePackage{bookmark}
\pdfstringdefDisableCommands{\let\backslash\textbackslash}
\hypersetup{bookmarksdepth=2}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                        COMPONETS                          %%%%%%%%%%
%%%%%%%%%%                        文章结构                           %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\thesistitles}{}
\newcommand{\thesiscommittes}{}
\newcommand{\thesisabstract}{}
\newcommand{\thesistableofcontens}{}
\newcommand{\thesisglossaries}{}
\newcommand{\thesisbody}{}
\newcommand{\thesisacknowledegment}{}
\newcommand{\thesisconclusion}{}
\newcommand{\thesisbibliography}{}
\newcommand{\thesisappendix}{}
\newcommand{\thesisachivements}{}
\newcommand{\thesisdecision}{}
\newcommand{\thesisreviewers}{}
\newcommand{\thesisdeclarations}{}

%%% title page %%%
%%% 题名页 %%%
\newcommand{\zhasscociateinfo}{
  \ifthenelse{\equal{\zh@theadvisorassociate}{\chinesespace}}{
    \ifthenelse{\equal{\zh@theadvisorteam}{\chinesespace}}{~}{
      导师团队：\zh@theadvisorteam\linebreak
    }
  }{
    合作导师：\zh@theadvisorassociate\linebreak
  }
}
\newcommand{\enasscociateinfo}{
  \ifthenelse{\equal{\en@theadvisorassociate}{\chinesespace}}{
    \ifthenelse{\equal{\en@theadvisorteam}{\chinesespace}}{~}{
      Supervisor Team: \en@theadvisorteam\linebreak
    }
  }{
    Associate Supervisor: \en@theadvisorassociate\linebreak
  }
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%                引用自thuthesis.cls(清华大学模板)             %%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newbox\thu@pad@box
\newcommand\thu@pad[2]{%
	\sbox\thu@pad@box{#2}%
	\ifdim \wd\thu@pad@box < #1\relax
	\makebox[#1][l]{\box\thu@pad@box}%
	\else
	\box\thu@pad@box
	\fi
}

\newcommand\thu@fixed@box[2]{%
	\begingroup
	\ifLuaTeX
	\ltjsetparameter{kanjiskip = {0pt plus 2filll minus 1filll}}%
	\else
	\renewcommand\CJKglue{\hspace{0pt plus 2filll minus 1filll}}%
	\fi
	\makebox[#1][l]{#2}%
	\endgroup
}

\newcommand\thu@titlepage@info@tabular[4]{%
	\def\thu@info@item##1##2##3{%
		\ifx##3\@empty\else
		\thu@pad{#1}{\thu@fixed@box{#2}{##1}}%
		\thu@pad{#3}{：}%
		##2{##3}\\
		\fi
	}%
	\begin{tabular}{l}%
		\renewcommand\arraystretch{1}%
		#4%
	\end{tabular}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\thesistitles}{
  \thispagestyle{empty}
  \ifthesis@english
    \pdfbookmark{Title Page (Chinese)}{Title Page (Chinese)}
  \else
    \pdfbookmark{题名页}{Title Page (Chinese)}
  \fi
  
  {\includegraphics[height=2.2cm]{.config/icons/chdblacklogo.pdf}}
%  \parbox[t][1.2cm]{2.5cm}{}
  
  \begin{center}
    \includegraphics[width=11cm]{.config/icons/chd.pdf} \\[1cm]
    \fontsize{26pt}{26pt}\selectfont 二\hspace{16pt}〇\hspace{16pt}二\hspace{16pt}三\hspace{16pt}届\hspace{16pt}毕\hspace{16pt}业\hspace{16pt}论\hspace{16pt}文\\
    \vskip 2cm
    \erhao {\bfseries \zh@thetitle}\\
    \vskip 2cm
  \end{center}

	\begin{center}
	\thu@titlepage@info@tabular{2.8cm}{2.8cm}{0.82cm}{%
		\fontsize{16pt}{1}
		\thu@info@item{学院}{}{\zh@theschool}\\
		\fontsize{16pt}{1}
		\thu@info@item{专业}{}{\zh@thesubject}\\
		\fontsize{16pt}{1}
		\thu@info@item{姓名}{}{\zh@theauthor}\\
		\fontsize{16pt}{1}
		\thu@info@item{学号}{}{\sanhao \zh@thestuid}\\
		\fontsize{16pt}{1}
		\thu@info@item{指导教师}{}{\zh@theadvisor}\\
		\fontsize{16pt}{1}
		\thu@info@item{完成时间}{}{\sanhao \zh@thesubmitdate}\\
	}
	\end{center}

	\vskip 2cm
  \begin{center}\fontsize{16pt}{1}
  	\zh@thedoctime
  \end{center}

  \cleardoublepage
  
%  \thispagestyle{empty}
%  \ifthesis@english
%    \pdfbookmark{Title Page (English)}{Title Page (English)}
%  \else
%    \pdfbookmark{Title Page}{Title Page (English)}
%  \fi
%  \begin{center}
%    \vskip 1.2cm
%    \sanhao {\bfseries \en@thetitle}\\
%    \vskip 3.5cm
%    \begin{spacing}{2}\sanhao
%      \englishthesistype ~submitted to\\
%      \en@UNIV\\
%      in partial fulfillment of the requirements\\
%      for the degree of\\
%      \englishdegreename~of \en@thedegree\\
%    \end{spacing}
%    \vskip 6cm
%    \begin{spacing}{2}\sanhao
%      By\\
%      \en@theauthor\\
%      Supervisor: \en@theadvisor\\
%      \enasscociateinfo
%      \en@thesubject\\
%      \en@thesubmitdate\\
%    \end{spacing}
%  \end{center}
%  \cleardoublepage
}


%%% Defense Committee Pages %%%
%%% 答辩委员会页 %%%
\ExplSyntaxOn
\seq_new:N \g_defense_committee_seq
\seq_clear:N \g_defense_committee_seq
\NewDocumentCommand \addcommitteemember {m}{
    \seq_set_split:Nnn \l_tmpa_seq {,} {#1}
    \clist_set_from_seq:NN \l_tmpb_clist \l_tmpa_seq
    \seq_gput_right:Nx \g_defense_committee_seq \l_tmpb_clist
}

\tl_set:Nn \g_dc_tabular_tl {\sanhao}

\box_new:N \l_bp_set_to_box
\cs_new_protected:Npn \bp_box_set_to:NNn #1 #2 #3
  {
    \hbox_set:Nn \l_bp_set_to_box {#3}
    \dim_set:Nn #2 { #1 \l_bp_set_to_box }
    \box_set_eq:NN \l_bp_set_to_box \c_empty_box
  }
\cs_new_protected:Npn \bp_set_to_height:Nn { \bp_box_set_to:NNn \box_ht:N }
\cs_new_protected:Npn \bp_set_to_depth:Nn  { \bp_box_set_to:NNn \box_dp:N }
\cs_new_protected:Npn \bp_set_to_width:Nn  { \bp_box_set_to:NNn \box_wd:N }
\cs_new:Npn \WidthOfSpace { \tex_fontdimen:D 2 \tex_font:D }

\NewDocumentCommand \gencommitteelist {}{
  \fp_new:N \l_moriambar_ratio_fp
  \seq_gpop_left:NN \g_defense_committee_seq \l_dcc_tl

  \dim_new:N \spaceWidth
  \bp_set_to_width:Nn \spaceWidth {\clist_item:Nn \l_dcc_tl 1}

  \tl_gput_right:Nn \g_dc_tabular_tl {{\clist_item:Nn \l_dcc_tl 1 \clist_item:Nn \l_dcc_tl 3}：&\sanhao\underline{\parbox[t]{10em}{\clist_item:Nn \l_dcc_tl 2}}\xiaowu（注：主席）\\}

  \seq_map_variable:NNn \g_defense_committee_seq \i {
    \bp_set_to_width:Nn \spaceWidth {\clist_item:Nn \i 2}
    \tl_gput_right:Nn \g_dc_tabular_tl {\sanhao}
    \tl_gput_right:Nx \g_dc_tabular_tl {{\clist_item:Nn \i 1 \clist_item:Nn \i 3}：&}
    \tl_gput_right:Nn \g_dc_tabular_tl {\sanhao}
    \tl_gput_right:Nx \g_dc_tabular_tl {\underline{\exp_not:N \parbox[t]{10em}{\clist_item:Nn \i 2} }\\}
  }
}
\NewDocumentCommand \defencecommittelist {}{
  \tl_use:N \g_dc_tabular_tl
}
\ExplSyntaxOff

\renewcommand{\thesiscommittes}{
  \gencommitteelist
  \thispagestyle{empty}
  \ifthesis@english
    \pdfbookmark{Defense Committee}{Defense Committee}
  \else
    \pdfbookmark{答辩委员会}{Defense Committee-zh}
  \fi
  \parbox[t][5mm][t]{\textwidth}{}
  \begin{center}
    \sanhao \bfseries \chinesedegreename 学位论文答辩委员会
  \end{center}
  \vspace{2\baselineskip}
  \begin{spacing}{2.0}\begin{center}
    \sanhao \bfseries \zh@thetitle
  \end{center}\end{spacing}
  \vfill
  \begin{center}
    \renewcommand{\arraystretch}{2.5}
    \begin{tabular}{rl}
      \multicolumn{1}{l}{\sanhao 答辩人：\zh@theauthor}&\\
      \multicolumn{1}{l}{\sanhao 答辩委员会委员：}&\\
      \defencecommittelist
      \multicolumn{1}{l}{\sanhao 答辩时间：\zh@thedefensedate}&\\
      \multicolumn{2}{l}{\sanhao 答辩地点：\zh@thedefenseloc}\\
    \end{tabular}
    \renewcommand{\arraystretch}{1}
  \end{center}
  \cleardoublepage
}


%%% abstract %%%
%%% 摘要 %%%
\AtBeginEnvironment{document}{\pagenumbering{Roman}}
\newenvironment{chineseabstract}{
  \ifthesis@english
    \pdfbookmark{ABSTRACT (Chinese)}{ABSTRACT (Chinese)}
  \else
    \pdfbookmark{摘~~~~要}{ABSTRACT (Chinese)}
  \fi
  \setlength{\parskip}{0.25\baselineskip}

  \chapter*{\heiti\fontsize{16pt}{16pt}\textbf{摘~~~~要}}

  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{摘~~~~要}
  \addcontentsline{toe}{chapter}{ABSTRACT (Chinese)}
  \fontsize{12pt}{15.6pt}
  \hypersetup{bookmarksdepth=2}
  \markboth{摘~~~~要}{摘~~~~要}
}{\clearpage}


\newenvironment{englishabstract}{
  \ifthesis@english
    \pdfbookmark{ABSTRACT (English)}{ABSTRACT (English)}
  \else
    \pdfbookmark{ABSTRACT}{ABSTRACT (English)}
  \fi
  \echapter{}{}
  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{ABSTRACT}
  \addcontentsline{toe}{chapter}{ABSTRACT (English)}
  \fontsize{12pt}{15.6pt}
  \hypersetup{bookmarksdepth=2}
  \markboth{ABSTRACT}{ABSTRACT}
%  \setlength{\parindent}{0em}
  \setlength{\parskip}{0.35\baselineskip}
}{}

\newcommand{\keywordswithtype}[4]{
  \noindent
  \begin{minipage}[t]{\linewidth}
  \vspace{0.1\baselineskip}
  \parbox[t]{\widthof{#1}}{#1}
  \parbox[t]{\linewidth - \widthof{#1}}{\fontsize{12pt}{12pt}\selectfont #3}
  \\[0.5\baselineskip]
  \parbox[t]{\widthof{#2}}{#2}
  \parbox[t]{\linewidth - \widthof{#2}}{\fontsize{12pt}{12pt}\selectfont #4}
  \end{minipage}
}

\newcommand{\chskeywords}{\fontsize{12pt}{12pt}\heiti\selectfont \bfseries 关键词：}
\newcommand{\engkeywords}{\fontsize{12pt}{12pt}\selectfont \bfseries KEY WORDS:}

\iftyp@bachelor
  \newcommand{\chstypeofthesis}{\fontsize{12pt}{12pt}\selectfont \bfseries}
  \newcommand{\engtypeofthesis}{\fontsize{12pt}{12pt}\selectfont \bfseries}
  \newcommand{\chinesekeywordstype}[2]{\keywordswithtype{\chskeywords}{\chstypeofthesis}{#1}}
  \newcommand{\englishkeywordstype}[2]{\keywordswithtype{\engkeywords}{\engtypeofthesis}{#1}}
\else
  \newcommand{\chstypeofthesis}{\fontsize{12pt}{12pt}\selectfont \bfseries 论文类型：}
  \newcommand{\engtypeofthesis}{\fontsize{12pt}{12pt}\selectfont \bfseries TYPE OF \englishthesistypea:}
  \newcommand{\chinesekeywordstype}[2]{\keywordswithtype{\chskeywords}{\chstypeofthesis}{#1}{#2}}
  \newcommand{\englishkeywordstype}[2]{\keywordswithtype{\engkeywords}{\engtypeofthesis}{#1}{#2}}
\fi

\renewcommand{\thesisabstract}{
  \pagestyle{fancy}
  \fancyhf{}
  \setcounter{page}{1}
  \fancyhead[CE]{\fontsize{10.5pt}{12.6pt}\selectfont\display@header}
  \fancyhead[CO]{\fontsize{10.5pt}{12.6pt}\selectfont \leftmark}
  \fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \input{structure/abstract_chs}
  \cleardoublepage
  \input{structure/abstract_eng}
  \cleardoublepage
}


% %%% table of contents %%%
% %%% 目录 %%%


\RequirePackage{titletoc}
\RequirePackage{tocloft}
\setcounter{tocdepth}{2}

% 点间距
\renewcommand*\cftdotsep{0.75}
% 添加第7级标题
\newcommand*\l@subsubparagraph{\@dottedtocline{6}{14em}{7em}}
\newcommand{\toclevel@subsubparagraph}{6}
% 给章加点
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
% 目录前后距离
\renewcommand{\cftchapfont}{}
\renewcommand{\cftchappagefont}{}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftbeforechapskip}{0pt}

\cftsetindents{chap}{0em}{0.9em}
\cftsetindents{sec}{0.7em}{1.5em}
\cftsetindents{subsec}{1.4em}{2.3em}
\cftsetindents{subsubsec}{2.1em}{3.2em}



% 实在不想这样 但是没办法 手动添加 `声明'
\renewcommand\contentsname{目~~~~录}
\newcommand\tableofchinesecontents{
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{
  	\vspace{0.8mm}
    \heiti\fontsize{18pt}{18pt}\textbf{目~~~~录}
    \vspace{2.4mm}
    \@mkboth{
      \MakeUppercase\contentsname
    }{\MakeUppercase\contentsname}}
  \pdfbookmark{目~~~~录}{CONTENTS-zh}
  \@starttoc{toc}
  \if@restonecol\twocolumn\fi
%  \noindent 声明
}

\newcommand\engcontentsname{CONTENTS}
\newcommand\tableofengcontents{
  \if@twocolumn
    \@restonecoltrue\onecolumn
  \else
    \@restonecolfalse
  \fi
  \chapter*{
    \engcontentsname
    \vspace{1.4mm}
    \@mkboth{
      \MakeUppercase\engcontentsname
    }{\MakeUppercase\engcontentsname}}
  \pdfbookmark{\engcontentsname}{\engcontentsname}
  \@starttoc{toe}
  \if@restonecol\twocolumn\fi  
  \noindent Declarations
}
\newcommand\addengcontents[2]{%
    \addcontentsline{toe}{#1}{\protect\numberline{\csname the#1\endcsname}#2}
}
\newcommand\addchscontents[2]{%
    \addcontentsline{toc}{#1}{\protect\numberline{\csname the#1\endcsname}#2}
}
\newcommand\addengappendice[2]{%
    \addcontentsline{toe}{#1}{theappendix}#2
}

\renewcommand{\thesistableofcontens}{
  \fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \begin{spacing}{1}
  \tableofchinesecontents
%  \clearpage
%  \tableofengcontents
  \cleardoublepage
  \end{spacing}
}
\def\temp{\relax}
\let\temp\addcontentsline
\gdef\addcontentsline{\phantomsection\temp}
\gdef\hitempty{}

%%% glossaries %%%
%%% 主要符号表 %%%
\renewcommand*{\glossarypreamble}{\vspace{-9pt}}
\newglossarystyle{long-chd}{
  \renewenvironment{theglossary}%
    {\begin{longtable}{lp{.7\textwidth}}}%
    {\end{longtable}}%

  \renewcommand*{\glossaryheader}{}%
  \renewcommand*{\glsgroupheading}[1]{}%
  \renewcommand{\glossentry}[2]{
    \glsentryitem{##1}\glstarget{##1}{\glossentryname{##1}} &
    \ifglshaslong{##1}{\glsentrylong{##1}\ifglshasdesc{##1}{, \glsentrydesc{##1}}{}}
    {\glsentrydesc{##1}} \\
  }
  \renewcommand*{\subglossentry}[3]{
  \glossentry{##2}{##3}}
}

\defglsentryfmt{%
  \ifglshaslong{\glslabel}{%
    \glsgenacfmt%
  }{%
    \ifglsused{\glslabel}{%
      \glsgenentryfmt%
    }{%
      \glsgenentryfmt%
    }%
  }%
}

\newcommand{\thesisglossarylist}{

  \newcommand{\glsmark}{主要符号表}
  \ifthesis@english
    \renewcommand{\glsmark}{Glossary}
  \fi
  \pdfbookmark{\glsmark}{Glossary}

  \fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\Roman{page}}
  \markboth{\glsmark}{\glsmark}

  \setlength\glsdescwidth{.9\textwidth}
  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{主要符号表}
  \addcontentsline{toe}{chapter}{Glossary}
  \hypersetup{bookmarksdepth=2}
  \printglossary[style=long-chd, title={\protect\centering\glsmark}, nonumberlist, nogroupskip]
  \cleardoublepage
}\renewcommand{\glsclearpage}{\clearpage}

%\input{structure/glossary}
\makeglossaries
\glsaddall

% TODO use latex3 compress these command into on type

% \ExplSyntaxOn

% \seq_set_split:Nnn \l_tmpa_seq { , } { chapter,section,subsection,subsubsection }
% \seq_new:N \l_title_seq
% \seq_clear:N \l_title_seq

% \seq_map_variable:NNn \l_tmpa_seq \i {
%   \tl_put_right:No \l_title_seq {\tl_use:c \i}
%   \cs_new:cpn { y \tl_use:N \i } #1 #2 { 
%     \use:c {\tl_use:N \i {#1}}
%   }
% }

% \ExplSyntaxOff


\newcommand{\itemi}{}

\newcommand{\xchapter}[2]{
  \renewcommand{\itemi}{#1}
  \ifthesis@english
    \renewcommand{\itemi}{#2}
  \fi
  \stoptocwriting
  \chapter{\itemi}
  \resumetocwriting
%  \addchscontents{chapter}{#1}
  \addcontentsline{toc}{chapter}{第\chinese{chapter}章~~#1}
  \addengcontents{chapter}{#2}
  \pdfbookmark[0]{第\chinese{chapter}章~~\itemi}{\thechapter #2}
}

\newcommand{\echapter}[2]{
	\titlespacing{\chapter}{0pt}{-8mm}{36pt}
	\chapter*{\heiti\fontsize{16pt}{16pt}\textbf{ABSTRACT}}
}

\newcommand{\xsection}[2]{
  \renewcommand{\itemi}{#1}
  \ifthesis@english
    \renewcommand{\itemi}{#2}
  \fi
  \stoptocwriting
  \section{\itemi}
  \resumetocwriting
  \addchscontents{section}{#1}
  \addengcontents{section}{#2}
  \pdfbookmark[1]{\thesection~~\itemi}{\thesection #2}
}

\newcommand{\xsubsection}[2]{
  \renewcommand{\itemi}{#1}
  \ifthesis@english
    \renewcommand{\itemi}{#2}
  \fi
  \stoptocwriting
  \subsection{\itemi}
  \resumetocwriting
  \addchscontents{subsection}{#1}
  \addengcontents{subsection}{#2}
  \pdfbookmark[2]{\thesubsection~~\itemi}{\thesubsection #2}
}


%%% Body %%%
%%% 正文部分 %%%
\ExplSyntaxOn
\RenewDocumentCommand {\thesisbody} { m } {
  % split arguments into sequence
  \seq_set_split:Nnn \l_tmpa_seq { , } { #1 }
  \use:n {
    \setcounter{page}{1}
    \pagenumbering{arabic}
    \fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\arabic{page}}
    \pagestyle{fancy}
    \renewcommand{\chaptermark}[1]{\markboth{第{\chinese{chapter}}章\hspace{0.5em}##1}{}}
    \hypersetup{bookmarksdepth=-2}
  }

  % input body
  \seq_map_variable:NNn \l_tmpa_seq \i {
    \use:n  {\input{\i}}
  }

  \use:n {
    \pagecheck
    \hypersetup{bookmarksdepth=2}
  }
}
\ExplSyntaxOff
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%          环境还原               %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\ExplSyntaxOn
%\RenewDocumentCommand {\thesisbody} { m } {
%	% split arguments into sequence
%	\seq_set_split:Nnn \l_tmpa_seq { , } { #1 }
%	\use:n {
%		\setcounter{page}{1}
%		\pagenumbering{arabic}
%		\fancyfoot[LE,RO]{\fontsize{9pt}{10.8pt}\selectfont\arabic{page}}
%		\pagestyle{fancy}
%		\renewcommand{\chaptermark}[1]{\markboth{{\thechapter}\hspace{0.5em}##1}{}}
%		\hypersetup{bookmarksdepth=-2}
%	}
%	
%	% input body
%	\seq_map_variable:NNn \l_tmpa_seq \i {
%		\use:n  {\input{\i}}
%	}
%	
%	\use:n {
%		\pagecheck
%		\hypersetup{bookmarksdepth=2}
%	}
%}
%\ExplSyntaxOff
%
%\renewcommand\addchscontents[2]{%
%	\addcontentsline{toc}{#1}{\protect\numberline{\csname the#1\endcsname}#2}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Conclusion and Future Works %%%
%%% 总结与展望 %%%
\renewcommand{\thesisconclusion}{
	\renewcommand{\thechapter}{}
	\begin{spacing}{1.5}
		\begin{conclusion}
			\input{structure/conclusion}
		\end{conclusion}
	\end{spacing}
	\pagecheck
}

\newenvironment{conclusion}{
	\newcommand{\thesisconclusionstitle}{总结与展望}
	\ifthesis@english
	\renewcommand{\thesisconclusionstitle}{Conclusion and Future Works}
	\fi
	\pdfbookmark{\thesisconclusionstitle}{Conclusion and Future Works}
	
	\hypersetup{bookmarksdepth=-2}
	\addcontentsline{toc}{chapter}{总结与展望}
	\addcontentsline{toe}{chapter}{Conclusion and Future Works}
	\hypersetup{bookmarksdepth=2}
	\chapter*{\thesisconclusionstitle}
	\renewcommand{\chaptermark}[1]{\markboth{{\thechapter}\centering##1}{}}
	\chaptermark{\thesisconclusionstitle}
}{}

%%% acknowledgement %%%
%%% 致谢 %%%
\renewcommand{\thesisacknowledegment}{
  \renewcommand{\thechapter}{}
  \begin{spacing}{1.5}
  \begin{acknowledgement}
  \ifthesis@blind\else
    \input{structure/acknowledegment}
  \fi
  \end{acknowledgement}
  \end{spacing}
  \pagecheck
}

\newenvironment{acknowledgement}{
  \newcommand{\thesisacknowledgementstitle}{致~~~~谢}
  \ifthesis@english
    \renewcommand{\thesisacknowledgementstitle}{Acknowledgements}
  \fi
  \pdfbookmark{\thesisacknowledgementstitle}{Acknowledgements}

  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{致谢}
  \addcontentsline{toe}{chapter}{Acknowledgements}
  \hypersetup{bookmarksdepth=2}
  \chapter*{\thesisacknowledgementstitle}
  \renewcommand{\chaptermark}[1]{\markboth{{\thechapter}\centering##1}{}}
  \chaptermark{\thesisacknowledgementstitle}
}{}


%%% biblography %%%
%%% 参考文献 %%%
\RequirePackage[hyperref=true,backend=biber,style=gb7714-2015,gbalign=left]{biblatex}
\renewcommand{\bibfont}{\zihao{5}}
\setlength{\bibitemsep}{0ex}
\setlength{\bibnamesep}{0ex}
\setlength{\bibinitsep}{0ex}

\RenewDocumentCommand {\thesisbibliography} {  } {
  \newcommand{\thesisbibname}{参考文献}
  \ifthesis@english
    \renewcommand{\thesisbibname}{References}
  \fi
  \pdfbookmark{\thesisbibname}{References}
  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{参考文献}
  \addcontentsline{toe}{chapter}{References}
  \hypersetup{bookmarksdepth=2}
  \nocite{*}
  \printbibliography[heading=bibliography,title=\thesisbibname]
  \pagecheck
}



%%% Appendix %%%
%%% 附录 %%%
\RequirePackage{appendix}

\newcommand{\stoptocwriting}{%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{-5}}}
\newcommand{\resumetocwriting}{%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{\arabic{tocdepth}}}}

\ExplSyntaxOn
\RenewDocumentCommand {\thesisappendix} { m } {
  % split arguments into sequence
  \seq_set_split:Nnn \l_tmpa_seq { , } { #1 }

	\renewcommand{\chaptermark}[1]{\markboth{{\thechapter}\centering##1}{}}

  % count of the sequence
  \int_new:N \l_tmpa_count
  \int_set:Nn \l_tmpa_count {\seq_count:N \l_tmpa_seq}

  % change toc item
  \str_new:N \l_chstocitem_str
  \str_set:Nn \l_chstocitem_str {附录}
  \str_new:N \l_engtocitem_str
  \int_compare:nNnTF {\l_tmpa_count} < {2}
  {\str_set:Nn \l_engtocitem_str {Appendix}}
  {\str_set:Nn \l_engtocitem_str {Appendices}}

  % add toc item and reformat captions
  \use:n {
    \newcommand{\appdname}{附录}
    \ifthesis@english
      \renewcommand{\appdname}{Appendix~}
    \fi
    \pdfbookmark{\appdname}{Appendix}

    \titleformat{\chapter}[block]
      {\centering\fontsize{16pt}{16pt}\selectfont\thispagestyle{fancy}}{\appdname~\Alph{chapter}}{1em}{}
    \titleformat{\section}[block]
      {\fontsize{15pt}{15pt}\heiti\selectfont}{\Alph{chapter}.\arabic{section}}{7pt}{}
    \titleformat{\subsection}[block]
      {\fontsize{14pt}{14pt}\heiti\selectfont}{\Alph{chapter}.\arabic{section}.\arabic{subsection}}{7pt}{}

    \renewcommand{\thetable}{\arabic{table}}
    \renewcommand{\theequation}{\appdname\Alph{chapter}-\arabic{equation}}
    \renewcommand{\thefigure}{\arabic{figure}}
    \renewcommand{\thelstlisting}{\arabic{lstlisting}}
    % \renewcommand{\thealgocf}{\arabic{algocf}}

    \ifthesis@english
      \renewcommand{\figurename}{\appdname\Alph{chapter}-Figure}
      \renewcommand{\tablename}{\appdname\Alph{chapter}-Table}
      \renewcommand{\lstlistingname}{\appdname\Alph{chapter}-Code}
      % \SetAlgorithmName{\appdname\Alph{chapter}-Algorithm}{\appdname\Alph{chapter}-Algorithm}{List of Algorithms}
    \else
      \renewcommand{\figurename}{\appdname\Alph{chapter}-图}
      \renewcommand{\tablename}{\appdname\Alph{chapter}-表}
      \renewcommand{\lstlistingname}{\appdname\Alph{chapter}-源码}
      % \SetAlgorithmName{\appdname\Alph{chapter}-算法}{\appdname\Alph{chapter}-算法}{算法列表}
    \fi
    \appendix
    \renewcommand{\thechapter}{\appdname~\Alph{chapter}}
    \hypersetup{bookmarksdepth=-2}
    \addcontentsline{toc}{chapter}{附录}
    \addcontentsline{toe}{chapter}{\l_engtocitem_str}
    \stoptocwriting
  }

  % input appedi{x/es}
  \seq_map_variable:NNn \l_tmpa_seq \i {\use:nn { \input } { { \i } }}

  \use:n {
    \resumetocwriting
    \renewcommand{\theequation}{\arabic{equation}}
    \renewcommand{\thechapter}{}
    \restoreapp
    \titleformat{\chapter}[block]
      {
      	\centering\fontsize{16pt}{16pt}\selectfont\thispagestyle{fancy}}{}{1em}{}
    \hypersetup{bookmarksdepth=2}
  }
}
\ExplSyntaxOff


%%% Achievement %%%
%%% 完成成果 %%%
\newenvironment{achievelist}{
  \wuhao\selectfont
  \begin{enumerate}[label={[\arabic*]},itemsep=1ex,align=left]
}{\end{enumerate}}

\renewcommand{\thesisachivements}{
  \newcommand{\thesisaccomplishtitle}{攻读学位期间取得的研究成果}
  \ifthesis@english
    \renewcommand{\thesisaccomplishtitle}{Achievements}
  \fi
  \pdfbookmark{\thesisaccomplishtitle}{Achievements}

  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{攻读学位期间取得的研究成果}
  \addcontentsline{toe}{chapter}{Achievements}
  \hypersetup{bookmarksdepth=2}
  \chapter*{\thesisaccomplishtitle}
  \chaptermark{\thesisaccomplishtitle}
  \input{structure/achievement.tex}
  \pagecheck
}

%%% General Reviewers List %%%
%%% 常规评阅人名单 %%%
\ExplSyntaxOn
\seq_new:N \g_general_reviewer_seq
\seq_clear:N \g_general_reviewer_seq
\NewDocumentCommand \addgeneralreviewer {m}{
    \seq_set_split:Nnn \l_tmpa_seq {,} {#1}
    \clist_set_from_seq:NN \l_tmpb_clist \l_tmpa_seq
    \seq_gput_right:Nx \g_general_reviewer_seq \l_tmpb_clist
}
\tl_set:Nn \g_gr_tabular_tl {}
\NewDocumentCommand \genreviewerlist {}{
    \seq_map_variable:NNn \g_general_reviewer_seq \i {
      \tl_gput_right:Nn \g_gr_tabular_tl {\xiaosi}
      \tl_gput_right:Nx \g_gr_tabular_tl {\clist_item:Nn \i 2 & }
      \tl_gput_right:Nn \g_gr_tabular_tl {\xiaosi}
      \tl_gput_right:Nx \g_gr_tabular_tl {\clist_item:Nn \i 3 & }
      \tl_gput_right:Nn \g_gr_tabular_tl {\xiaosi}
      \tl_gput_right:Nx \g_gr_tabular_tl {\clist_item:Nn \i 1 \\}
    }
}
\NewDocumentCommand \generalreviewerlist {}{
  \tl_use:N \g_gr_tabular_tl
}
\ExplSyntaxOff

\renewcommand{\thesisreviewers}[2]{
  \genreviewerlist
  \newcommand{\thesisreviewerlisttitle}{常规评阅人名单}
  \ifthesis@english
    \renewcommand{\thesisreviewerlisttitle}{General Reviewers List}
  \fi
  \pdfbookmark{\thesisreviewerlisttitle}{General Reviewers List}

  \chapter*{\sanhao \thesisreviewerlisttitle}
  \chaptermark{\thesisreviewerlisttitle}
  \hypersetup{bookmarksdepth=-2}
  \addcontentsline{toc}{chapter}{常规评阅人名单}
  \addcontentsline{toe}{chapter}{General Reviewers List}
  \hypersetup{bookmarksdepth=2}
  本学位论文共接受 #1 位专家评阅，其中常规评阅人 #2 名，名单如下：
  \ifthesis@blind\else
    \renewcommand{\arraystretch}{1.5}
    \begin{table}[H]
      \centering
    \begin{tabular}{ccc}
      \generalreviewerlist
    \end{tabular}
    \end{table}
    \renewcommand{\arraystretch}{1}
    % \vspace{\baselineskip}
    % {\color{red} 用于双盲评审的论文，此页内容全部隐去。}
    \vfill
  \fi
  \pagecheck
}


%%% Declarations %%%
%%% 声明页 %%%
\newcommand{\signline}[1]{
  \vspace{0.5\baselineskip}
  #1（签名）：\hspace{5cm}日期：\hspace{2cm}年\hspace{1cm}月\hspace{1cm}日
}
\renewcommand{\thesisdeclarations}{
  \newcommand{\thesisoriginalitytitle}{声明}
  \ifthesis@english
    \renewcommand{\thesisoriginalitytitle}{Declarations}
  \fi
  \pdfbookmark{\thesisoriginalitytitle}{Declarations}
  \chaptermark{\thesisoriginalitytitle}
  \fancyfoot[]{}

  \input{.config/requirements/declarations.tex}
  \clearpage
}

\makeatother

% EOF: CHD-thesis.cls
