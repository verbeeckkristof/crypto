/*
 This encryption is of a level that most hackers can not decrypt it a fair timespan
 it is however hackable if there is enough time
 also, the law does NOT allow you to encrypt data that is not a password related to logging in to your own application or system
 DO NOT USE THIS ENCRYPTION TO ENCRYPT DATA,THAT IS NOT A PASSWORD
 your application might get removed or rejected if you use it in any unlawful way
 i (the orininal creator of this file, Kristof) made this file available for use "as is" and i am not responsible for any lawsuits that you or the company you work for might face by using this encryption for encrypting or decrypting any form of digital data
 consult a lawyer before you use this file if you are in any doubt of wether you are allowed to use this file in your country
 */

import Foundation
import Darwin

extension MutableCollection where Indices.Iterator.Element == Index {
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled , unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: IndexDistance = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            guard d != 0 else { continue }
            let i = index(firstUnshuffled, offsetBy: d)
            swap(&self[firstUnshuffled], &self[i])
        }
    }
}

extension Sequence {
    func shuffled() -> [Iterator.Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}

class KVCipher {
    //private var word = "Hello, World!"
    
    private var cipherText = ""
    private var plainText = ""
    
    private let compareNumArray = [
        "0", "1",
        "00", "01", "10","11",
        "000","001","010","011","100","101","110","111",
        "0000","0001","0010","0011","0100","0101","0110","0111",
        "1000","1001","1010","1011","1100","1101","1110","1111"
        ]
    private let compareLetArray = [
        "D", "c",
        "i", "d", "A", "h",
        "L", "K", "a", "B", "o","F", "g", "G",
        "M" ,"I", "m", "b", "E","l", "j", "H",
        "C", "e", "n", "O", "N","f", "J", "k",
        
    ]
    
    
    private var numberKey = ["01011010", "01011000", "10010101", "00111011", "11110101", "11111000", "11001001", "01010011", "11110010", "00101001", "10011000", "01111101", "10110000", "11100010", "10110111", "10110010", "10111011", "11000101", "01001011", "00100011", "11001011", "01100011", "01111110", "11100100", "00111000", "01101101", "10100001", "01110010", "10101110", "01101000", "10111010", "10000111", "11111010", "10011011", "10100110", "11001000", "01111100", "01001100", "11000000", "11100101", "10011010", "00111001", "01100000", "10010001", "00101010", "10110100", "10101010", "10001000", "10101000", "11111001", "00111010", "10110110", "01110001", "10010011", "11010101", "10000010", "11001100", "00101110", "11111011", "11011011", "11010100", "00110110", "00111110", "01000000", "10000101", "01001000", "00110001", "10010110", "10001011", "10010100", "00100100", "11110000", "11010011", "01100100", "11011111", "01010111", "11001111", "00110101", "11110110", "01100101", "11011000", "11101101", "01010001", "11011010", "10101100", "10100010", "00100101", "00101111", "00100001", "01000011", "01101010", "11100000", "10101011", "01000101", "00101011", "00111111", "10111101", "01010010", "01011111", "11111111", "10100100", "11010000", "00110011", "01010110", "01011011", "11000100", "11100011", "10001001", "01101011", "01110111", "11010110", "11010111", "10111110", "11000010", "00110010", "01111001", "10101001", "10111000", "01111000", "01101110", "10001100", "10111100", "11001101", "01100110", "11110100", "11101110", "00110111", "10101101", "11010001", "11011001", "10001010", "10011100", "01011100", "01000100", "11110111", "00101101", "01110011", "11101001", "00111101", "11010010", "10010111", "11100001", "11000001", "10000110", "10111001", "01011110", "01111010", "10000000", "10100111", "01110101", "01011101", "01100001", "01000001", "11011101", "01011001", "00111100", "00101100", "11000011", "01000111", "10111111", "01001111", "00110000", "01010100", "01001110", "11011110", "10011001", "01111011", "11111100", "01100010", "11001110", "00100111", "01000010", "01110000", "01101001", "00110100", "11011100", "11101111", "10110011", "10010010", "10011110", "01101100", "01010000", "01110100", "11101100", "01001010", "11001010", "10001110", "00101000", "10100011", "11110001", "11111110", "00100110", "01001101", "10100101", "01110110", "01101111", "11000111", "01100111", "10000100", "11101010", "01001001", "11000110", "10110001", "00100010", "01010101", "11100110", "11111101", "10101111", "11110011", "11100111", "11101000", "01000110", "11101011", "10110101", "10011111", "10000011"]
    //private let key = [4,3,4,2,3]
    private var charKey = ["¼", "¿", "Â", "í", "É", "ó", "ú", "=", "x", "±", "€", "L", "™", "‚", "³", "I", ".", "A", "ã", "T", "^", "Ô", "M", "¡", "<", "?", "l", "á", "Œ", "¶", ";", "°", "j", "À", "é", "÷", "Ò", "š", "s", "b", "V", "ç", "B", "å", "N", "´", "c", "Ã", "¬", "]", "P", "Ì", "_", "Ñ", "ø", "C", "1", "ï", "Ó", "ž", "w", "K", "æ", "2", "k", "½", "ì", "4", "E", "à", "¹", "m", "Ð", "Ê", "¨", "%", "r", "¾", "â", "²", "¯", "9", "S", "f", "6", "{", "ñ", "J", "…", ">", "+", "W", "Û", "F", "X", "ü", "~", "!", "Þ", "Õ", "&", "Í", "7", "a", "\"", "-", "o", "È", "U", "µ", "u", "[", "Ž", "·", "Ü", "Æ", "ß", "v", "›", "p", "ª", "R", "Q", "ˆ", "‹", "n", "‘", "\'", "ä", "Î", "}", "y", "*", "Ÿ", "“", "`", "’", ":", "Ù", "Ý", "d", "t", "ý", "i", "\\", "ö", "Ø", "†", "¦", "‡", "0", "Ä", "Ö", "®", "„", "þ", "¥", "œ", "–", "G", "e", "•", "î", "¢", "©", "$", "—", "h", "è", "ê", "|", "Š", "ë", "Á", "¸", "3", "ð", "ƒ", "H", ",", "D", "ò", "«", "”", ")", "5", "Å", "/", "¤", "8", "»", "Ë", "q", "º", "O", "z", "˜", "Y", "Ú", " ", "@", "ÿ", "§", "ù", "g", "Ï", "õ", "ô", "#", "Z", "û", "(", "£", "×", "Ç", "‰"]

