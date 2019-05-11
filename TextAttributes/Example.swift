import UIKit

class vc: UIViewController {

    let label: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add attributes like this:

        let attributes = TextAttributes {
            return $0.backgroundColor(.red)
                .strokeColor(.green)
        }
        label.attributedText = "some text".attributed(with: attributes)

        // or like this, while showing the replace functinality:

        let otherAttributes = TextAttributes(types: [ .font(UIFont.systemFont(ofSize: 14)),
                                                      .textColor(.blue) ])

        label.attributedText = label.attributedText?.replace(part: "text", with: otherAttributes)
    }
}
