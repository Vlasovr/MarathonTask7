import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {
        
    private lazy var scrollView: UIScrollView = {
        var sv = UIScrollView()
        sv.contentSize = CGSize(width: view.bounds.width, height: 1500)
        sv.delegate = self
        sv.backgroundColor = .cyan
        return sv
    }()
    
    private lazy var imageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "newIpadWallpaper"))
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
       
        return iv
    }()
    
    private lazy var imageOrigHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = scrollView
        scrollView.addSubview(imageView)

    }
}

extension ViewController {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetHeight = imageOrigHeight - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y,
                                 width: scrollView.frame.width,
                                 height: offsetHeight)
        print(offsetHeight)
        
        if offsetHeight > imageOrigHeight {
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top:
                                                                    offsetHeight - view.safeAreaInsets.top,
                                                                    left: 0, bottom: 0, right: 0)
        } else {
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top:
                                                                    imageOrigHeight - view.safeAreaInsets.top,
                                                                    left: 0, bottom: 0, right: 0)
        }
    }
}
