import UIKit
import MapKit
import CoreLocation
import WebKit

class StoryViewController: UIViewController {
	
	
	@IBOutlet weak var completeButton: UIButton!
	
	@IBAction func completeButton(sender: AnyObject) {
		//navigationController?.popViewControllerAnimated(true)
	}
	
	var status: String!
	
	var storyImage:[UIImage] = [
		UIImage(named: "PAGE ONE.png")!,
		UIImage(named: "PAGE TWO.png")!,
		UIImage(named: "PAGE THREE.png")!,
		UIImage(named: "PAGE FOUR.png")!,
		UIImage(named: "PAGE FIVE.png")!,
		UIImage(named: "PAGE SIX.png")!,
		UIImage(named: "PAGE SEVEN.png")!,
		UIImage(named: "PAGE EIGHT.png")!,
		UIImage(named: "PAGE NINE.png")!,
		UIImage(named: "PAGE TEN.png")!,
	]
    
	var imageIndex = 0
	
	@IBOutlet weak var imageView: UIImageView!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.completeButton.hidden = true
		
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "rightSwipe")
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "leftSwipe")
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
        
		print(status)
		
		imageView.image = storyImage.first
		
	}
    
    func updateImage() {
        imageView.image = storyImage[imageIndex]
		
		if imageView.image == storyImage.last  {
			
			self.completeButton.hidden = false
			
		}
		
		else {
		self.completeButton.hidden = true
		}
    }
    
    func rightSwipe() {
        if imageIndex > 0 {
            imageIndex--
            updateImage()
            print("Right swipe")
        }
    }
   
    func leftSwipe() {
        if imageIndex < storyImage.count - 1 {
            imageIndex++
            updateImage()
            print("Left swipe")
        }
        
    }

	
	
}

