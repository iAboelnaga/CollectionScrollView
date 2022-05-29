//
//  HowItWorksCell.swift
//  prospeirty
//
//  Created by Aboelnaga on 24/05/2022.
//

import UIKit

class HowItWorksCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(with indexPath:IndexPath){

        switch indexPath.row {
        case 0:
            descLabel.text = "Spin the picker in the key safe to enter your access code."
            imageView.image = UIImage(named: "how-it-work-1")
            UIView.transition(with: imageView,
                                duration: 1.5,
                                options: .transitionCrossDissolve,
                                animations: { self.imageView.image = UIImage(named: "how-it-work-2") },
                                completion: nil)
        case 1:
            descLabel.text = "Press the button to open the key safe."
            imageView.image = UIImage(named: "how-it-work-3")
        case 2:
            descLabel.text = "You'll find a key. Use it to open your property."
            imageView.image = UIImage(named: "how-it-work-4")
        case 3:
            descLabel.text = "Type in the lock code in the device on the door."
            imageView.image = UIImage(named: "how-it-work-5")
            UIView.transition(with: imageView,
                                duration: 1.5,
                                options: .transitionCrossDissolve,
                                animations: { self.imageView.image = UIImage(named: "how-it-work-6") },
                                completion: nil)
        case 4:
            descLabel.text = "Then open the handle."
            imageView.image = UIImage(named: "how-it-work-7")
        case 5:
            descLabel.text = "When you leave the property, press on the red button to lock the door."
            imageView.image = UIImage(named: "how-it-work-8")
        default:
            break
        }
    }
}
