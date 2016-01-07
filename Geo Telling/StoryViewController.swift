import UIKit
import MapKit
import CoreLocation
import WebKit

protocol StoryViewControllerDelegate {
    func tickBook(bookNumber: Int)
    func untickBook(bookNumber: Int)
	//calls the dekegate protocols from the main view controller, sends information when buttons are pressed
}


class StoryViewController: UIViewController {
	
    var delegate: StoryViewControllerDelegate?
    
    @IBOutlet weak var incompleteButton: UIButton!
    @IBAction func incompleteButton(sender: AnyObject) {
        delegate?.untickBook(1)
		//hides complete icon if visible
    }
    @IBOutlet weak var completeButton: UIButton!
    @IBAction func completeButton(sender: AnyObject) {
        delegate?.tickBook(1)
		//shows complete icon if hidden
    }
   
	
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
	//an array of images stored in an image view, navigated by changing the array index
    
	var imageIndex = 0
	
	@IBOutlet weak var imageView: UIImageView!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
	   self.completeButton.hidden = true
        self.incompleteButton.hidden = true
		
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "rightSwipe")
        rightSwipe.direction = .Right
        view.addGestureRecognizer(rightSwipe)
		
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "leftSwipe")
        leftSwipe.direction = .Left
        view.addGestureRecognizer(leftSwipe)
		
		//Setting up the application to recognize swipe gestures
		
		imageView.image = storyImage.first
		//Setting the default image to the first item in the array
		
	}
    
    func updateImage() {
        imageView.image = storyImage[imageIndex]
		//constantly updating the image view after swiping
        if imageIndex == 9 {
        self.completeButton.hidden = false
        self.incompleteButton.hidden = false
        } else {
            self.completeButton.hidden = true
            self.incompleteButton.hidden = true
        }
		//making the complete/incomplete buttons visible if the user reaches the last image
    }
    
    func rightSwipe() {
        if imageIndex > 0 {
            imageIndex--
            updateImage()
            print("Right swipe")
        }
		//lets the user swipe right until they reach the first image in the array
    }
   
    func leftSwipe() {
        if imageIndex < storyImage.count - 1 {
            imageIndex++
            updateImage()
            print("Left swipe")
        }
       //lets the user swipe left until they reach the last image in the array
    }

	
	
}

