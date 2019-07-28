import Prelude hiding (succ, pred)

data Lista a = Nil | Cons a (Lista a) deriving (Show, Read, Eq, Ord)
data Nat = Zero | D Nat | O Nat deriving (Show, Read, Eq)

lista = (Cons 2 (Cons 3 (Cons 4 (Cons 5 Nil))))

headList :: Lista a -> a
headList (Cons a _) = a

tailList :: Lista a -> Lista a
tailList (Cons _ Nil) = Nil
tailList (Cons _ a) = a

initList :: Lista a -> Lista a
initList (Cons a Nil) = Nil
initList (Cons a b) = Cons a (initList b)

lastList :: Lista a -> a
lastList (Cons a Nil) = a
lastList list = lastList (tailList list)

lengthList :: Lista a -> Int
lengthList Nil = 0
lengthList list = 1 + lengthList (tailList list)

nthElementList :: Int -> Lista a -> a
nthElementList _ Nil = error "No se encuentra el elemento"
nthElementList n _ | n < 0 = error "No se encuentra el elemento"
nthElementList n list
    | n > 0 = nthElementList (n - 1) (tailList list)
    | n == 0 = headList list

deleteNthElementList :: Int -> Lista a -> Lista a
deleteNthElementList _ Nil = Nil
deleteNthElementList n list
    | n /= 0 = Cons (headList list) (deleteNthElementList (n -1) (tailList list))
    | n == 0 = deleteNthElementList (n -1) (tailList list)

addFirstList :: a -> Lista a -> Lista a
addFirstList a list = Cons a list

addLastList :: a -> Lista a -> Lista a
addLastList a Nil = Cons a Nil
addLastList a list = Cons (headList list) (addLastList a (tailList list))

reverseList :: Lista a -> Lista a
reverseList Nil = Nil
reverseList list = Cons (lastList list) (reverseList (initList list))

appendList :: Lista a -> Lista a -> Lista a
appendList Nil Nil = Nil
appendList Nil list = list
appendList list Nil = list
appendList list l = Cons (headList list) (appendList ( tailList list) l)

takeList :: Int -> Lista a -> Lista a
takeList _ Nil = Nil
takeList n _ | n < 1 = Nil
takeList n list = Cons (headList list) (takeList (n - 1) (tailList list))

toNat :: Int -> Nat
toNat n 
    | n == 0 = Zero 
    | n `mod` 2 == 0 = (D (toNat (n `div` 2))) 
    | n `mod` 2 == 1 = (O (toNat ((n -1) `div` 2)))

instance Ord Nat where
    compare Zero Zero = EQ
    compare Zero _    = LT
    compare _    Zero = GT
    compare (O m) (D n) = compare m n
    compare (D m) (O n) = compare m n
    compare (O m) (O n) = compare m n
    compare (D m) (D n) = compare m n

succ :: Nat -> Nat
succ Zero  = O Zero
succ (O Zero) = D (O Zero)
succ (O (O Zero)) = D (D (O Zero))
succ (D (D n)) = O (D (succ n))
succ (O (D n)) = D (O (succ n))
succ (D (O n)) = O (O (succ n))
succ (O (O n)) = D (D (D (succ n)))

pred :: Nat -> Nat
pred Zero = error "No existe"
pred (O Zero) = Zero
pred (D n) = n
pred (O n) = n
