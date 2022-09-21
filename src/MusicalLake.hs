module MusicalLake (IMusicalLake(..), MusicalLake, Song, runMusicalLake) where

import           Animal                           (Animal (Animal),
                                                   IAnimal (reactTo))
import           Control.Monad.IO.Class           (MonadIO)
import           Control.Monad.Trans.State.Strict (StateT, evalStateT, get,
                                                   modify')
import           Data.Maybe                       (mapMaybe)
import           Song                             (Song (..))
import           Sound                            (Sound)

class IMusicalLake m where
  joinTheBand :: (Show a, IAnimal a) => a -> m ()
  continueFrom  :: Sound -> m Song

newtype MusicalLake m a = MusicalLake
  { unMusicalLake :: StateT [Animal] m a
  } deriving (Functor, Applicative, Monad, MonadIO)

runMusicalLake :: Monad m => MusicalLake m a -> m a
runMusicalLake = flip evalStateT [] . unMusicalLake

instance Monad m => IMusicalLake (MusicalLake m) where
  joinTheBand animal = MusicalLake . modify' $ (Animal animal :)
  continueFrom = (Song <$>) . MusicalLake . go
    where
      reaction sound animal = (,) animal <$> animal `reactTo` sound
      go sound = do
        reactions <- mapMaybe (reaction sound) <$> get
        case reactions of
          []    -> pure []
          p : _ -> (p :) <$> go (snd p)
