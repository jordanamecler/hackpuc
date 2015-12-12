
import UIKit

class PopUpViewController: UIViewController
{
    
    var popUpView:UIView!
    var closeButton:UIButton!
    var signUpButton:UIButton!
    var nameTextField = UITextField()
    var emailTextField = UITextField()
    var passwordTextField = UITextField()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.5)
        self.view.alpha = 0.6
        
        self.popUpView = UIView(frame: CGRectMake(0.0, 0.0, self.view.frame.width*0.8, self.view.frame.height*0.75))
        self.popUpView.backgroundColor = UIColor.whiteColor()
        self.popUpView.center.x = self.view.center.x
        self.popUpView.center.y = self.view.center.y
        self.popUpView.layer.cornerRadius = 5
        self.popUpView.layer.shadowOpacity = 0.8
        self.popUpView.layer.shadowOffset = CGSizeMake(0.0, 0.0)
        self.view.addSubview(popUpView)
        
        self.closeButton = UIButton(frame: CGRectMake(self.popUpView.frame.size.width/2 - 30.0, self.popUpView.frame.height - 40.0, 60.0, 30.0))
        self.closeButton.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0), forState: UIControlState.Normal)
        self.closeButton.setTitle("Close", forState: UIControlState.Normal)
        self.closeButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.closeButton.addTarget(self, action: "closePopUp", forControlEvents: .TouchUpInside)
        self.popUpView.addSubview(closeButton)
        
        self.signUpButton = UIButton(frame: CGRectMake(self.popUpView.frame.size.width/2 - 30.0, self.popUpView.frame.height - 60.0, 70.0, 30.0))
        self.signUpButton.setTitleColor(UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1.0), forState: UIControlState.Normal)
        self.signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
        self.signUpButton.titleLabel?.textAlignment = NSTextAlignment.Center
        self.signUpButton.addTarget(self, action: "signUpPressed", forControlEvents: .TouchUpInside)
        self.popUpView.addSubview(signUpButton)
        
    }
    
    func signUpPressed() {
        
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField   .text != "" {
            Login().signUp(emailTextField.text!, password: passwordTextField.text!)
            self.removeAnimated()
            
        }
        else {
            let alerta = UIAlertController(title: "Ooops", message: "There's something missing", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alerta.addAction(okAction)
            
            self.presentViewController(alerta, animated: true, completion: nil)
        }
    }
    
    @IBAction func closePopUp()
    {
        self.removeAnimated()
    }
    
    func showInView( view:UIView )
    {
        view.addSubview(self.view)
        self.showAnimated()
    }
    
    func showAnimated()
    {
        self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
        self.view.alpha = 0.0
        
        UIView.animateWithDuration(0.25, animations: { () -> Void in
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
        })
    }
    
    func removeAnimated()
    {
        UIView.animateWithDuration(0.25, animations: {
            self.view.transform = CGAffineTransformMakeScale(1.3, 1.3)
            self.view.alpha = 0.0;
            }, completion:{(finished : Bool)  in
                if (finished)
                {
                    self.view.removeFromSuperview()
                }
        })
    }
    
    //MARK: Funções necessárias
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
