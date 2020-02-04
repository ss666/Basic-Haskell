data Bool = False | True
-- value construcotr and field (parameters)
data Shape = Circle Float FLoat Float | Rectangle Float Float Float Float

data Person = Person String Int Int 
data Person = Person { name :: String , age :: Int, phone :: Int}

--type parameters
{- A value construtor can take some values parameters and produce a new value,
   A type constructor can take types as parameters and produce new types
-}
data Maybe a = Nothing | Just a
data ZipList a = ZipList [a]
data ZipList a = ZipList { getZipList :: [a] }

data Pair b a = Pair (a,b)
newtype Pair b a = Pair {getPair :: (a,b)}
instance Functor (Pair c) where  -- c是变量类型；x,y是变量
    fmap :: (a -> b) -> Pair c a -> Pair c b
    fmap f (Pair (x,y)) = Pair (f x , y)


instance Functor S where
    fmap f 
fib Fby (fib )

data S a = a 'Frb' ( S a )

0 'Frb' 
0 = 0 'Frb' 1
1 = 0 'Frb' (1 'Frb' 2)
0 'Frb' (1'Frb (2 'Frb' 3) )

nat = 0 'Frb' (nat-1 'Frb' nat)