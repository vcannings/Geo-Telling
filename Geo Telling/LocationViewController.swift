import UIKit
import MapKit
import CoreLocation



class LocationViewController: UIViewController {
	
	var name: String?
	
	@IBOutlet weak var testImage: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.testImage.hidden = true
		
		if name == "complete" {
			self.testImage.hidden = false
		} else {
			self.testImage.hidden = true
		}
	}
	
}