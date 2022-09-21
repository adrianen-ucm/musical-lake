module MusicalLake (IMusicalLake(..), MusicalLake, Song, runMusicalLake) where

import           Animal                           (Animal (Animal),
                                                   IAnimal (reactTo))
import           Control.Monad.IO.Class           (MonadIO)
import           Control.Monad.Trans.State.Strict (StateT, evalStateT, get,
                                                   modify')
import           Data.Maybe                       (mapMaybe)
import           Song                             (Song (..))
import           Sound                            (Sound)

-- | An interface for The Musical Lake.
class IMusicalLake m where
  -- | Any instance of 'IAnimal' and 'Show' can join the band.
  joinTheBand :: (Show a, IAnimal a) => a -> m ()
  -- | Continue a 'Song' from a given 'Sound'.
  continueFrom  :: Sound -> m Song

-- | An implementation of The Musical Lake. It registers
-- the 'Animal's in a state.
newtype MusicalLake m a = MusicalLake
  { unMusicalLake :: StateT [Animal] m a
  } deriving (Functor, Applicative, Monad, MonadIO)

runMusicalLake :: Monad m => MusicalLake m a -> m a
runMusicalLake = flip evalStateT [] . unMusicalLake

instance Monad m => IMusicalLake (MusicalLake m) where
  joinTheBand animal = MusicalLake . modify' $ (Animal animal :)
  continueFrom = (Song <$>) . MusicalLake . go
    where
      -- | We assume that, in the real world, at most one 'Animal'
      -- is going to react to a 'Sound', so we arbitrarily take the
      -- first one that does it.
      reaction sound animal = (,) animal <$> animal `reactTo` sound
      go sound = do
        reactions <- mapMaybe (reaction sound) <$> get
        case reactions of
          []    -> pure []
          p : _ -> (p :) <$> go (snd p)
