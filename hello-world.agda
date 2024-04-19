{-# OPTIONS --guardedness #-}
module hello-world where

open import IO
open import Level

main = run {0ℓ} (putStrLn "Hello, World!")
