-- asciiart Haskell (ghc 8.4.4)
import Control.Monad

mandel 16 _ _ _ _ = putChar ' '
mandel i a b ca cb = do
    if (a' * a' + b' * b') > 4.0
        then putChar ("0123456789ABCDEF" !! i)
        else mandel (i+1) a' b' ca cb
    where
        a' = a * a - b * b + ca
        b' = 2 * a * b + cb

main = do
    forM_ [-12..12] $ \y -> do
        forM_ [-39..39] $ \x -> do
            let ca = x * 0.0458
            let cb = y * 0.08333
            mandel 0 ca cb ca cb
        putStrLn ""
