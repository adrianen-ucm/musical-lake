module Parser (parseInput) where

import           Data.Functor.Identity (Identity)
import           Sound                 (Sound)
import           Text.Parsec           (ParseError, ParsecT, Stream, choice,
                                        eof, parse, spaces, string, try)

-- | Parse just a 'Sound', which is the input of the main program.
parseInput :: Stream s Identity Char => s -> Either ParseError Sound
parseInput = parse (spaces *> sound <* spaces <* eof) ""

-- | Simple parser for any type that implements 'Show' and 'Enum'.
sound :: (Show e, Enum e) => Stream s m Char => ParsecT s u m e
sound = choice $ map fromShow sounds
  where
    sounds = enumFrom $ toEnum 0
    fromShow s = s <$ try (string (show s))
