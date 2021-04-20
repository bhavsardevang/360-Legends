//
//  TextViewTableViewCell.swift
//  Legends
//
//   on 10/04/21.
//

import UIKit
typealias passvalue = (String,Int) -> Void
class TextViewTableViewCell: UITableViewCell {
    var strPlaceHolder = "Write your answer here....."
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var txtView: UITextView!
    @IBOutlet weak var viewTextView: UIView!
    var txtvalue:passvalue?
    @IBOutlet weak var layoutConstraintOfViewTop: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
     
        self.setBorderTextView()
    }
    func setBorderTextView() {
        self.txtView.isUserInteractionEnabled = true
        self.txtView.delegate = self
        self.txtView.layer.masksToBounds = true
        self.txtView.layer.borderWidth = 1.0
        self.txtView.layer.borderColor = hexStringToUIColor(hex: "979797").cgColor
    }
}
extension TextViewTableViewCell:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text == "" {
            textView.text = strPlaceHolder
        } else {
            txtvalue!(textView.text, textView.tag)
        }
        
    }
    func textViewDidChange(_ textView: UITextView) {
       // txtvalue!(txtView.text, textView.tag)
    }
}
