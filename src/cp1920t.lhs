\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp1920t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp1920t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (cataBdt_ (g)) = "\cata{" g "}"
%format (cataLTree_ (g)) = "\cata{" g "}"
%format (cataBTree_ (g)) = "\cata{" g "}"
%format (cataList_ (g)) = "\cata{" g "}"
%format (cataExp_ (g)) = "\cata{" g "}"
%format listS = "^*"
%format powerBool = "^{Bool^*}"
%format powerBTree = "^{BTree}"

%---------------------------------------------------------------------------

\title{
       	    Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2019/20
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. & 35
\\\hline
a89556 & Marco Avelino Teixeira Pereira	
\\
a89549 & Alexandre Ferreira Gomes
\\
a69856 & Manuel Jorge Mimoso Carvalho	
\end{tabular}
\end{center}

\section{Preâmbulo}

A disciplina de \CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, restringe-se a aplicação deste método à programação
funcional em \Haskell. Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, validá-los, e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote} Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp1920t.pdf} que está a ler é já um exemplo de \litp{programação
literária}: foi gerado a partir do texto fonte \texttt{cp1920t.lhs}\footnote{O
suffixo `lhs' quer dizer \emph{\lhaskell{literate Haskell}}.} que encontrará
no \MaterialPedagogico\ desta disciplina descompactando o ficheiro \texttt{cp1920t.zip}
e executando
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp1920t.lhs > cp1920t.tex
    $ pdflatex cp1920t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp1920t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp1920t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
--module Cp1920t where 
import Cp
import List  hiding (fac)
import Nat
import BTree
import LTree
import Probability
import ListUtils
import Show
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import System.Random  hiding (split)
import System.Process
import GHC.IO.Exception
import Graphics.Gloss
import Control.Monad
import Control.Applicative hiding ((<|>))
import Exp
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp1920t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
vai ser seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de três alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp1920t.aux
    $ makeindex cp1920t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode mesmo controlar o número de casos de teste e sua complexidade utilizando
o comando:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\Problema

Pretende-se implementar um sistema de manutenção e utilização de um dicionário.
Este terá uma estrutura muito peculiar em memória. Será construída
uma árvore em que cada nodo terá apenas uma letra da palavra e cada
folha da respectiva árvore terá a respectiva tradução (um ou mais sinónimos).
Deverá ser possível:
\begin{itemize}
\item
|dic_rd| --- procurar traduções para uma determinada palavra
\item	
|dic_in| --- inserir palavras novas (palavra e tradução)
\item
|dic_imp| --- importar dicionários do formato ``lista de pares palavra-tradução"
\item
|dic_exp| --- exportar dicionários para o formato ``lista de pares palavra-tradução".
\end{itemize}
A implementação deve ser baseada no módulo \textbf{Exp.hs} que está incluído no material deste trabalho prático,
que deve ser estudado com atenção antes de abordar este problema.

    \begin{figure}          
    \includegraphics[scale=0.15]{images/dic.png}
    \caption{Representação em memória do dicionário dado para testes.}
    \label{fig:dic}          
    \end{figure}

No anexo \ref{sec:codigo} é dado um dicionário para testes, que corresponde à figura \ref{fig:dic}.
A implementação proposta deverá garantir as seguintes propriedades:
\begin{propriedade}
Se um dicionário estiver normalizado (ver apêndice \ref{sec:codigo}) então
não perdemos informação quando o representamos em memória:
\begin{code}
prop_dic_rep x = let d = dic_norm x in (dic_exp . dic_imp) d == d
\end{code}
\end{propriedade}
\begin{propriedade}
Se um significado |s| de uma palavra |p| já existe num dicionário então adicioná-lo
em memória não altera nada:
\begin{code}
prop_dic_red p s d
   | dic_red p s d = dic_imp d == dic_in p s (dic_imp d)
   | otherwise = True
\end{code}
\end{propriedade}
\begin{propriedade}
A operação |dic_rd| implementa a procura na correspondente exportação do dicionário:
\begin{code}
prop_dic_rd (p,t) = dic_rd  p t == lookup p (dic_exp t)
\end{code}
\end{propriedade}

\Problema

Árvores binárias (elementos do tipo \BTree) são
    frequentemente usadas no armazenamento e procura de dados, porque
    suportam um vasto conjunto de ferramentas para procuras
    eficientes. Um exemplo de destaque é o caso das
    \href{https://en.wikipedia.org/wiki/Binary_search_tree}{árvores
    binárias de procura}, \emph{i.e.} árvores que seguem o
    princípio de \emph{ordenação}: para todos os nós,
    o filho à esquerda tem um
    valor menor ou igual que o valor no próprio nó; e de forma
     análoga, o filho à direita
    tem um valor maior ou igual que o valor no próprio nó.
    A Figura~\ref{fig:ex} apresenta dois exemplos de árvores binárias de procura.\footnote{
    As imagens foram geradas com recurso à função |dotBt| (disponível
    neste documento). Recomenda-se o
    uso desta função para efeitos de teste e ilustração.}

    \begin{figure}          
    \includegraphics[scale=0.26]{images/example1.png}
    \includegraphics[scale=0.26]{images/example2.png}
    \caption{Duas árvores binárias de procura; a da esquerda vai ser designada
    por $t_1$ e a da direita por $t_2$.}
    \label{fig:ex}          
    \end{figure}
  Note que tais árvores permitem reduzir \emph{significativamente}
  o espaço de procura, dado que ao procurar um valor podemos sempre
  \emph{reduzir a procura a um ramo} ao longo de cada nó visitado. Por
  exemplo, ao procurar o valor $7$ na primeira árvore ($t_1$), sabemos que nos
  podemos restringir ao ramo da direita do nó com o valor $5$ e assim
  sucessivamente. Como complemento a esta explicação, consulte
  também os \href{http://www4.di.uminho.pt/~jno/media/}{vídeos das aulas teóricas} (capítulo `pesquisa binária').

  Para verificar se uma árvore binária está ordenada,
  é útil ter em conta  a seguinte
  propriedade: considere uma árvore binária cuja raíz tem o valor
  $a$, um filho $s_1$ à esquerda e um filho $s_2$ à direita.
  Assuma que os dois filhos estão ordenados; que o elemento
  \emph{mais à direita} de $t_1$ é menor ou igual a $a$; e que o
  elemento \emph{mais à esquerda} de $t_2$ é maior ou igual a $a$.
  Então a árvore binária está ordenada. Dada esta informação,
  implemente as seguintes funções como catamorfismos de árvores binárias.
\begin{code}
maisEsq :: BTree a -> Maybe a
maisDir :: BTree a -> Maybe a
\end{code}
  Seguem alguns exemplos dos resultados que se esperam ao aplicar
  estas funções à árvore da esquerda ($t1$) e à árvore da direita ($t2$)
  da Figura~\ref{fig:ex}.
  \begin{Verbatim}[fontsize=\small]
   *Splay> maisDir t1
    Just 16
   *Splay> maisEsq t1
    Just 1
   *Splay> maisDir t2
    Just 8
   *Splay> maisEsq t2
    Just 0
  \end{Verbatim}
  \begin{propriedade}
  As funções |maisEsq| e |maisDir| são determinadas unicamente
  pela propriedade
\begin{code}
prop_inv :: BTree String -> Bool
prop_inv = maisEsq .==. maisDir . invBTree
\end{code}
  \end{propriedade}
  \begin{propriedade}
    O elemento mais à esquerda de uma árvore está presente no ramo da
    esquerda, a não ser que esse ramo esteja vazio:
\begin{code}
propEsq Empty = property Discard
propEsq x@(Node(a,(t,s))) = (maisEsq t) /= Nothing ==> (maisEsq x) == maisEsq t
\end{code}
\end{propriedade}
  A próxima tarefa deste problema consiste na implementação de uma função
  que insere um novo elemento numa árvore
  binária \emph{preservando} o princípio de ordenação,
\begin{code}
insOrd :: (Ord a) => a -> BTree a -> BTree a
\end{code}
  e de uma função que verifica se uma dada árvore binária está ordenada,
\begin{code}
isOrd :: (Ord a) => BTree a -> Bool
\end{code}
Para ambas as funções deve utilizar o que aprendeu sobre \emph{catamorfismos e
recursividade mútua}.

\noindent
\textbf{Sugestão:} Se tiver problemas em implementar
com base em catamorfismos  estas duas últimas
funções, tente implementar (com base em catamorfismos) as funções auxiliares
\begin{code}
insOrd' :: (Ord a) => a -> BTree a -> (BTree a, BTree a)
isOrd' :: (Ord a) => BTree a -> (Bool, BTree a)
\end{code}
tais que
$insOrd' \> x = \langle insOrd \> x, id \rangle$ para todo o elemento $x$
do tipo $a$
e
$isOrd' = \langle isOrd, id \rangle$.
  \begin{propriedade}
   Inserir uma sucessão de elementos numa árvore vazia gera uma árvore
   ordenada.
\begin{code}
prop_ord :: [Int] -> Bool
prop_ord = isOrd . (foldr insOrd Empty)
\end{code}
\end{propriedade}

\smallskip
  \noindent
    As árvores binárias providenciam uma boa maneira de reduzir o espaço
    de procura. Mas podemos fazer ainda melhor: podemos aproximar da
    raíz os elementos da árvore que são mais acedidos, reduzindo assim
    o espaço de procura na \emph{dimensão vertical}\footnote{Note que
    nas árvores de binária de procura a redução é feita na dimensão
    horizontal.}. Esta operação é geralmente
    referida como
    \href{https://en.wikipedia.org/wiki/Splay_tree}{\emph{splaying}} e
    é implementada com base naquilo a que chamamos
    \href{https://en.wikipedia.org/wiki/Tree_rotation}{\emph{rotações à esquerda
    e à direita de uma  árvore}}.

    Intuitivamente, a rotação à direita de uma árvore move todos os
    nós "\emph{uma casa para a sua direita}". Formalmente,
    esta operação define-se da seguinte maneira:
    \begin{enumerate}
       \item Considere uma árvore binária e designe a sua
       raíz pela letra $r$. Se $r$ não tem filhos à esquerda então simplesmente
       retornamos a árvore dada à entrada. Caso contrário,
       \item designe o filho à esquerda pela letra $l$. A árvore
       que vamos retornar tem $l$ na raíz, que mantém o filho à esquerda
       e adopta $r$ como o filho à direita. O orfão (\emph{i.e.} o anterior
       filho à direita de $l$) passa a ser o filho à esquerda de $r$.
    \end{enumerate}
    A rotação à esquerda é definida de forma análoga. As
       Figuras~\ref{exrot:fig} e \ref{exrot2:fig} apresentam dois
       exemplos de rotações à direita. Note que em ambos os casos o
       valor $2$ subiu um nível na árvore correspodente. De facto,
       podemos sempre aplicar uma \emph{sequência} de rotações numa
       árvore de forma a mover um dado nó para a raíz (dando origem
       portanto à referida operação de splaying).

    \begin{figure}
    \includegraphics[scale=0.27]{images/example1.png}
    \includegraphics[scale=0.27]{images/example3.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot:fig}
    \end{figure}

    \begin{figure}
    \includegraphics[scale=0.25]{images/example2.png}
    \includegraphics[scale=0.25]{images/example4.png}
    \caption{Exemplo de uma rotação à direita. A árvore da esquerda
    é a árvore original; a árvore da direita representa a rotação à direita
    correspondente.}
    \label{exrot2:fig}
    \end{figure}

    Começe então por implementar as funções   
\begin{code}
rrot :: BTree a -> BTree a
lrot :: BTree a -> BTree a
\end{code}
    de rotação à direita e à esquerda.
    \begin{propriedade}
       As rotações à esquerda e à direita preservam a ordenação
       das árvores.
\begin{code}
prop_ord_pres_esq = forAll orderedBTree (isOrd . lrot)
prop_ord_pres_dir = forAll orderedBTree (isOrd . rrot)
\end{code}
    \end{propriedade}
De seguida implemente a operação de splaying
\begin{code}
splay :: (Eq a)=> [Bool] -> (BTree a -> BTree a)
\end{code}
como um catamorfismo de listas. O argumento |[Bool]|
representa um caminho ao longo de uma árvore, em que o valor |True|
representa "seguir pelo ramo da esquerda" e o valor |False|
representa "seguir pelo ramo da direita". O caminho ao longo de uma árvore serve
para \emph{identificar} unicamente um nó dessa árvore.
\begin{propriedade}
A operação de splay preserva a ordenação de uma árvore.
\begin{code}
prop_ord_pres_splay :: [Bool] -> Property
prop_ord_pres_splay path = forAll orderedBTree (isOrd . (splay path))
\end{code}
\end{propriedade}

\Problema

\emph{Árvores de decisão binárias} são estruturas de dados usadas na
 área de
 \href{https://www.xoriant.com/blog/product-engineering/decision-trees-machine-learning-algorithm.html}{machine
 learning} para codificar processos de decisão. Geralmente, tais
 árvores são geradas por computadores com base num vasto conjunto de
 dados e reflectem o que o computador "aprendeu" ao processar esses
 mesmos dados. Segue-se um exemplo muito simples de uma árvore de decisão
 binária:

\[
  \xymatrix{ & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & &\\
  \text{precisa} & & \text{chuva no regresso?} \ar[dl]^{\text{sim}}
  \ar[dr]^{\text{não}} & \\
  & \text{precisa} & & \text{não precisa}
  }
\]

Esta árvore representa o processo de decisão relativo a ser preciso ou
    não levar um guarda-chuva para uma viagem, dependendo das
    condições climatéricas. Essencialmente, o processo de decisão é
    efectuado ao "percorrer" a árvore, escolhendo o ramo da esquerda ou
    da direita de acordo com a resposta à pergunta correspondente. Por
    exemplo, começando da raiz da árvore, responder |["não", "não"]|
    leva-nos à decisão |"não precisa"| e responder |["não", "sim"]|
    leva-nos à decisão |"precisa"|.

Árvores de decisão binárias podem ser codificadas em \Haskell\ usando
o seguinte tipo de dados:
\begin{code}
data Bdt a = Dec a | Query (String, (Bdt a, Bdt a)) deriving Show
\end{code}

Note que o tipo de dados |Bdt| é parametrizado por um tipo de dados
 |a|.  Isto é necessário, porque as decisões podem ser de diferentes
 tipos: por exemplo, respostas do tipo "sim ou não" (como apresentado
 acima), a escolha de números, ou
 \href{http://jkurokawa.com/2018/02/09/machine-learning-part-ii-decision-trees}{classificações}.

De forma a conseguirmos processar árvores de decisão binárias em \Haskell,
deve, antes de tudo, resolver as seguintes alíneas:
\begin{enumerate}
  \item Definir as funções |inBdt|, |outBdt|, |baseBdt|, |cataBdt|, e |anaBdt|.
  \item Apresentar no relatório o diagrama de |anaBdt|.
\end{enumerate}
Para tomar uma decisão com base numa árvore de decisão binária |t|, o
computador precisa apenas da estrutura de |t| (\emph{i.e.} pode esquecer
a informação nos nós da árvore) e de uma lista de respostas "sim ou não" (para
que possa percorrer a árvore da forma desejada). Implemente então as seguintes
funções na forma de \emph{catamorfismos}:
\begin{enumerate}
\item |extLTree : Bdt a -> LTree a| (esquece a informação presente
nos nós de uma dada árvore de decisão binária).
\begin{propriedade}
  A função |extLTree| preserva as folhas da árvore de origem.
\begin{code}
prop_pres_tips :: Bdt Int -> Bool
prop_pres_tips = tipsBdt .==. tipsLTree . extLTree
\end{code}
\end{propriedade}
\item |navLTree : LTree a -> ([Bool] -> LTree a)| (navega um elemento de
|LTree|
de acordo com uma sequência de respostas "sim ou não". Esta função deve
ser implementada como um catamorfismo de |LTree|. Neste contexto,
elementos de |[Bool]| representam sequências de respostas: o valor |True| corresponde a "sim" e portanto a "segue pelo ramo da esquerda"; o valor
|False| corresponde a "não" e portanto a "segue pelo ramo da direita".

Seguem
alguns exemplos dos resultados que se esperam ao aplicar |navLTree| a
|(extLTree bdtGC)|, em que |bdtGC| é a  àrvore de decisão binária acima descrita,
e a uma
sequência de respostas.
   \begin{Verbatim}[fontsize=\small]
    *ML> navLTree (extLTree bdtGC) []
    Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
    *ML> navLTree (extLTree bdtGC) [False]
    Fork (Leaf "Precisa",Leaf "N precisa")
    *ML> navLTree (extLTree bdtGC) [False,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True]
    Leaf "Precisa"
    *ML> navLTree (extLTree bdtGC) [False,True,True,True]
    Leaf "Precisa"
   \end{Verbatim}
\end{enumerate}
\begin{propriedade}
  Percorrer uma árvore ao longo de um caminho é equivalente a percorrer
a árvore inversa ao longo do caminho inverso.
\begin{code}
prop_inv_nav :: Bdt Int -> [Bool] -> Bool
prop_inv_nav t l = let t' = extLTree t in
  invLTree (navLTree t' l) == navLTree (invLTree t') (fmap not l)
\end{code}
\end{propriedade}
\begin{propriedade}
  Quanto mais longo for o caminho menos alternativas de fim irão existir.
\begin{code}
prop_af :: Bdt Int -> ([Bool],[Bool]) -> Property
prop_af t (l1,l2) = let t' = extLTree t
                        f = length . tipsLTree . (navLTree t')
                    in isPrefixOf l1 l2 ==> (f l1 >= f l2)
\end{code}
\end{propriedade}

\Problema

%format B = "\mathit B"
%format C = "\mathit C"
Mónades são functores com propriedades adicionais que nos permitem obter
efeitos especiais em progra\-mação. Por exemplo, a biblioteca \Probability\
oferece um mónade para abordar problemas de probabilidades. Nesta biblioteca,
o conceito de distribuição estatística é captado pelo tipo
\begin{eqnarray}
	|newtype Dist a = D {unD :: [(a, ProbRep)]}|
	\label{eq:Dist}
\end{eqnarray}
em que |ProbRep| é um real de |0| a |1|, equivalente a uma escala de $0$ a
$100 \%$.

Cada par |(a,p)| numa distribuição |d::Dist a| indica que a probabilidade
de |a| é |p|, devendo ser garantida a propriedade de  que todas as probabilidades
de |d| somam $100\%$.
Por exemplo, a seguinte distribuição de classificações por escalões de $A$ a $E$,
\[
\begin{array}{ll}
A & \rule{2mm}{3pt}\ 2\%\\
B & \rule{12mm}{3pt}\ 12\%\\
C & \rule{29mm}{3pt}\ 29\%\\
D & \rule{35mm}{3pt}\ 35\%\\
E & \rule{22mm}{3pt}\ 22\%\\
\end{array}
\]
será representada pela distribuição
\begin{code}
d1 :: Dist Char
d1 = D [('A',0.02),('B',0.12),('C',0.29),('D',0.35),('E',0.22)]
\end{code}
que o \GHCi\ mostrará assim:
\begin{Verbatim}[fontsize=\small]
'D'  35.0%
'C'  29.0%
'E'  22.0%
'B'  12.0%
'A'   2.0%
\end{Verbatim}
É possível definir geradores de distribuições, por exemplo distribuições \emph{uniformes},
\begin{code}
d2 = uniform (words "Uma frase de cinco palavras")
\end{code}
isto é
\begin{Verbatim}[fontsize=\small]
     "Uma"  20.0%
   "cinco"  20.0%
      "de"  20.0%
   "frase"  20.0%
"palavras"  20.0%
\end{Verbatim}
distribuição \emph{normais}, eg.\
\begin{code}
d3 = normal [10..20]
\end{code}
etc.\footnote{Para mais detalhes ver o código fonte de \Probability, que é uma adaptação da
biblioteca \PFP\ (``Probabilistic Functional Programming''). Para quem quiser souber mais
recomenda-se a leitura do artigo \cite{EK06}.}
|Dist| forma um \textbf{mónade} cuja unidade é |return a = D [(a,1)]| e cuja composição de Kleisli
é (simplificando a notação)
\begin{spec}
  ((kcomp f g)) a = [(y,q*p) | (x,p) <- g a, (y,q) <- f x]
\end{spec}
em que |g: A -> Dist B| e |f: B -> Dist C| são funções \textbf{monádicas} que representam
\emph{computações probabilísticas}.
Este mónade é adequado à resolução de problemas de
 \emph{probabilidades e estatística} usando programação funcional, de
 forma elegante e como caso particular da programação
 monádica. Vamos estudar a aplicação
 deste mónade ao exercício anterior, tendo em conta o facto de que nem
 sempre podemos responder com 100\% de certeza a perguntas presentes
 em árvores de decisão.


Considere a seguinte situação: a Anita vai
 trabalhar no dia seguinte
e quer saber se precisa de levar guarda-chuva.  Na verdade,
 ela tem autocarro de porta de casa até ao trabalho, e portanto
 as condições meteorológicas não são muito significativas; a não ser
 que seja segunda-feira...Às segundas é dia de feira e o autocarro vai
 sempre lotado! Nesses dias, ela prefere fazer a pé o caminho de casa
 ao trabalho, o que a obriga a levar guarda-chuva (nos dias de
 chuva). Abaixo está apresentada a árvore de decisão respectiva a este problema.

 \[
     \xymatrix{
     && \text{2a-feira?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     & \text{chuva na ida?} \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}}
      && \text{não precisa} \\
     \text{precisa} && \text{chuva no regresso?}
    \ar[dl]_{\text{sim}} \ar[dr]^{\text{não}} & \\
     &\text{precisa} && \text{não precisa}
     }
  \]

Assuma que a Anita não sabe em que dia está, e que a previsão da
   chuva para a ida é de 80\% enquanto que a previsão de chuva para o
   regresso é de 60\%. \emph{A Anita deve
  levar guarda-chuva?}
  Para responder a esta questão, iremos tirar partido do que se aprendeu
  no exercício anterior. De facto, a maior diferença é que agora as
  respostas ("sim" ou "não") são dadas na forma de uma distribuição sobre o tipo de dados
  |Bool|. Implemente como um catamorfismo de |LTree| a função
\begin{code}
bnavLTree :: LTree a -> ((BTree Bool) -> LTree a)
\end{code}
que percorre uma árvore dado um caminho, \emph{não} do tipo |[Bool]|, mas
do tipo |BTree Bool|. O tipo |BTree Bool| é necessário
na presença de incerteza, porque neste contexto não sabemos sempre
       qual a próxima pergunta a responder. Teremos portanto
que ter resposta para todas as perguntas na árvore de decisão.

Seguem alguns exemplos dos resultados que se esperam
       ao aplicar |bnavLTree| a |(extLTree anita)|, em que |anita| é a
       árvore de decisão acima descrita, e a uma árvore
      binária de respostas.
     \begin{Verbatim}[fontsize=\small]
      *ML> bnavLTree (extLTree anita) (Node(True, (Empty,Empty)))
      Fork (Leaf "Precisa",Fork (Leaf "Precisa",Leaf "N precisa"))
      *ML> bnavLTree (extLTree anita) (Node(True, (Node(True,(Empty,Empty)),Empty)))
      Leaf "Precisa"
      *ML> bnavLTree (extLTree anita) (Node(False, (Empty,Empty)))
      Leaf "N precisa"
     \end{Verbatim}
Por fim, implemente como um catamorfismo de |LTree| a função
\begin{code}
pbnavLTree :: LTree a -> ((BTree (Dist Bool)) -> Dist(LTree a))
\end{code}
que deverá consiste na "monadificação" da função |bnavLTree| via a mónade das
probabilidades. Use esta última implementação para responder se a Anita deve
levar guarda-chuva ou não dada a situação acima descrita.
\Problema

Os \truchet{mosaicos de Truchet} são padrões que se obtêm gerando aleatoriamente
combinações bidimensionais de ladrilhos básicos. Os que se mostram na figura
\ref{fig:tiles} são conhecidos por ladrilhos de Truchet-Smith.
A figura \ref{fig:truchet} mostra um exemplo de mosaico produzido por uma
combinação aleatória de 10x10 ladrilhos |a| e |b| (cf.\ figura
\ref{fig:tiles}).

Neste problema pretende-se programar a geração aleatória de mosaicos de
Truchet-Smith usando o mónade \random{Random} e a biblioteca \gloss{Gloss}
para produção do resultado. Para uniformização das respostas, deverão ser
seguidas as seguintes condições:
\begin{itemize}
\item	Cada ladrilho deverá ter as dimensões 80x80
\item	O programa deverá gerar mosaicos de quaisquer dimensões, mas deverá ser apresentado como figura no relatório o mosaico de 10x10 ladrilhos.
\item	Valorizar-se-ão respostas elegantes e com menos linhas de código \Haskell.
\end{itemize} 
No anexo \ref{sec:codigo} é dada uma implementação da operação de permuta aleatória de uma lista que pode ser útil para resolver este exercício.

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/tiles.png}
    \caption{Os dois ladrilhos de Truchet-Smith.}
    \label{fig:tiles}
    \end{figure}

    \begin{figure}\centering
    \includegraphics[scale=0.20]{images/truchet.png}
    \caption{Um mosaico de Truchet-Smith.}
    \label{fig:truchet}
    \end{figure}

%----------------- Programa, bibliotecas e código auxiliar --------------------%

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Estudar o texto fonte deste trabalho para obter o efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}
Função de representação de um dicionário:
\begin{code}
dic_imp :: [(String,[String])] -> Dict
dic_imp = Term "" . map (bmap  id singl) . untar . discollect
\end{code}
onde
\begin{code}
type Dict = Exp String String
\end{code}
Dicionário para testes:
\begin{code}
d :: [(String, [String])]
d =  [ ("ABA",["BRIM"]),
       ("ABALO",["SHOCK"]),
       ("AMIGO",["FRIEND"]),
       ("AMOR",["LOVE"]),
       ("MEDO",["FEAR"]),
       ("MUDO",["DUMB","MUTE"]),
       ("PE",["FOOT"]),
       ("PEDRA",["STONE"]),
       ("POBRE",["POOR"]),
       ("PODRE",["ROTTEN"])]
\end{code}
Normalização de um dicionário (remoção de entradas vazias):
\begin{code}
dic_norm = collect . filter p . discollect where
   p(a,b)= a > "" && b > ""
\end{code}
Teste de redundância de um significado |s| para uma palavra |p|:
\begin{code}
dic_red p s d = (p,s) `elem` discollect d
\end{code}

\subsection*{Problema 2}

Árvores usadas no texto:
\begin{code}
emp x = Node(x,(Empty,Empty))

t7 = emp 7
t16 = emp 16
t7_10_16 = Node(10,(t7,t16))
t1_2_nil = Node(2,(emp 1, Empty)) 
t' = Node(5,(t1_2_nil, t7_10_16))

t0_2_1 = Node(2, (emp 0, emp 3))
t5_6_8 = Node(6, (emp 5, emp 8))
t2 = Node(4, (t0_2_1, t5_6_8))

dotBt :: (Show a) => BTree a -> IO ExitCode
dotBt = dotpict . bmap Just Just . cBTree2Exp . (fmap show)
\end{code}

\subsection*{Problema 3}
Funções usadas para efeitos de teste:
\begin{code}
tipsBdt :: Bdt a -> [a]
tipsBdt = cataBdt (either singl ((uncurry (++)) . p2))
tipsLTree = tips
\end{code}

\subsection*{Problema 5}
Função de permutação aleatória de uma lista:
\begin{code}
permuta [] = return []
permuta x = do { (h,t) <- getR x; t' <- permuta t; return (h:t') } where
      getR x = do { i <- getStdRandom (randomR (0,length x-1)); return (x!!i,retira i x) }
      retira i x = take i x ++ drop (i+1) x
