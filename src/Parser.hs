module Parser (parseInput) where

import           Data.Functor.Identity (Identity)
import           Sound                 (Sound)
import           Text.Parsec           (ParseError, ParsecT, Stream, choice,
                                        eof, parse, spaces, string, try)

parseInput :: Stream s Identity Char => s -> Either ParseError Sound
parseInput = parse (spaces *> sound <* spaces <* eof) ""

sound :: Stream s m Char => ParsecT s u m Sound
sound = choice $ map fromShow sounds
  where
    sounds = enumFrom $ toEnum 0
    fromShow s = s <$ try (string (show s))
