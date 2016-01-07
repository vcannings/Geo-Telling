import UIKit
import MapKit
import CoreLocation
import WebKit

protocol StoryViewControllerDelegate {
    func tickBook(bookNumber: Int)
    func untickBook(bookNumber: Int)
}


class StoryViewController: UIViewController {
	
    var delegate: StoryViewControllerDelegate?
    
    @IBOutlet weak var incompleteButton: UIButton!
    @IBAction func incompleteButton(sender: AnyObject) {
        delegate?.untickBook(1)
    }
    @IBOutlet weak var completeButton: UIButton!
    @IBAction func completeButton(sender: AnyObject) {
        delegate?.tickBook(1)
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
        self.incompleteButton.hidden = true
		
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
        if imageIndex == 9 {
        self.completeButton.hidden = false
        self.incompleteButton.hidden = false
        } else {
            self.completeButton.hidden = true
            self.incompleteButton.hidden = true
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