\end{code}

\subsection*{QuickCheck}
Código para geração de testes:
\begin{code}
instance Arbitrary a => Arbitrary (BTree a) where
    arbitrary = sized genbt  where
              genbt 0 = return (inBTree $ i1 ())
              genbt n = oneof [(liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (inBTree . i2))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]               

instance (Arbitrary v, Arbitrary o) => Arbitrary (Exp v o) where
    arbitrary = (genExp 10)  where
              genExp 0 = liftM (inExp . i1) QuickCheck.arbitrary
              genExp n = oneof [liftM (inExp . i2 . (\a -> (a,[]))) QuickCheck.arbitrary,
                         liftM (inExp . i1) QuickCheck.arbitrary,
                         liftM (inExp . i2 . (\(a,(b,c)) -> (a,[b,c])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM2 (,)
                                                             (genExp (n-1)) (genExp (n-1)))),
                         liftM (inExp . i2 . (\(a,(b,c,d)) -> (a,[b,c,d])))
                         $ (liftM2 (,) QuickCheck.arbitrary (liftM3 (,,)
                                                             (genExp (n-1)) (genExp (n-1)) (genExp (n-1))))        
                      ]

orderedBTree :: Gen (BTree Int)
orderedBTree = liftM (foldr insOrd Empty) (QuickCheck.arbitrary :: Gen [Int])

