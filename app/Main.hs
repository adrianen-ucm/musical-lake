module Main (main) where

import           Animal.Cricket         (Cricket (Cricket))
import           Animal.Dragonfly       (Dragonfly (Dragonfly))
import           Animal.Frog            (Frog (Frog))
import           Control.Monad.IO.Class (MonadIO (liftIO))
import           MusicalLake            (IMusicalLake (continueFrom, joinTheBand),
                                         runMusicalLake)
import           Parser                 (parseInput)
import           System.Exit            (exitFailure)

main :: IO ()
main = runMusicalLake $ do
  liftIO $ putStrLn "Type the last sound you heard:"
  input <- liftIO getLine
  sound <- case parseInput input of
    Right sound -> pure sound
    Left err -> liftIO $ do
      print err
      exitFailure
  joinTheBand Frog
  joinTheBand Dragonfly
  joinTheBand Cricket
  song <- continueFrom sound
  liftIO $ print song
