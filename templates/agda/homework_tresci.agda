
module homework_tresci where

-- Poniższe importy są przydatne i wystarczające do rozwiązań. Importuję wszystko explicit, żeby podpowiedzieć jak się rzeczy nazywają.
-- Polecam https://agda.github.io/agda-stdlib/v1.7.3/ do przeglądania biblioteki standardowej (zwróć uwagę na wersję).

-- Znaki matematyczne wpisujemy naciskając "\" a następnie wpisując (zwykle?) latexową nazwę symbolu.

open import Data.Nat using (ℕ; suc; zero; _*_; _≤_; s≤s; z≤n; _+_)
open import Relation.Binary.PropositionalEquality using (_≡_; _≢_)  
open import Relation.Binary.PropositionalEquality using (refl; trans; sym; cong; subst)
import Relation.Binary.PropositionalEquality as Eq
open Eq.≡-Reasoning using (begin_; _≡⟨⟩_; step-≡; _∎)
open import Data.Product using (Σ-syntax; _,_; ∃-syntax; ∃; proj₁; proj₂; _×_)
open import Relation.Nullary using ( ¬_ )
open import Function using ( _∘_; _$_ )
open import Data.Nat.Properties using (+-assoc; +-comm; +-identityʳ; +-identityˡ)
open import Data.List using (List; _∷_; []; [_]; map; _++_; concatMap; concat)
open import Data.List.Properties using (concat-++; ++-identityʳ; map-++-commute)

-- zadanie 1 - treść (propozycja: 0.5 pkt)

-- Definiujemy pierwszość liczby naturalnej w następujący sposób:

_divides_ : ℕ -> ℕ -> Set
n divides m = ∃[ k ] (n * k ≡ m)

_properly-divides_ : ℕ -> ℕ -> Set
n properly-divides m = n divides m × n ≢ 1 × n ≢ m

Is-prime : ℕ -> Set
Is-prime k = ∀ ( x : ℕ ) -> x ≤ k -> ¬ (x properly-divides k)

-- Zdefiniuj następującą wartość:

not-prime-4 : ¬ (Is-prime 4)
not-prime-4 = ?

-- zadanie 2 - treść (propozycja: 1 pkt)

-- Zdefiniuj własność przemienności mnożenia i udowodnij ją.
-- Dozwolone jest korzystanie z przemienności i łączności dodawania (`+-comm`, `+-assoc`).

-- zadanie 3 - treść (propozycja: 0.5 pkt)

-- Zdefiniuj następującą wartość:

map-compose : {A B C : Set} (f : B -> C) (g : A -> B) -> (xs : List A) -> map (f ∘ g) xs ≡ (map f ∘ map g) xs
map-compose = ?

-- zadanie 4 - treść (propozycja: 1.5 pkt)

-- Definiujemy następująco operator >=> używając `concatMap` z Data.List:

_>=>_ : { A B C : Set } -> (A -> List B) -> (B -> List C) -> A -> List C
f >=> g = λ a -> concatMap g $ f a

-- Udowodnij, że jest przemienny, tzn zdefiniuj:

>=>-assoc : { A B C D : Set } -> (f : A -> List B) -> (g : B -> List C) -> ( h : C -> List D )
  -> ( a : A ) -> ((f >=> g) >=> h) a ≡ (f >=> (g >=> h)) a
>=>-assoc = ?

-- Dozwolone jest korzystanie z biblioteki standardowej,
-- pomocne mogą być importowane wyżej lematy `concat-++`, `++-identityʳ`, `map-++-commute`.