instance (Arbitrary a) => Arbitrary (Bdt a) where
    arbitrary = sized genbt  where
              genbt 0 = liftM Dec QuickCheck.arbitrary
              genbt n = oneof [(liftM2 $ curry Query)
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt (n-1))),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt (n-1)) (genbt 0)),
                (liftM2 $ curry (Query))
                QuickCheck.arbitrary (liftM2 (,) (genbt 0) (genbt (n-1)))]      


\end{code}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}
Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}

run = do { system "ghc cp1920t" ; system "./cp1920t" }
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções aos exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado texto e/ou 
outras funções auxiliares que sejam necessárias.

\subsection*{Problema 1}

\subsubsection*{discollect}

A função discollect abaixo apresentada tira partido da utilização da notação do de modo a preencher cada par retornado com o respetivo valor.
\begin{code}
discollect :: (Ord b, Ord a) => [(b, [a])] -> [(b, a)]
discollect d = Cp.cond null nil (do { (a,x) <- head; return ([(a,b) | b <- x]++(discollect . tail) d) }) d
\end{code}

No entanto pode ser definida de uma forma mais "casual" e simples de entender como aquela abaixo apresentada:
\begin{spec}

discollectPW :: (Ord b, Ord a) => [(b, [a])] -> [(b, a)]
discollectPW [] = []
discollectPW ((a, x) : y) = [(a, b) | b <- x] ++ discollectPW y

