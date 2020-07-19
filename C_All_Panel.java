package Test;

import javax.swing.JButton;
import javax.swing.JPanel;

public class C_All_Panel extends A_TestLoginMain{

	static JButton btnClients,loginButton;
		
	public static void myHomePanel() {		 
		 homePanel = new JPanel();
	     contentPane.add(homePanel);
	     homePanel.setLayout(null);
	    
	     B_TestButton.myTestLoginButton();
	     B_TestButton.myTestRegisterButton();
	     B_TestLabel.myImage();
	     B_TestLabel.myFooter();
	     B_TestLabel.myHeader();
	     B_TestLabel.myHomeLabelText();	     
	}
//--------------------------------------------
	public static void myLoginPanel() {		
		loginPanel = new JPanel();  
        contentPane.add(loginPanel); 
        loginPanel.setLayout(null);
               
        B_TestLabel.myLoginImage();
        B_TestLabel.myLoginFooter();
        B_TestLabel.myLoginHeader();
        B_TestLabel.loginLabel();
        
        B_TestButton.myClearButton();
        B_TestButton.mySubmitButton();       
	}
//-------------------------------------------
	public static void myLonginConfirmPanel() {	
		loginConfirmPanel = new JPanel();  
        contentPane.add(loginConfirmPanel); 
        loginConfirmPanel.setLayout(null);
         
        B_TestLabel.myLoginConfirm();
	}
//-------------------------------------------
	public static void myRegistrationPanel() {	
		registrationPanel = new JPanel();  
        contentPane.add(registrationPanel); 
        registrationPanel.setLayout(null);
        
        B_TestLabel.myRegistration(); 
	}
}
