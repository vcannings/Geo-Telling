import UIKit
import MapKit
import CoreLocation
import WebKit
import AudioToolbox
//MapKit and CoreLocation are used for the location related functionality, WebKit is for text and AudioToolBox is for the vibrate alert

class ViewController: UIViewController {

	@IBOutlet weak var bookButton: UIButton!
	@IBOutlet weak var bookImage: UIImageView!
	@IBOutlet weak var shelfLabel: UIImageView!
	@IBOutlet weak var completeIcon: UIImageView!
	//These are certain images on the main ViewController such as the first book on the shelf, a label beneath that book and an icon to show whether the book is complete or not
	
	let locationManager = CLLocationManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		UIDevice.currentDevice().setValue(UIInterfaceOrientation.Portrait.rawValue, forKey: "orientation")
		//application does not rotate with the screen orientation
		
		self.bookButton.hidden = true
		self.shelfLabel.hidden = true
        self.completeIcon.hidden = true
		//Certain images and buttons are hidden until the user enters the Geocache region
		
		locationManager.requestAlwaysAuthorization()
		locationManager.delegate = self
		locationManager.startUpdatingLocation()
		//Constantly check/update the user location
		
		let bournemouthPier = CLLocationCoordinate2D(latitude: 50.716098, longitude: -1.875780)
		let bournemouthPierRegion = CLCircularRegion(center: bournemouthPier, radius: 50, identifier: "Bournemouth")
		locationManager.startMonitoringForRegion(bournemouthPierRegion)
		//Setting the region for the Geocache and monitoring for if the user has entered it
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		
		if segue.identifier == "geocacheTransition" {
			let vc = segue.destinationViewController as! StoryViewController
            vc.delegate = self
			//When the user presses the book button, they will segue to the StoryViewController. We are passing a delegate protocol over here so that data can be passed between the two screens.
		}
	}
	
	
	override func shouldAutorotate() -> Bool {
		// Lock autorotate
		return false
	}
	
	override func preferredInterfaceOrientationForPresentation() -> UIInterfaceOrientation {
		// Only allow Portrait
		return UIInterfaceOrientation.Portrait
	}
}

extension ViewController: CLLocationManagerDelegate {
	
	func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		
			let newLocation = locations.last
		
			if let newLocation = newLocation {
				print(newLocation)
				//In the output log, the name of the new location will be printed everytime the user enters it
		}
	}
	
	func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
		print("Leaving \(region.identifier)")
		self.bookButton.hidden = true
		bookImage.image = UIImage(named: "BOOK FOUR.png")
		//navigationController?.popToRootViewControllerAnimated(true)
		//When the user exits the region, push them back to the main view. Comment out this function if you would like to spend more time on the StoryViewController page
		let refreshAlert = UIAlertController(title: "Story Unavailable", message: "You have left the appropriate region of the story and can no longer view it. Return to it's location to continue reading (displayed beneath the book on the shelf).", preferredStyle: UIAlertControllerStyle.Alert)
		//Notification will pop up when the user leaves the region of the geocache to tell them that the story is no longer available unless they return to the region
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
		//Vibrate when a notification pops up
		
		refreshAlert.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: { (action: UIAlertAction!) in
			refreshAlert .dismissViewControllerAnimated(true, completion: nil)
		}))
		
		presentViewController(refreshAlert, animated: true, completion: nil)
		}
	
	
	func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
		print("Entering \(region.identifier)")
		self.bookButton.hidden = false
		self.shelfLabel.hidden = false
		//When the user enters the region, the book icon status will change and allow them to go to the StoryViewController. A label will also appear beneath the book to tell you the location you found it in
		let refreshAlert = UIAlertController(title: "New Story Found!", message: "You have discovered a new story! You can view it by clicking it on your Bookshelf.", preferredStyle: UIAlertControllerStyle.Alert)
		//Alert will pop up
		AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
		//Alert will cause vibration (Had no way to actually test this, however)
		
		refreshAlert.addAction(UIAlertAction(title: "Dismiss", style: .Default, handler: { (action: UIAlertAction!) in
			
			refreshAlert .dismissViewControllerAnimated(true, completion: nil)
			
		}))
		
		presentViewController(refreshAlert, animated: true, completion: nil)
	}
}


extension ViewController: StoryViewControllerDelegate {
    func tickBook(bookNumber: Int) {
        print("tick off book \(bookNumber)")
        completeIcon.hidden = false
    }
	//Defining the functions to be called in the protocols 
    
    func untickBook(bookNumber: Int) {
        completeIcon.hidden = true
    }
	
	//Sends the protocols to the StoryViewController so that data can be passed between views
}




		


	