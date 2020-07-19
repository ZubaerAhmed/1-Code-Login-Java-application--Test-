package Test;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import Login.B_LoginFrame;

public class B_TestButton extends C_All_Panel{
	static JButton loginButton, regButton;
	static JButton submit;
	static JButton clear;
	static JLabel image, homeLabelText, footer, headerText;
	static JTextField userField, passField;
//-------------------------------------------
    public static void myTestLoginButton() {
    	loginButton = new JButton("LOGIN");			
		loginButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				//JOptionPane.showMessageDialog(null, "Enter User Name and Password");
				homePanel.setVisible(false);
	            loginPanel.setVisible(true);
			}			
		});
		loginButton.setBounds(10, 130, 120, 20);
		homePanel.add(loginButton); 
}
//--------------------------------------------
    public static void myTestRegisterButton() {
        regButton = new JButton("REGISTRATION");
        regButton.addActionListener(new ActionListener() {
           public void actionPerformed(final ActionEvent e) {
        	  // JOptionPane.showMessageDialog(null, "Testing Registration page");
                homePanel.setVisible(false);
                registrationPanel.setVisible(true);
            }
        });
        regButton.setBounds(10, 160, 120, 20);
        homePanel.add(regButton);
    }
//-----------------------------------------------
	public static void mySubmitButton() {	
		submit = new JButton("SUBMIT");
		submit.setBounds(400, 200, 80, 40);
		loginPanel.add(submit);		
		submit.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				userField=B_TestLabel.userField;
				passField=B_TestLabel.passField;
				String username = userField.getText();
				String password = passField.getText();
				List list = null;
				try {
					list = D_Database.selectDB();
//					String user = list.get(0).toString();
//					String pass = list.get(1).toString();
				} catch (ClassNotFoundException | SQLException e1) {
					e1.printStackTrace();
				}
				String user = list.get(0).toString();
				String pass = list.get(1).toString();
//-------------------------------------------------------------------				
				if(username.equals("admin") && password.equals("admin")) {
					loginPanel.setVisible(false);
		            loginConfirmPanel.setVisible(true);
				}else if(username.equals(user) && password.equals(pass)){
					loginPanel.setVisible(false);
		            loginConfirmPanel.setVisible(true);		
				}else {
					JOptionPane.showMessageDialog(null, "Invalid Login");
					userField.setText(null);
					passField.setText("");
				}
			}			
		});
	}
//===============================================
	public static void myClearButton() {	
		clear = new JButton("CLEAR"); 
		clear.setBounds(280, 200, 80, 40);
		loginPanel.add(clear);	
		clear.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				userField = B_TestLabel.userField;
				passField = B_TestLabel.passField;
				userField.setText(null);
				passField.setText("");
			}			
		});
	}
    
}  