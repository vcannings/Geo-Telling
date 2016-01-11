import UIKit
import MapKit
import CoreLocation



class LocationViewController: UIViewController {
	
	var name: String?
	
	
	@IBOutlet weak var hiddenHint: UIImageView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hiddenHint.hidden = false
		
		if name == "complete" {
			self.hiddenHint.hidden = true
		} else {
			self.hiddenHint.hidden = false
		}
	}
	
}