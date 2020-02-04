--Given the follow tree type
data Tree = Empty | Node Int Tree Tree deriving Show
--Any infinite tree where every node is labelled by 1
treeOnes = Node 1 treeOnes treeOnes 
--Any infinite tree where every node is labelled by its depth from the root node
treeFrom n = Node n (treeFrom (n+1)) (treeFrom (n+1))
treeDepth = treeFrom 0

--Given the follow non-empty tree type
data Tree = Leaf Int | Node Tree Tree
--Replace each leaf integer in a given tree with the smallest integer in that tree
findMinReplace t = t'
    where 
        (t', m) = fmr m t   -- fmr can compute the result without knowing the value of m.

fmr :: Int -> Tree -> (Int, Tree)
fmr m (Leaf i) = (i, Leaf m)
fmr m (Node l r) = (min lm rm, Node l' r')
    where
        (lm, l') = fmr m l
        (rm, r') = fmr m r



