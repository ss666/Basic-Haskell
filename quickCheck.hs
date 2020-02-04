import Test.QuickCheck
import Data.List


--quickCheck :: Testable prop => prop -> IO()   basic function to run tests
--verboseCheck :: Testable prop => prop -> IO()    printing of all test cases
--quickCheckWith :: Testable prop => Args -> prop -> IO()   Controlling e.g. number and sieze of test cases:
--conjuction and disjunction    .&&.    .||.


prop_even x y = even (x+y) == (even x == even y)
--不必指定prop_even的类型，其类型可以根据even自动推断


prop_reverseUnit x = [x] == reverse [x]

prop_reverseTwice xs = (reverse.reverse) xs == xs
{-需要指定测试类型,否则QuickCheck只会默认为()类型 quickCheck (prop_reverseUnit :: Int -> Bool)
                  quickCheck (prop_reverseTwice :: [Int] ->Bool)
-}

prop_reverseConcat :: [Int] -> [Int] -> Bool
prop_reverseConcat xs ys = reverse (xs ++ ys) == reverse ys ++ reverse xs


--测试sort函数的有序性质
ordered ::  Ord a => [a] -> Bool
ordered [] = True
ordered [x] =True
ordered (x:y:xs) = x <= y && ordered (y:xs)

prop_ordered xs = ordered $ sort xs


--implication   (==> :: Testable prop => Bool -> prop -> Property
prop_headMin :: Ord a =>[a] -> Property
prop_headMin xs = not (null xs) ==> head (sort xs) == minimum xs

--universal quantification
prop_Index :: Eq a => NonEmptyList [a] -> Property 
prop_Index (NonEmpty xs) = forAll (choose(0, length xs -1 )) $ \i -> xs !! i == head (drop i xs)

--label     (label :: Testable prop => String -> prop -> Property)     attaches a label to a test case



