data Tree a = Leaf a | Node Int (Tree a) (Tree a)  --The Int field keeps track of tree size
data Digit a = Zero | One (Tree a)
data RList a = [Digit a]

--Insert an element
cons :: a -> RList a -> RList a
cons x ts = consTree (Leaf x) ts

consTree :: Tree a -> RList a -> RList a
consTree t [] = [One t]
consTree t (Zero:ts) = (One t:ts)
consTree t (One t':ts) = Zero: consTree (link t t') ts

link t t' = Node (2 * size t1) t1 t2
--cons/head/tail perform O(1) work per digit, thus O(logn) worst case
--lookup and update take O(logn) to find the right tree, and then O(logn) to find the right element in that tree, so O(logn) worst case overall

--Skew Binary Random Access List
data Tree a =Leaf a | Node a (Tree a) (Tree a)
data RList = [(Int, Tree a)]

empty :: RList 
empty = []

cons :: a -> RList a -> Rlist a 
cons x  (w1:t1) : (w2:t2) :wts | w1 == w2 = (w1*2+1, Node t1 x t2) :wts
cons x wts = (1,Leaf x) :wts

head :: RList a -> a
head (_, Leaf x) : _ ) = x
head (_, Node _ x _) : _ ) = x

tail :: RList a -> RList a
tail (_, Lea _) : wts) = wts
tail ((w, Node t1 _ t2) :wts) = (w1',t1) : (W1',t2) : wts 
    where w' = w 'div' 2

--lookup :: Int -> RList a -> a
--