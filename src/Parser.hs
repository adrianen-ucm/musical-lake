module Parser (parseInput) where

import           Data.Functor.Identity (Identity)
import           Data.List             (intersperse)
import           Sound                 (Sound)
import           Text.Parsec           (ParseError, ParsecT, Stream, choice,
                                        eof, parse, spaces, string, try, (<?>))

-- | Parse just a 'Sound', which is the input of the main program.
parseInput :: Stream s Identity Char => s -> Either ParseError Sound
parseInput = parse (spaces *> enumParser <* spaces <* eof) ""

-- | Simple parser for any type that implements 'Show' and 'Enum'.
enumParser :: (Show e, Enum e) => Stream s m Char => ParsecT s u m e
enumParser = choice (map fromShow values) <?> expecting
  where
    values = enumFrom $ toEnum 0
    fromShow s = s <$ try (string (show s))
    expecting = "(" <> mconcat (intersperse "|" (map show values)) <> ")"
