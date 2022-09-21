module Animal (Animal(..), IAnimal(..)) where

import           Sound (Sound)

class IAnimal a where
  reactTo :: a -> Sound -> Maybe Sound

data Animal = forall a. (Show a, IAnimal a) => Animal a

instance Show Animal where
  show (Animal a) = show a

instance IAnimal Animal where
  reactTo (Animal a) = reactTo a