\end{spec}
A função de exportação do dicionário usa a ja implementada função collect após a função tar ter retornado a lista com pares entre a palavra em português e uma lista de possíveis traduções desta.

\subsubsection*{dic\_exp}
\begin{code}
dic_exp :: Dict -> [(String,[String])]
dic_exp = collect . tar
\end{code}

\subsubsection*{tar}

Como foi dito em cima aqui se encontra a função tar que utiliza como gene uma função que terá como input duas alternativas sendo elas o Var e o Term, logo o gene tem de ser um either. 
Sabendo isso temos apenas de encontrar os seus constituintes g1 e g2.
O constituinte g1 será aplicado ao resultado de | out (Var v) |, tendo o seu retorno de ser uma lista com apenas um par em que o primeiro constituinte seria "" e o segundo seria a palavra traduzida a qual chegamos(v).
O constituinte g2 será aplicado a | (id >< map (cataExp_ g) ) . out |, a partir disto facilmente chegamos a conclusão que g2 será aplicado a (v,k) onde k é uma lista do tipo que temos de retornar e são os pares de traduções que se formam a partir daquele termo v, logo tudo o que temos de fazer é inserir v no inicio do primeiro membro de cada um dos pares da lista k concatenada, daí ficamos com | g2 (v,k) = map ((v++) >< id) (concat k)| .

