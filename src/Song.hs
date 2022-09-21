module Song (Song(..), sounds) where

import           Animal (Animal)
import           Sound  (Sound)

newtype Song = Song { unSong :: [(Animal, Sound)] }

sounds :: Song -> [Sound]
sounds = map snd . unSong

instance Show Song where
  show = unlines . map showAnimalSound . unSong
    where
      showAnimalSound (animal, sound) = show animal <> ": " <> show sound
