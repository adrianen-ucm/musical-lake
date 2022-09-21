module Animal (Animal(..), IAnimal(..)) where

import           Sound (Sound)

-- | A type that is able to react to a given sound
-- with another optional sound.
class IAnimal a where
  reactTo :: a -> Sound -> Maybe Sound

-- | A wrapper for any type that implements 'IAnimal'
-- and 'Show'.
data Animal = forall a. (Show a, IAnimal a) => Animal a

-- | Trivial instances for an existentially wrapped
-- 'IAnimal'.
instance Show Animal where
  show (Animal a) = show a

instance IAnimal Animal where
  reactTo (Animal a) = reactTo a