\begin{code}
tar = cataExp g where
  g = either g1 g2 where
    g1 = singl . (split (const "") (id))
    g2 (o,l)= map ((o++) >< id) (concat l)

\end{code}

\subsubsection*{dic\_rd}
Esta função foi o primeiro problema que tivemos de resolver sem receber informação alguma sobre que caminho seguir, pensando na tipagem desta função vemos que o primeiro argumento que ela recebe é uma \textit{String}, que é como sabemos uma lista de \textit{Char}, logo a primeira ideia que ocorre seria o uso de um cataList que percorra a lista de \textit{Char} tal que quando a lista for vazia ele retorne as váriaveis que se encontra nesse local do \textit{Dict}.
No entanto para poder definir esta função decidimos criar uma outra auxiliar que seja parecida com a sequence mas que funcione com listas e as concatene ao invés de as juntar numa lista de listas e ainda que quando receba um Nothing, não faça com que o resultado seja automaticamente Nothing, ignorando-o apenas.
\begin{code}

auxSequence :: [Maybe [String]] -> Maybe [String]
auxSequence = cataList (either g1 g2)
  where g1 = nothing
        g2 (Just a,Just t) = Just (a++t)
        g2 (Nothing,Nothing) = Nothing
        g2 (Just a,Nothing) = Just a
        g2 (Nothing,Just a) = Just a

\end{code}
Tendo a nossa função auxiliar tivemos apenas que usar as definições aprendidas na UC para tornar fácil a descoberta de dic_rd.

\begin{eqnarray*}
%
\start
%
| dic_rd = cataList_ (either g1 g2) | 
%
\just={lei-43}
%
| dic_rd . inList = (either g1 g2) . F dic_rd |    
%
\just={def inBTree ; def F }
%
| dic_rd . either nil cons = (either g1 g2) . (id -||- (id >< dic_rd))|
%
\just={lei-20 ; lei-22}
%
| either (dic_rd . nil (splay . cons)) = (either g1  (g2 . (id >< dic_rd))) |
%
\just={lei-27}
%
| lcbr (dic_rd . nil = g1) (dic_rd . cons = g2 . (id >< dic_rd )) |
%
\just={inserindo variáveis}
%
| lcbr (dic_rd . nil () = g1 ()) (dic_rd . cons (h,t) = g2 . (id >< dic_rd) (h,t)) |
%
\just={lei-3 ; lei-75}
%
| lcbr (dic_rd [] = g1 ()) (dic_rd (h:t) = g2 . (h,(dic_rd t))) |
%
 \end{eqnarray*}

Tendo chegado a isto temos agora que tentar deduzir as definições de g1 e g2, ora, g1 é como sempre o caso mais simples, caso estejamos perante uma lista vazia e um \textit{Dict} Var vamos querer retornar o Just do singl da \textit{String} que vem neste, caso contrário queremos retornar Nothing pois não há traduções desta palavra.
Quanto a g2 temos as mesmas hipóteses, caso esta receba uma Var vamos retornar Nothing pois não temos mais nada a percorrer no dicionário, caso receba um Term temos que verificar se a String deste é igual à cabeça da nossa lista de caracteres colocada em forma de lista, se isso for verdade mapeamos o segundo valor do par acima visto a cada um dos elementos da lista presente em Term caso contrário retornamos Nothing.

\begin{code}
dic_rd = cataList (either (const g1) g2)
  where g1 (Var v) = Just [v]
        g1 (Term o l) | o=="" = auxSequence (map g1 l)
        g2 (a,g2t) (Term o l) | o== "" = auxSequence (map (g2 (a,g2t)) l) 
                              | o==[a] = auxSequence [ b | b <- (map g2t l), Nothing /= b] 
        g2 _ _ = Nothing
\end{code}

\subsubsection*{dic\_in}

A seguir temos a função de inserção no dicionário, esta função foi feita tirando partido da dica dada pelos docentes no FAQ, que foi o uso de um hylo.
Abaixo encontra-se o diagrama de tipos de forma a fundamentar a explicação que iremos dar com mais coerência.

\resizebox{5cm}{!}{
  \begin{eqnarray*}
  \xymatrix@@C=3cm@@R=2cm{
	  |String >< Dict listS|
		  \ar[r]^{|divideFunction|}
		  \ar[d]||{|anaList_ (divideFunction)|}
  &
	  |1 + ((Dict listS + (Char >< Dict listS )) >< (String >< Dict listS))|
		  \ar[d]||{| id + id >< (anaList_ divideFunction) |}
  \\
	  |(Dict listS + (Char >< Dict listS )) listS|
		  \ar[d]||{|cataList_ conquerFunction|}
		  \ar@@/^0.4cm/[r]^-{|out|}
  &
	  |1 + (Dict listS + (Char >< Dict listS )) >< (Dict listS + (Char >< Dict listS )) listS|
		  \ar[d]||{|id + id >< (cataList_ conquerFunction)|}
		  \ar@@/^0.4cm/[l]^-{|in|}
  \\
	  |Dict listS|
  &
	  |1 + (Dict listS + (Char >< Dict listS )) >< Dict listS|
		  \ar[l]^{|conquerFunction|}
  }
  \end{eqnarray*}
}

A função desempenhada por divideFunction é recebendo a palavra a procurar no dicionário

\begin{code}
dic_in p s (Term "" v) = Term "" (hyloList (conquerFunction s) divideFunction (p,v))

