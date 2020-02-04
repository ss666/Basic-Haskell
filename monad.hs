class Functor f where
    fmap :: (a -> b) -> f a -> f b --infix synonym <$>/ flip version <&>
    (<$) :: a -> f b-> f a         --fmap

instance Functor Maybe where 
    fmap _ Nothing = Nothing
    fmap f (Just x) = Just (f x)

instance Functor ((-)r) where
    fmap :: (a -> b) -> ((->) r a) -> ((->) r b)
    fmap f g = (\x -> f (g x)) 

{- Functor is used for types that can be mapped over,
Laws of Functor : fmap id == id 
                  fmap (f.g) == fmap f. fmap g
-}


class (Functor f) => Applicative f where
    pure :: a -> f a                    --embedd pure application / lift a value
    (<*>) :: f (a -> b) -> f a -> f b   --sequence computation and combine their result
    liftA2 :: (a -> b -> c) ->f a -> f b -> f c
    liftA2 f x y = f <$> x <*> y        --lift a binary function
    (<*) :: f a -> f b -> f a           --sequence actions, discarding the value of the second argument

instance Applicatve Maybe where
    pure = Just
    Nothing <*> _ = Nothing             --we can't extract a function out of a "Nothing", beacus it has no function inside it.
    (Just f) <*> something = fmap f something

instance Applicative [] where
    pure = []
    fs <*> xs = [ f x | f <- fs, x <- xs]--list comprehension


class Monad m where 
    return :: a -> m a
    (>>=) :: m a -> (a -> m b ) -> m b

instance Monad Maybe where
    return = Just                         -- return x = f x
    Nothing >>= _ = Nothing
    (Just x) >>= f = f x