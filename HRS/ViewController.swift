import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heartLabel: UILabel!

    @IBAction func authorizeTapped(sender: AnyObject) {
        HealthKitManager.authorizeHealthKit()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            HealthKitManager.getTodaysHeartRates{ (value) in
                DispatchQueue.main.async {
                    self.heartLabel.text = "\(value) ❤️"
                }
            }
        }.fire()
    }
    
}

