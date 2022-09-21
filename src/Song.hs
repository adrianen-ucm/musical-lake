module Song (Song(..), songSounds) where

import           Animal (Animal)
import           Sound  (Sound)

newtype Song = Song { unSong :: [(Animal, Sound)] }

songSounds :: Song -> [Sound]
songSounds = map snd . unSong

instance Show Song where
  show = unlines . map showAnimalSound . unSong
    where
      showAnimalSound (animal, sound) = show animal <> ": " <> show sound