    private var saltKey = [
        1, 3, 3, 1, 4,
        4, 1, 3, 3, 1,
        3, 4, 1, 2, 2,
        1, 4, 2, 3, 4,
        3, 1, 3, 2, 1,
        3, 1, 1, 1, 3,
        2, 1, 2, 2, 3,
        4, 1, 3, 2, 1,
        4, 2, 3, 3, 1,
        2, 4, 3, 3, 3,
        2, 4, 1, 2, 2,
        2, 3, 3, 4, 3,
        4, 3, 2, 1, 2,
        3, 1, 3, 3, 2,
        2, 1, 3, 3, 3,
        4, 2, 2, 4, 3,
        2, 1, 1, 3, 1,
        2, 1, 3, 2, 1,
        4, 1, 4, 3, 4,
        4, 1, 4, 4, 3,
        2, 3, 3, 2, 2,
        3, 2, 2, 2, 3,
        3, 3, 1, 2, 3,
        2, 4, 3, 4, 2,
        3, 4, 3, 4, 4,
        1, 1, 2, 3, 1,
        2, 4, 3, 3, 2,
        4, 4, 1, 4, 1,
        1, 4, 2, 2, 2,
        3, 2, 3, 3, 1,
        4, 1, 2, 4, 1,
        1, 4, 4, 3, 3,
        3, 4, 3, 2, 2,
        3, 3, 4, 4, 1,
        4, 3, 1, 2, 1,
        1, 2, 2, 3, 3,
        2, 4, 3, 3, 3,
        4, 1, 2, 4, 2,
        2, 1, 1, 2, 2,
        1, 1, 4, 4, 1,
        4, 1, 3, 1, 3,
        1, 2, 2, 3, 2,
        2, 1, 4, 1, 1,
        1]
    
