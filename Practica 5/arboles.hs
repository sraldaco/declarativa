data List a = Nil | Cons a (List a) deriving (Show, Read, Eq, Ord)
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Show)

lista = (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 Nil)))))
tree = (Node (Node (Node (Node (Node Leaf 1 Leaf) 2 Leaf) 3 Leaf) 4 Leaf) 5 Leaf)

tailList :: List a -> List a
tailList (Cons _ Nil) = Nil
tailList (Cons _ a) = a

initList :: List a -> List a
initList (Cons a Nil) = Nil
initList (Cons a b) = Cons a (initList b)

lastList :: List a -> a
lastList (Cons a Nil) = a
lastList list = lastList (tailList list)

firstTree :: BinaryTree a -> a
firstTree (Node _ a _)  = a

lastTree :: BinaryTree a -> a
lastTree (Node Leaf a Leaf) = a
lastTree (Node b a Leaf) = lastTree b

initTree :: BinaryTree a -> BinaryTree a
initTree (Node (Node Leaf a Leaf) b Leaf) = (Node Leaf b Leaf)
initTree (Node b a Leaf) = (Node (initTree b) a Leaf)

fromListBinaryTree :: List a -> BinaryTree a
fromListBinaryTree Nil = Leaf
fromListBinaryTree list = (Node (fromListBinaryTree (initList list)) (lastList list) Leaf)

preOrderBinaryTree :: BinaryTree a -> List a
preOrderBinaryTree (Node Leaf a Leaf) = (Cons a Nil)
preOrderBinaryTree (Node b a Leaf) = (Cons a (preOrderBinaryTree b))

inOrderBinaryTree :: BinaryTree a -> List a
inOrderBinaryTree (Node Leaf a Leaf) = (Cons a Nil)
inOrderBinaryTree  a = (Cons (lastTree a) (inOrderBinaryTree (initTree a)))

postOrderBinaryTree :: BinaryTree a -> List a
postOrderBinaryTree (Node Leaf a Leaf) = (Cons a Nil)
postOrderBinaryTree  a = (Cons (lastTree a) (postOrderBinaryTree (initTree a)))

insertBinaryTree :: Ord a => a -> BinaryTree a -> BinaryTree a
insertBinaryTree n (Node Leaf a Leaf)
    | n <= a = (Node (Node Leaf n Leaf) a Leaf)
    | n > a = (Node (Node Leaf a Leaf) n Leaf)
insertBinaryTree n (Node b a Leaf)
    | n == a = (Node (Node b a Leaf) n Leaf)
    | n > a = (Node (Node b a Leaf) n Leaf)
    | n < a = if n < firstTree b 
                then (Node (insertBinaryTree n b) a Leaf)
                else (Node (Node b n Leaf) a Leaf)

takeBinaryTree :: Int -> BinaryTree a -> BinaryTree a
takeBinaryTree n _ | n < 1 = Leaf
takeBinaryTree _ Leaf = Leaf
takeBinaryTree n (Node b a Leaf) = (Node (takeBinaryTree (n-1) b) a Leaf)

takeWhileBinaryTree :: (a -> Bool) -> BinaryTree a -> BinaryTree a
takeWhileBinaryTree _ Leaf = Leaf
takeWhileBinaryTree n (Node b a Leaf) = 
    if n a
        then (Node (takeWhileBinaryTree n b) a Leaf)
        else (takeWhileBinaryTree n b)

mapBinaryTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapBinaryTree f Leaf = Leaf
mapBinaryTree f (Node b a Leaf) = (Node (mapBinaryTree f b) (f a) Leaf)
    
foldBinaryTree :: (a -> a -> a) -> BinaryTree a -> a
foldBinaryTree f (Node Leaf a Leaf) = a
foldBinaryTree f (Node b a Leaf) = (f a (foldBinaryTree f b)) 

        

