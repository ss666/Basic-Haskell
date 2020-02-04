class Semigroup a where
    (<>) :: a -> a -> a

instance Semigroup [a] where
    (<>) = (++)

--identity value and a binary operation
class Monoid m where
    mempty :: m
    mappend :: m -> m -> m          --combine two monoids into a new one
    mconcat :: [m] -> m             --append a list of monoids into a new one
    mconcat = foldr mappend mempty

instance Monoid [] where
    mempty = []
    mappend = (++)

    instance Functor [] where

instance (Monoid a) => Monoid (Maybe a) where
    mempty = Nothing
    Nothing `mappend` m = m
    m `mappend` Nothing = m
    Just m1 `mappend` Just m2 = Just (m1 `mappend` m2)


--class of data structures that can be folded to a summary value
class Foldable t where 
    foldMap :: Monoid m => (a -> m) -> t a -> m
    foldr :: (a -> b -> b) -> b -> t a -> b     --将第一个函数来 map over 这个 foldable 的结构，因此得到一个包含 monoid 的 foldable 结构。然后用 mappend 来简化这些 monoid，最后得到单一的一个 monoid

--Example: folding over a tree to compute the sum and max over a tree of Int
data Tree a = Empty | Node (Tree a) a (Tree a) deriving (Show, Eq)

instance Foldable Tree where
    foldMap f Empty = mempty
    foldMap f (Node l a r) = foldMap f l <> f a <> foldMap f r

{-e.g. 
getAny $ foldMap (\x -> Any $ x == 3) testTree
foldMap (\x -> [x]) testTree
-}

--One method:
    sumMax :: Tree Int -> (Int, Int)
    smMax t = (foldl (+) 0 t, foldl max minBound t)
--Another method:
    sumMax :: Tree Int -> (Int, Int)
    sumMax t = (sm,mx)
                where
                (Sum sm, Max mx) = foldMap (\n -> (Sum n, Max n)) t