    private var tempStr = ""
    
    private var devidedArrayGlobal = [(String)]()
    private var key = [(Int)]()
    
    private func shuffleArrays() {
        numberKey = numberKey.shuffled()
        charKey = charKey.shuffled()
        saltKey = saltKey.shuffled()
        print(numberKey)
        print(charKey)
        print(saltKey)
    }
    
    func encrypt(PlainText:String) -> String {
        //var cipherTxt = ""
        //devidedArray.removeAll(keepingCapacity: false)
        cipherText = ""
        tempStr = ""
        preparePlainText(plainText: PlainText)
        devideInGroups(tmp: tempStr)
        return cipherText
    }
    
    private func preparePlainText(plainText:String) {
        cipherText = ""
        var counter = 0
        for i in plainText.characters {
            for b in charKey {
                if String(i) == b {
                    let tmp = "\(tempStr)\(numberKey[counter])"
                    key.append(saltKey[counter])
                    tempStr = tmp
                }
                counter += 1
            }
            counter = 0
        }
        //print(tempStr)
        key = key.reversed()
    }
    
    private func devideInGroups(tmp:String) {
        var counter = 0
        var step = 0
        var stepCounter = 0
        var tempstring = ""
        var devidedArray = [String]()
        for _ in tmp.characters {
            counter += 1
        }
        for x in tmp.characters {
            counter -= 1
            if step > (key.count - 1) {
                step = 0
            }
            tempstring = "\(tempstring)\(x)"
            if counter > 0{
                if stepCounter < key[step] {
                    stepCounter += 1
                    if stepCounter == key[step] {
                        devidedArray.append(tempstring)
                        stepCounter = 0
                        step += 1
                        tempstring = ""
                    }
                }
            } else {
                devidedArray.append(tempstring)
            }
        }
        //print(devidedArray)
        //userSalt(tmp: devidedArray)
        assignLettersTo(arr: devidedArray)
    }
    
    private func assignLettersTo(arr:Array<String>) {
        for i in arr {
            var count = 0
            for c in compareNumArray {
                if i == c {
                    let n = compareLetArray[count]
                    cipherText = "\(cipherText)\(n)"
                }
                count += 1
            }
        }
    }
    
    func decrypt(CipherText:String) -> String {
        let tmp = reverseToNumbers(txt: CipherText)
        let arr = makeDecryptionArray(txt: tmp)
        plainText = decryptString(arr: arr)
        return plainText
    }
    
    private func reverseToNumbers(txt:String) -> String {
        var tempPlainText = ""
        for a in txt.characters {
            var count = 0
            let i = "\(a)"
            for c in compareLetArray {
                if i == c {
                    let n = compareNumArray[count]
                    tempPlainText = "\(tempPlainText)\(n)"
                }
                count += 1
            }
        }
        return tempPlainText
    }
    
    private func makeDecryptionArray(txt:String) -> Array<String> {
        var counter = 0
        var devidedArray = [String]()
        var tmpTxt = ""
        for i in txt.characters {
            tmpTxt = "\(tmpTxt)\(i)"
            counter += 1
            if counter == 8 {
                devidedArray.append(tmpTxt)
                tmpTxt = ""
                counter = 0
            }
        }
        //print(devidedArray)
        return devidedArray
    }
    
    private func decryptString(arr:Array<String>) -> String {
        var tempPlainText = ""
        var counter = 0
        for i in arr {
            for c in numberKey {
                if i == c {
                    if charKey.count >= counter {
                        tempPlainText = "\(tempPlainText)\(charKey[counter])"
                    }
                }
                counter += 1
            }
            counter = 0
        }
        return tempPlainText
    }
}
