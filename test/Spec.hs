module Main (main) where

import           Animal.Cricket        (Cricket (Cricket))
import           Animal.Dragonfly      (Dragonfly (Dragonfly))
import           Animal.Frog           (Frog (Frog))
import           Control.Monad         (forM_)
import           Data.Functor.Identity (Identity (runIdentity))
import           Data.List             (tails, uncons)
import           MusicalLake           (IMusicalLake (continueFrom, joinTheBand),
                                        runMusicalLake)
import           Song                  (songSounds)
import           Sound                 (Sound (..))
import           Test.Hspec            (Spec, describe, hspec, it)

main :: IO ()
main = hspec $ mapM_ songSpec
  [ [Brr, Fiu, CricCric, Brrah]
  , [Pep, Birip, TrriTrri, Croac]
  , [BriBri, Plop, CricCric, Brrah]
  ]

songSpec :: [Sound] -> Spec
songSpec sounds =
  describe ("Song with sounds " <> show sounds) $
    forM_ (tails sounds) $
      maybe (pure ()) (uncurry continueSongSpec) . uncons


continueSongSpec :: Sound -> [Sound] -> Spec
continueSongSpec sound following =
  it ("Continue from " <> show sound) $
    songSounds song == following
  where
    song = runIdentity $ runMusicalLake $ do
      joinTheBand Frog
      joinTheBand Dragonfly
      joinTheBand Cricket
      continueFrom sound
