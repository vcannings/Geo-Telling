import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
	

@IBOutlet weak var bookButton: UIButton!
@IBOutlet weak var bookImage: UIImageView!

	
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.bookButton.hidden = true
		
		locationManager.requestAlwaysAuthorization()
		locationManager.delegate = self
		locationManager.startUpdatingLocation()
		
		let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
		let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 50, identifier: "Bournemouth")
		locationManager.startMonitoringForRegion(bournemouthPierRegion)
		
		
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "geocacheTransition" {
			let vc = segue.destinationViewController as! StoryViewController
			vc.name = "Verity"
		}
		
	}

	
}

extension ViewController: CLLocationManagerDelegate {
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
			let newLocation = locations.last
		
			if let newLocation = newLocation {
				print(newLocation)
		}
		
	}
	
	func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
		print("Leaving \(region.identifier)")
		self.bookButton.hidden = true
		bookImage.image = UIImage(named: "BOOK FOUR.png")
		//navigationController?.popToRootViewControllerAnimated(true)
	}
	
	func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
		print("Entering \(region.identifier)")
		self.bookButton.hidden = false
	}

	
}