module Animal.Dragonfly (Dragonfly(..)) where

import           Animal (IAnimal (..))
import           Sound  (Sound (..))

-- A Dragonfly, which is an IAnimal.
data Dragonfly = Dragonfly

instance Show Dragonfly where
  show Dragonfly = "🐉"

instance IAnimal Dragonfly where
  reactTo Dragonfly Brr    = Just Fiu
  reactTo Dragonfly BriBri = Just Plop
  reactTo Dragonfly _      = Nothing
