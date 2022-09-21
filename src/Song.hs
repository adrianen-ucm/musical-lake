module Song (Song(..), songSounds) where

import           Animal (Animal)
import           Sound  (Sound)

-- | A representation of a 'Song' that implements a pretty
-- 'Show' instance.
newtype Song = Song { unSong :: [(Animal, Sound)] }

songSounds :: Song -> [Sound]
songSounds = map snd . unSong

instance Show Song where
  show = unlines . map showAnimalSound . unSong
    where
      showAnimalSound (animal, sound) = show animal <> ": " <> show sound