divideFunction :: (String,[Dict]) -> Either () (Either [Dict] (Char,[Dict]),(String,[Dict]))
divideFunction ("",[]) = i1 ()
divideFunction ((h:t),[]) = i2 ((i2 (h,[])),(t,[]))
divideFunction ("",d) = i2 ( i1 d ,("",[]))
divideFunction ((h:t),((Term k v):ds)) | (k==[h]) = i2 (i2 (h,ds), (t,v))
divideFunction ((h:t),(d:ds)) = (either (i1 . id) (i2.((either (i1 . (d:)) (i2 . (id >< (d:)))) >< id)) . divideFunction) ((h:t),ds)

conquerFunction :: String -> Either () (Either [Dict] (Char,[Dict]),[Dict]) -> [Dict]
conquerFunction t l = either (const [Var t]) (uncurry (cFaux t) . swap) l

cFaux :: String -> [Dict] -> (Either [Dict] (Char,[Dict])) -> [Dict]
cFaux t l = either (tt1 t l) (tt2 t l)
        where tt1 t k d = (Var t):d
              tt2 t k (l,r) = r ++ [Term [l] k]

\end{code}

\subsection*{Problema 2}

\subsubsection*{maisDir e maisEsq}

Para a resolução das funções maisDir e maisEsq utilizamos as várias regras aprendidas em Cálculo de Programas para obter a estrutura de g, que seria um either de g1 e g2.
O raciocinio e as fórmulas de Cálculo de Programas usadas na resolução da função maisDir está apresentado em baixo.

