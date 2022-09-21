module Animal.Cricket (Cricket(..)) where

import           Animal (IAnimal (..))
import           Sound  (Sound (..))

-- A Cricket, which is an IAnimal.
data Cricket = Cricket

instance Show Cricket where
  show Cricket = "🦗"

instance IAnimal Cricket where
  reactTo Cricket Fiu   = Just CricCric
  reactTo Cricket Plop  = Just CricCric
  reactTo Cricket Birip = Just TrriTrri
  reactTo Cricket _     = Nothing
