# crypto
KVCipher is a Swift file to encrypt and decrypt String vallues in any iOS, MacOS WatchOS and TvOS app

Usage:

Drag and drop KVCipher.swift into your Xcode Project (using Swift 3+)
Create a variable to refference the file
    let crypt = KVCipher()

Now you can encrypt any string, Date, Float, Int... using the KVCipher algorithem
use this code to see to see it in action
    var plaintext = "Hello, World!"
    let ciphertxt = crypt.encrypt(PlainText: plaintext)
    print(ciphertxt)
    let plaintxt = crypt.decrypt(CipherText: ciphertxt)
    print(plaintxt)

happy crypting!!!