\begin{eqnarray*}
%
\start
%
| maisDir = cataBTree_ (either g1 g2) | 
%
\just={lei-43}
%
| maisDir . inBTree = (either g1 g2) . F maisDir |    
%
\just={def inBTree ; def F }
%
| maisDir . either (const Empty) Node = (either g1 g2) . (id -||- (id >< ( maisDir >< maisDir )))|
%
\just={lei-20 ; lei-22}
%
| either (maisDir . (const Empty)) (maisDir . Node) = (either g1  (g2 . (id >< ( maisDir >< maisDir )))) |
%
\just={lei-27}
%
| lcbr (maisDir . (const Empty) = g1) (maisDir . Node = g2 . (id >< ( maisDir >< maisDir ))) |
%
\just={inserindo variáveis}
%
| lcbr (maisDir . (const Empty) () = g1 ()) (maisDir . Node (a,(t1,t2)) = g2 . (id >< (maisDir >< maisDir )) (a,(t1,t2)) |
%
\just={lei-3 ; lei-75}
%
| lcbr (maisDir Empty = g1 ()) (maisDir (Node (a,(t1,t2))) = g2 . (a,((maisDir t1 ),(maisDir t2)))) |
%
 \end{eqnarray*}

A partir do sistema de equações ao qual chegamos conseguimos facilmente extrair g1 pois o node mais à direita de uma árvore vazia não existe logo Nothing.

Para g2 temos um contratempo pois não podemos apenas dizer que o resultado seria o obtido em \textit{maisDir} t1 pois este pode retornar Nothing mas um simples pattern matching resolve essa situação.

Por isso decidimos criar a função abaixo apresentada que retorna o \textit{Bool} True caso receba um \textit{Maybe} com valor Nothing.
\begin{code}

isNothing :: Maybe a -> Bool
isNothing (Just a) = False
isNothing (Nothing) = True

\end{code}
Ficamos assim com a função definida abaixo. 

\begin{code}

maisDir = cataBTree g where
  g = either g1 g2 where 
    g1 = nothing
    g2 = Cp.cond (isNothing.p2.p2) (Just . p1) (p2 . p2)

\end{code}

Para a função maisEsq a forma de calcular é muito parecida mudando apenas o lado que vamos querer verificar se é Nothing, por isso decidimos apresentar apenas o diagrama de tipos para auxiliar na compreensão desta.

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|BTree|
		\ar[d]||{|maisDir = (cataBTree_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|1 + (A >< (BTree >< BTree))|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + id >< (cataBTree_ g >< cataBTree_ g)|}
\\
	|Maybe A|
&
	|1 + (A >< (Maybe A >< Maybe A))|
		\ar[l]^-{|g = either (nothing) (Cp.cond (isNothing.p1.p2) (Just . p1) (p1 . p2))|}
}
\end{eqnarray*}


\begin{code}

maisEsq = cataBTree g where 
  g = either g1 g2 where 
    g1 = nothing
    g2 = Cp.cond (isNothing.p1.p2) (Just . p1) (p1 . p2)

\end{code}

Para a resolução da função abaixo recorremos ao enunciado, à equação dada que nos diz que \begin{eqnarray*} |insOrd' x = split (insOrd x) id| \end{eqnarray*} A partir desta conseguimos aplicar a lei de Fokkinga e outras para chegar a um estado em que se torna mais fácil a prespeção de o que cada função possa ser.

Como no formulário temos o nome que cada função toma como sendo h e k no lado direito da equação presente na fórmula de Fokkinga decidimos manter essa formulação criando assim hFunction.
Dessa forma chegamos à definição que apresentamos abaixo e substituindo a definição apresentada de \textit{insOrd'} por aquela que é dada no enunciado vemos que estas estão definidas com recursividade mútua.
Sendo \textit{insOrd'} uma função que retorna um par de BTrees sendo o primeiro o uma forma de diferenciar em qual dos dois lados vai inserir retornarndo a \textit{BTree} com a inserção no lado correto e o segundo a \textit{BTree} que contem apenas os segundos elementos dos dois pares que recebe que são uma cópia do que era anteriormente para não perder informação.
Desta forma em insOrd temos apenas que decidir qual dos lados queremos ao aplicar a mesma hFunction.
Quando atingimos h com vazio sabemos que chegamos ao ponto onde devemos inserir o Node com a o valor a inserir e Empty nas suas duas árvores.

\subsubsection*{insOrd}
\begin{code}

insOrd' x = cataBTree g
  where g = split (hFunction x) (either (const Empty) k2)
        k2 (a,((t11,t12),(t21,t22))) = Node (a,(t12,t22))

insOrd a = (hFunction a) . recBTree(insOrd' a) . outBTree  
  
hFunction x = either (h1 x) (h2 x) 
  where h1 x () = Node (x,(Empty,Empty))
        h2 x (a,((t11,t12),(t21,t22))) | x<=a = Node (a,(t11,t22))
                                       | otherwise = Node (a,(t12,t21))

\end{code}
\subsubsection*{isOrd}

A função abaixo apresentada funciona de forma parecida à anterior usando \textit{isOrd'} apenas para retornar um par em que o segundo elemento é uma forma de não perder informação sobre a árvore e o primeiro é o \textit{Bool} qeu julgou se a árvore do seu par estava ou não ordenada.
Da mesma forma que acima fizemos aqui podemos também simplesmente substituir a definição apresentada por \textit{isOrd'} para que estas funções fiquem implementadas utilizando recursividade mútua de uma forma mais facilmente visível.

\begin{code}

isOrd' = cataBTree g
    where g = split hFunc (either (const Empty) k2)
          k2 (a,((b1,t1),(b2,t2))) = Node (a,(t1,t2))

isOrd = hFunc . recBTree(isOrd') . outBTree

hFunc :: (Ord a) => Either () (a,((Bool,BTree a),(Bool,BTree a))) -> Bool 
hFunc = either h1 h2
  where h1 () = True
        h2 (a,((True,Empty),(True,Empty))) = True
        h2 (a,((True,Empty),(True,t2))) = Just a <= (maisEsq t2)
        h2 (a,((True,t1),(True,Empty))) = Just a >= (maisDir t1)
        h2 (a,((True,t1),(True,t2))) = Just a <= (maisEsq t2) && Just a >= (maisDir t1)
        h2 _ = False
\end{code}


\subsubsection*{rrot e lrot}

A definição das próximas duas funções é bastante trivial tendo apenas que verificar se o lado que queremos fazer rotação tem um Node ou Empty.

\begin{code}
rrot (Node (a,((Node (e1,(t11,t12))),t2))) = Node (e1,((t11),(Node (a,(t12,t2)))))
rrot l = l

lrot (Node (a,(t1,(Node (e2,(t21,t22)))))) = Node (e2,((Node (a,(t1,t21))),t22))
lrot t = t
\end{code}

\subsubsection*{splay}

A definição de splay foi obtida por nós seguindo as formulas da Unidade Curricular sendo abaixo apresentada.

\begin{eqnarray*}
%
\start
%
 | splay = cataList_ (either g1 g2) | 
%
\just={lei-43}
%
    | splay . inList = (either g1 g2) . F splay |    
%
\just={def inBTree ; def F }
%
    | splay . either nil cons = (either g1 g2) . (id -||- (id >< splay))|
%
\just={lei-20 ; lei-22}
%
    | either (splay . nil (splay . cons)) = (either g1  (g2 . (id >< splay))) |
%
\just={lei-27}
%
  | lcbr (splay . nil = g1) (splay . cons = g2 . (id >< splay )) |
%
\just={inserindo variáveis}
%
  | lcbr (splay . nil () = g1 ()) (splay . cons (h,t) = g2 . (id >< splay) (h,t)) |
%
\just={lei-3 ; lei-75}
%
  | lcbr (splay [] = g1 ()) (splay (h:t) = g2 . (a,(splay t))) |
%
 \end{eqnarray*}

Depois de chegar a esta definição facilmente deduzimos que aplicar \textit{splay} a uma lista vazia de \textit{Bool} iremos retornar uma função que em nada altere a \textit{BTree}, sendo essa funçao a identidade.

Para descobrir qual seria g2 tivemos de pensar um pouco mais mas seguindo a mesma ordem de pensamento conseguimos perceber que esta terá de retornar Empty a partir do momento em que a árvore que receba seja Empty e terá de retornar a função splay aplicada ao resto da lista para aplicar à \textit{BTree} da esquerda caso a cabeça da lista seja o \textit{Bool} true ou à \textit{BTree} da direita caso seja false.  

Podemos assim definir o diagrama de tipos que a seguir apresentamos:

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|Bool listS|
		\ar[d]||{|splay = (cataList_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|1 + (Bool >< (Bool listS))|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + (id >< cataList_ g)|}
\\
	|BTree powerBTree|
&
	|1 + (Bool >< BTree powerBTree )|
		\ar[l]^-{|g = either (const id) (curry (Cp.cond ((Empty==).p2) func1 func2)) |}
}
\end{eqnarray*}

\begin{code}

splay = cataList (either (const id) (curry (Cp.cond ((Empty==).p2) func1 func2))) 
  where
    func1 = id . p2
    func2 = Cp.cond (p1 . p1) (Cp.ap . (p2 >< getNodEsq)) (Cp.ap . (p2 >< getNodDir))

\end{code}

Em baixo temos uma versão pointwise mais simples de entender.

\begin{code}
splayPW = cataList (either (const id) g2) 
  where 
  g2 _ Empty = Empty
  g2 (b1,sp2) (Node (a,(t1,t2))) | b1 == True = sp2 t1
                                 | otherwise = sp2 t2 
  
\end{code}

\subsection*{Problema 3}
\subsubsection*{extLTree}

O raciocinio para a \textit{extLTree} foi percorrer a \textit{Bdt} dada através de um cata destruindo a informação no primeiro membro do par Query guardando apenas no Fork as informações do segundo membro do par, e guardando em Leaf o representado em Dec.
Desta forma ficamos com uma simples LTree onde apenas temos a decisão final consoante o caminho escolhido para atravessar a mesma.
\textit{extLTree} pode ser representada no seguinte diagrama:

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|Bdt|
		\ar[d]||{|extLTree = (cataBdt_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|A + (A >< (Bdt >< Bdt))|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + (id >< (cataBdt_ g >< cataBdt_ g))|}
\\
	|LTree|
&
	|A + (A >< (LTree >< LTree))|
		\ar[l]^-{|g = either (Leaf) (Fork . p2)|}
}
\end{eqnarray*}

\begin{code}
extLTree :: Bdt a -> LTree a
extLTree = cataBdt (either g1 g2) where
  g1 = Leaf 
  g2 = Fork . p2
\end{code}

\subsubsection*{Definições do tipo de dados}
\begin{code}
inBdt = either Dec Query

outBdt (Dec c) = i1 c
outBdt (Query d) = i2 d
\end{code}

\subsubsection*{Padrões de recursividade}
\begin{code}
baseBdt f g h = f -|- g >< (h >< h)

recBdt h = baseBdt id id h

cataBdt g = g . recBdt (cataBdt g) . outBdt

anaBdt g = inBdt . recBdt (anaBdt g) . g
\end{code}

\subsubsection*{navLTree}
A forma de pensar usada para esta função foi a utilização de um catamorfismo que irá percorrer a \textit{LTree} dada, e consoante a lista de \textit{Bool} a receber irá caso a cabeça desta lista seja true aplicar o resultado do catamorfismo da \textit{LTree} da direita aplicado à cauda da lista de \textit{Bool} à lista da direita e o contrário quando for false.
Desta forma podemos definir navLTree no seguinte diagrama:

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|LTree|
		\ar[d]||{|navLTree = (cataLTree_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|A + (LTree >< LTree)|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + (cataLTree_ g >< cataLTree_ g)|}
\\
	|LTree powerBool|
&
	|A + A >< (LTree powerBool >< LTree powerBool)|
		\ar[l]^-{|g = either (flip (const Leaf)) fFunction|}
}
\end{eqnarray*}

\begin{code}
navLTree :: LTree a -> ([Bool] -> LTree a)
navLTree = cataLTree g 
  where g = either g1 fFunction
        g1 = flip (const Leaf)

fFunction :: (([Bool] -> LTree a),([Bool] -> LTree a)) -> [Bool] -> LTree a
fFunction = curry (Cp.cond (null . p2) ff1 ff2)
          where ff1 = Fork . (split (Cp.ap . (p1 >< nil)) (Cp.ap . (p2 >< nil)))
                ff2 = Cp.cond (head . p2) (Cp.ap . (p1 >< tail)) (Cp.ap . (p2 >< tail))

\end{code}

Em baixo temos uma versão pointwise que nos fornece um mais fácil entendimento do raciocinio.

\begin{spec}
navLTreePW :: LTree a -> ([Bool] -> LTree a)
navLTreePW = cataLTree g
  where g = either g1 fFunctionPW
        g1 a = const(Leaf a)

fFunctionPW :: (([Bool] -> LTree a),([Bool] -> LTree a)) -> [Bool] -> LTree a
fFunctionPW (t1,t2) [] = Fork ((t1 []),(t2 []))
fFunctionPW (t1,t2) (h:t) | h = t1 t
                          | otherwise = t2 t

\end{spec}

\subsection*{Problema 4}
Este problema consiste em colocar os alunos a prova com uma primeira função relativamente facil de resolver pois segue o mesmo principio da função definida anteriormente \textit{navLTree} e após isso aumentar a dificuldade para os alunos criarem uma mesma versão mas desta vez monadificada.

\subsubsection*{bnvaLTree}

Esta função foi realizada da mesma forma que a anterior sendo diferente apenas no facto que é uma tree e não uma lista.


Para poder definir em pointfree decidimos criar as seguintes funções que apenas serão aplicadas a Node e que nos retornam cada um dos parametros deste como podemos ver abaixo.
\begin{code}
getNodVal :: BTree a -> a
getNodVal (Node (a,(t1,t2))) = a

getNodEsq :: BTree a -> BTree a
getNodEsq (Node (a,(t1,t2))) = t1

getNodDir :: BTree a -> BTree a
getNodDir (Node (a,(t1,t2))) = t2

\end{code}
Para complementar a nossa resposta encontra-se abaixo o diagrama de tipos:

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|LTree|
		\ar[d]||{|bnavLTree = (cataLTree_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|A +  (LTree >< LTree)|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + (cataLTree_ g >< cataLTree_ g)|}
\\
	|LTree powerBTree|
&
	|A + A >< (LTree powerBTree >< LTree powerBTree)|
		\ar[l]^-{|g = either (flip (const Leaf)) bfFunction|}
}

\end{eqnarray*}
\begin{code}

bnavLTree = cataLTree g
  where g = either (flip (const Leaf)) bfFunction

bfFunction :: ((BTree Bool -> LTree a),(BTree Bool -> LTree a)) -> BTree Bool -> LTree a
bfFunction = curry (Cp.cond ((Empty==).p2) func1 func2)
            where func1 = Fork . (split (Cp.ap . (p1 >< id)) (Cp.ap . (p2 >< id)))
                  func2 = Cp.cond (getNodVal . p2) (Cp.ap . (p1 >< getNodEsq)) (Cp.ap . (p2 >< getNodDir))
\end{code}

Em baixo temos uma versão pointwise que permite uma compreensão mais simples e intuitiva do que aquela que apresentamos acima.

\begin{spec}
bnavLTreePW = cataLTree g
  where g = either g1 bfFunctionPW
        g1 a = const(Leaf a)

bfFunctionPW :: ((BTree Bool -> LTree a),(BTree Bool -> LTree a)) -> BTree Bool -> LTree a
bfFunctionPW (t1,t2) Empty = Fork ((t1 Empty),(t2 Empty))
bfFunctionPW (t1,t2) (Node (a,(tt1,tt2))) | a = t1 tt1
                                          | otherwise = t2 tt2
\end{spec}

\subsubsection*{pbnavLTree}

Para a resolução desta função recorremos ao uso de funções que encontramos enquanto estavamos a explorar o Probability.hs.
Decidimos usar um catamorfismo para percorrer a \textit{LTree} dada, em cada um dos nodos da \texit{BTree} em que estavamos caso fosse Empty teriamos que retornar a mesma probabilidade a cada uma das possíveis decisões como seria de esperar e caso fosse um nodo utilizamos a função do módulo Probability que distribui as probabilidades para o lado esquerdo e direito da \textit{LTree} consoante a probabilidade de o valor do nodo da \textit{BTree} ser True ou False.
Utilizando esta forma de pensar a definição da função torna-se simples sendo também simples definir o seu diagrama de tipos que a seguir aprsentamos. 

\begin{eqnarray*}
\xymatrix@@C=3.4cm@@R=2cm{
	|LTree|
		\ar[d]||{|pbnavLTree = (cataLTree_ g)|}
		\ar@@/_0.5cm/[r]_-{|out|}
&
	|A +  (LTree >< LTree)|
		\ar@@/_0.5cm/[l]^-{|in|}
		\ar[d]||{|id + (cataLTree_ g >< cataLTree_ g)|}
\\
	|Dist (LTree) powerBTree|
&
	|A + A >< (Dist (LTree) powerBTree >< Dist (LTree) powerBTree)|
		\ar[l]^-{|g = either (flip (const (return . Leaf))) bpfFunction|}
}

\end{eqnarray*}
\begin{code}
pbnavLTree = cataLTree g
  where g = either g1 pbfFunctionPW
        g1 = flip (const (return . Leaf))

pbfFunctionPW (t1,t2) Empty = Probability.cond (choose 0.5 True False) (t1 Empty) (t2 Empty)
pbfFunctionPW (t1,t2) (Node (e,(l1,l2))) = Probability.cond e (t1 l1) (t2 l2) 

\end{code}

Tendo definida esta função podemos facilmente calcular as varias probabilidades e a resposta ao problema da Anita.

Seja decisao a \textit{LTree} de decisão apresentada no início do problema e bTProbabilidade a \textit{BTree} de probabilidades abaixo definidas:

\begin{code}

decisao = 
      Query ("2a-feira?",
        ((Query ("chuva na ida?",
              ((Dec "precisa"),
              (Query ("chuva na volta?",
                  ((Dec "precisa"),(Dec "nao precisa")))))),
        (Dec "nao precisa"))))

bTProbabilidade = 
                Node ((D [(True,1/7),(False,6/7)]),
                 (Node ((D [(True,0.8),(False,0.2)]),
                        (Empty,
                        Node ((D [(True,0.6),(False,0.4)]),
                              (Empty,Empty)))),
                 Empty))

\end{code}

Chamando o conjunto de funções obtemos o seguinte resultado tendo como podemos ver abaixo 86.9 \% probabilidades de não precisar de levar guarda chuva maioritariamente devido a ter apenas de se preocupar com isso em 1 dos 7 dias da semana.

\begin{figure}[!h]\centering
    \includegraphics[scale=0.80]{images/P3-Anita.png}
    \caption{Resposta ao problema de Anita.}
    \label{fig:anita}
    \end{figure}

\subsection*{Problema 5}

Pare resolver este problema, decidimos tirar proveito da função permuta que nos é fornecida

\begin{code}

truchet1 = Pictures [ put (0,80) (Arc (-90) 0 40), put (80,0) (Arc 90 180 40) ]

truchet2 = Pictures [ put (0,0) (Arc 0 90 40), put (80,80) (Arc 180 (-90) 40) ]

--- janela para visualizar:

janela = InWindow
             "Truchet"        -- window title
             (800, 800)       -- window size
             (100,100)        -- window position

----- defs auxiliares -------------

put  = uncurry Translate 

\end{code}

Após o input do utilizador é gerado um número aleatório (n) entre 0 e o número total de ladrilhos necessários para fazer a imagem, depois é gerada uma lista com n ladrilhos do tipo truchet1 e total-n ladrilhos do tipo truchet2 a qual será aplicada a função permuta, ficamos assim com uma lista gerada aleatóriamente.
Por fim criamos a função draw que é reponsável por desenhar cada peça no ponto na tela correto, esta função recebe para além da lista a desenhar as dimensões do mosaico e um acumulador que indica quando é necessário desenhar uma nova linha.

\begin{code}


draw :: Int -> Int -> Int -> [Picture] -> [Picture]
draw _ _ _ [] = []
draw x y 0 l = (draw x (y-1) x l)
draw x y i (h:t) = (put ((fromIntegral (i*80-480)),(fromIntegral (y*80-480))) h):(draw x y (i-1) t)

main :: IO()
main = do
    putStrLn "Enter the width:"
    xi <- getLine
    putStrLn "Enter the height:"
    yi <- getLine
    let (x,y) = ((read xi :: Int),(read yi :: Int))
    n <- getStdRandom (randomR(0,x*y))
    l <- permuta ((replicate ((x*y)-n) truchet1) ++ (replicate n truchet2))
    display janela white (Pictures (draw x y x l))

-------------------------------------------------
\end{code}

\begin{figure}[!h]\centering
    \includegraphics[scale=0.25]{images/P5-Truchet.png}
    \caption{Resposta ao problema 5}
    \label{fig:truchet}
    \end{figure}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp1920t}

%----------------- Fim do documento -------------------------------------------%
\end{document}
