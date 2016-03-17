public class SideBarMenuController: UIViewController {
    
    public var leftViewController: UIViewController!
    public var mainViewController: UIViewController!
    public var overlap: CGFloat!
    private var scrollView: UIScrollView!
    private var firstTime = true
    
    required public init?(coder aDecoder: NSCoder) {
        assert(false, "Use init(leftViewController:mainViewController:overlap:)")
        super.init(coder: aDecoder)
    }
    
    public init(leftViewController: UIViewController, mainViewController: UIViewController, overlap: CGFloat) {
        self.leftViewController = leftViewController
        self.mainViewController = mainViewController
        self.overlap = overlap
        
        super.init(nibName: nil, bundle: nil)
        
        self.view.backgroundColor = UIColor.blackColor()
        
        setupScrollView()
        setupViewControllers()
    }
    
    public convenience init(leftViewControllerStoryboardId: String, mainViewControllerStoryboardId: String){
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let leftViewController = storyBoard.instantiateViewControllerWithIdentifier(leftViewControllerStoryboardId)
        let mainViewController = storyBoard.instantiateViewControllerWithIdentifier(mainViewControllerStoryboardId)
        
        self.init(leftViewController: leftViewController, mainViewController: mainViewController, overlap: 50)
    }
    
    override public func viewDidLayoutSubviews() {
        if firstTime {
            firstTime = false
            closeMenuAnimated(false)
        }
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.pagingEnabled = true
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: [], metrics: nil, views: ["scrollView": scrollView])
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: [], metrics: nil, views: ["scrollView": scrollView])
        NSLayoutConstraint.activateConstraints(horizontalConstraints + verticalConstraints)
    }
    
    private func setupViewControllers() {
        addViewController(leftViewController)
        addViewController(mainViewController)
        
        addShadowToView(mainViewController.view)
        
        let views = ["left": leftViewController.view, "main": mainViewController.view, "outer": view]
        let horizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "|[left][main(==outer)]|", options: [.AlignAllTop, .AlignAllBottom], metrics: nil, views: views)
        let leftWidthConstraint = NSLayoutConstraint(
            item: leftViewController.view,
            attribute: .Width,
            relatedBy: .Equal,
            toItem: view,
            attribute: .Width,
            multiplier: 1.0, constant: -overlap)
        let verticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|[main(==outer)]|", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(horizontalConstraints + verticalConstraints + [leftWidthConstraint])
        
    }
    
    public func closeMenuAnimated(animated: Bool) {
        scrollView.setContentOffset(CGPoint(x: CGRectGetWidth(leftViewController.view.frame), y: 0), animated: animated)
    }
    
    private func leftMenuIsOpen() -> Bool {
        return scrollView.contentOffset.x == 0
    }
    
    public func openLeftMenuAnimated(animated: Bool) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: animated)
    }
    
    public func toggleLeftMenuAnimated(animated: Bool) {
        if leftMenuIsOpen() {
            closeMenuAnimated(animated)
        } else {
            openLeftMenuAnimated(animated)
        }
    }
    
    private func addViewController(viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(viewController.view)
        addChildViewController(viewController)
        viewController.didMoveToParentViewController(self)
    }
    
    private func addShadowToView(destView: UIView) {
        destView.layer.shadowPath = UIBezierPath(rect: destView.bounds).CGPath
        destView.layer.shadowRadius = 2.5
        destView.layer.shadowOffset = CGSize(width: 0, height: 0)
        destView.layer.shadowOpacity = 1.0
        destView.layer.shadowColor = UIColor.blackColor().CGColor
    }
    
}

