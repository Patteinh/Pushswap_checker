{-
-- EPITECH PROJECT, 2023
-- pushswap_cheker.hs
-- File description:
-- check sequence of push_swap operations
-}

import Prelude
import Text.Read
import System.Exit
import System.Directory.Internal.Prelude (getArgs)
import Data.Maybe

swapElem :: [String] -> [String]
swapElem [] = []
swapElem [x] = [x]
swapElem (x:y:z) = y:x:z

rotateFirstElem :: [String] -> [String]
rotateFirstElem [] = []
rotateFirstElem (x:xs) = xs ++ [x]

rotateLastElem :: [String] -> [String]
rotateLastElem [] = []
rotateLastElem z = last z : init z

pickA :: ([String], [String]) -> ([String], [String])
pickA (a, []) = (a, [])
pickA  (a, b) = (head b:a, tail b)

pickB :: ([String], [String]) -> ([String], [String])
pickB ([], a) = ([], a)
pickB (a, b) = (tail a, head a:b)

doRotate :: String -> ([String], [String]) -> ([String], [String])
doRotate "ra" (a, b) = (rotateFirstElem a, b)
doRotate "rb" (a, b) = (a, rotateFirstElem b)
doRotate "rr" (a, b) = (rotateFirstElem a, rotateFirstElem b)
doRotate "rra" (a, b) = (rotateLastElem a, b)
doRotate "rrb" (a, b) = (a, rotateLastElem b)
doRotate "rrr" (a, b) = (rotateLastElem a, rotateLastElem b)
doRotate _ (a, b) = (a, b)

doSwapPick :: String -> ([String], [String]) -> ([String], [String])
doSwapPick "sa" (a, b) = (swapElem a, b)
doSwapPick "sb" (a, b) = (a, swapElem b)
doSwapPick "sc" (a, b) = (swapElem a, swapElem b)
doSwapPick "pa" (a, b) = pickA (a, b)
doSwapPick "pb" (a, b) = pickB (a, b)
doSwapPick _ (a, b) = (a, b)

doCmd :: String -> ([String], [String]) -> ([String], [String])
doCmd cmd t | (head cmd == 's') ||  (head cmd == 'p') = doSwapPick cmd t
            | head cmd == 'r' = doRotate cmd t
            | otherwise = t

startCmd :: ([String], [String]) -> [String] -> ([String], [String])
startCmd (a, b) [] = (a, b)
startCmd (a, b) cmd = startCmd (doCmd (head cmd) (a, b)) (tail cmd)

isInt :: String -> Bool
isInt s = case readMaybe s :: Maybe Int of
    Just _ -> True
    Nothing -> False

isCmdOk :: [String] -> String -> Bool
isCmdOk s cmd = all (`elem` words cmd) s

checkArgs :: [String] -> [String] -> Bool
checkArgs i a | not (all isInt i) = False
              | null i = False
              | not (isCmdOk a "sa sb sc pa pb ra rb rr rra rrb rrr") = False
              | otherwise = True

stringToInt :: String -> Int
stringToInt s = fromMaybe 0 (readMaybe s)

toIntList :: [String] -> [Int]
toIntList = map stringToInt

isSorted :: [Int] -> Bool
isSorted [] = False
isSorted [_] = True
isSorted (x:y:xs) = x <= y && isSorted (y:xs)

isListValid :: ([Int], [String]) -> Bool
isListValid (a, b) | not (null b) = False
                   | not (isSorted a) = False
                   | otherwise = True

pCheck :: [String] -> [String] -> IO ()
pCheck i a | not (checkArgs i a) = exitWith (ExitFailure 84)
           | otherwise = let (x, y) = startCmd (i, []) a in
           if isListValid (toIntList x, y)
            then putStrLn "OK"
            else putStrLn "KO"

main :: IO ()
main = do
    pushIntList <- getArgs
    pushCmd <- getLine
    let cmdList = filter (not . null) $ words pushCmd
    pCheck pushIntList cmdList
