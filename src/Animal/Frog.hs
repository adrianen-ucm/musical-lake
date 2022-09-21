module Animal.Frog (Frog(..)) where

import           Animal (IAnimal (..))
import           Sound  (Sound (..))

-- A Frog, which is an IAnimal.
data Frog = Frog

instance Show Frog where
  show Frog = "🐸"

instance IAnimal Frog where
  reactTo Frog Pep      = Just Birip
  reactTo Frog CricCric = Just Brrah
  reactTo Frog TrriTrri = Just Croac
  reactTo Frog _        = Nothing
