import Control.Lens

data Human = Human { _name ::String, _location :: String } deriving Show

--lens :: (s -> a) -> (s -> b -> t) -> Lens s t a b     build a lens from a getter and a setter 
--let name= lens _name $ \s x -> s { _name = x}

--view :: Lens s t a b -> s -> a
--set  :: Lens s t a b ->    b   -> s ->t
--over :: Lens s t a b -> (a->b) -> s -> t

data Point = Point { _PositionX :: Double, _PositionY :: Double}
data Segment = Segment { _segmentStart :: Point, _segmentEnd :: Point}

--type Lens' s a = Functor f => (a -> f a) -> (s -> f s)

--positionX :: Lens' Point Double
--segmentStart :: Lens' Segment Point


--what really cool is the lenses compose
--view (segmentStart. positionX) seg
--over (segmentEnd.positionY) (2*) sef

--The Lens package defines lots of optics for standard typs
--e.g. it defines lenses for all filed of tuples up to size 19 
--set _3 9 (5,6,7,8) > (5,6,9,8)
