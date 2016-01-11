import UIKit
import MapKit
import CoreLocation

class LocationViewController: UIViewController {
	
	var name: String?
	//Here we are taking the data sent by the segue in the StoryViewController
	
	@IBOutlet weak var hiddenHint: UIImageView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.hiddenHint.hidden = false
		
		if name == "complete" {
			self.hiddenHint.hidden = true
		//The next story location hint will become visible if the data has been passed from the StoryViewController upon completion of the story
		} else {
			self.hiddenHint.hidden = false
		}
	}
}