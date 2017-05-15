import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var plain: UITextView!
    @IBOutlet weak var plaintextView: UITextView!
    @IBOutlet weak var ciphertextView: UITextView!
    var plaintext = ""
    var cipherText = ""
    let crypt = KVCipher()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func encryptData(_ sender: Any) {
        plaintext = plain.text
        let ciphertxt = crypt.encrypt(PlainText: plaintext)
        let plaintxt = crypt.decrypt(CipherText: ciphertxt)
        plaintextView.text = plaintxt
        ciphertextView.text = ciphertxt
        plain.resignFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
