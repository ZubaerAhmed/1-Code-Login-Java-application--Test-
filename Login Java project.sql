package Test;import java.awt.CardLayout;import java.awt.EventQueue;import java.awt.event.ActionEvent;import java.awt.event.ActionListener;import javax.swing.JButton;import javax.swing.JFrame;import javax.swing.JPanel;import javax.swing.border.EmptyBorder;public class A_TestLoginMain extends JFrame{	    static JPanel contentPane;	    static JPanel homePanel, registrationPanel;		static JPanel loginPanel,loginConfirmPanel;	    	    public static void main(final String[] args) {	        EventQueue.invokeLater(new Runnable() {	            public void run() {	                try {	                    A_TestLoginMain frame = new A_TestLoginMain();	                    frame.setVisible(true);	                } catch (Exception e) {	                    e.printStackTrace();	                }	            } 	        });	    }//------Constructor--------------------------------------------------------	    public A_TestLoginMain() {			setVisible(true);			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);			setBounds(300,200,650,400);			setTitle("Digital Laboratory"); //-----CONTAINER---------------------------------------	        	        contentPane = new JPanel();	        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));	        setContentPane(contentPane);	        contentPane.setLayout(new CardLayout(0, 0));//------HOME Page---------------------------------------	        C_All_Panel.myHomePanel();//------LOGIN Page---------------------------------------	        C_All_Panel.myLoginPanel();//------Login confirm page-----------------------------	        C_All_Panel.myLonginConfirmPanel();//------------------------------------------------	        C_All_Panel.myRegistrationPanel();	        	    }	}***************************************************************************package Test;import java.awt.event.ActionEvent;import java.awt.event.ActionListener;import java.sql.SQLException;import java.util.List;import javax.swing.JButton;import javax.swing.JLabel;import javax.swing.JOptionPane;import javax.swing.JPanel;import javax.swing.JTextField;import Login.B_LoginFrame;public class B_TestButton extends C_All_Panel{	static JButton loginButton, regButton;	static JButton submit;	static JButton clear;	static JLabel image, homeLabelText, footer, headerText;	static JTextField userField, passField;//-------------------------------------------    public static void myTestLoginButton() {    	loginButton = new JButton("LOGIN");					loginButton.addActionListener(new ActionListener() {			@Override			public void actionPerformed(ActionEvent e) {				//JOptionPane.showMessageDialog(null, "Enter User Name and Password");				homePanel.setVisible(false);	            loginPanel.setVisible(true);			}					});		loginButton.setBounds(10, 130, 120, 20);		homePanel.add(loginButton); }//--------------------------------------------    public static void myTestRegisterButton() {        regButton = new JButton("REGISTRATION");        regButton.addActionListener(new ActionListener() {           public void actionPerformed(final ActionEvent e) {        	  // JOptionPane.showMessageDialog(null, "Testing Registration page");                homePanel.setVisible(false);                registrationPanel.setVisible(true);            }        });        regButton.setBounds(10, 160, 120, 20);        homePanel.add(regButton);    }//-----------------------------------------------	public static void mySubmitButton() {			submit = new JButton("SUBMIT");		submit.setBounds(400, 200, 80, 40);		loginPanel.add(submit);				submit.addActionListener(new ActionListener() {			@Override			public void actionPerformed(ActionEvent e) {				userField=B_TestLabel.userField;				passField=B_TestLabel.passField;				String username = userField.getText();				String password = passField.getText();				List list = null;				try {					list = D_Database.selectDB();//					String user = list.get(0).toString();//					String pass = list.get(1).toString();				} catch (ClassNotFoundException | SQLException e1) {					e1.printStackTrace();				}				String user = list.get(0).toString();				String pass = list.get(1).toString();//-------------------------------------------------------------------								if(username.equals("admin") && password.equals("admin")) {					loginPanel.setVisible(false);		            loginConfirmPanel.setVisible(true);				}else if(username.equals(user) && password.equals(pass)){					loginPanel.setVisible(false);		            loginConfirmPanel.setVisible(true);						}else {					JOptionPane.showMessageDialog(null, "Invalid Login");					userField.setText(null);					passField.setText("");				}			}					});	}//===============================================	public static void myClearButton() {			clear = new JButton("CLEAR"); 		clear.setBounds(280, 200, 80, 40);		loginPanel.add(clear);			clear.addActionListener(new ActionListener() {			@Override			public void actionPerformed(ActionEvent e) {				userField = B_TestLabel.userField;				passField = B_TestLabel.passField;				userField.setText(null);				passField.setText("");			}					});	}    }  ***************************************************************************************package Test;import java.awt.Color;import java.awt.Font;import java.awt.Image;import javax.swing.ImageIcon;import javax.swing.JLabel;import javax.swing.JPasswordField;import javax.swing.JTextField;public class B_TestLabel extends B_TestButton{	static JLabel userLabel, passLabel,loginConfirm,registration;	static JTextField userField;	static JPasswordField passField;	public static void myImage() { 				image = new JLabel();		image.setBounds(200, 40, 300, 120);		ImageIcon imageIcon = new ImageIcon(new ImageIcon("C:\\Users\\Zubaer\\Pictures\\images-1.jpg")				.getImage().getScaledInstance(200, 100, Image.SCALE_DEFAULT));				image.setIcon(imageIcon);		homePanel.add(image);	}	public static JLabel myLoginImage() { 				image = new JLabel();		image.setBounds(10, 80, 150, 120);		ImageIcon imageIcon = new ImageIcon(new ImageIcon("C:\\Users\\Zubaer\\Pictures\\images-1.jpg")				.getImage().getScaledInstance(200, 100, Image.SCALE_DEFAULT));				image.setIcon(imageIcon);		loginPanel.add(image); 		return image;	}//------------------------------------------------------	public static JLabel myHomeLabelText() { 				String myString =  "<html><p>" +"<br>"				+ "About COVID-19\r\n " + "<br>"				+"Coronavirus (COVID-19) is a new virus that causes "+ "<br>"				+ "respiratory illness in people and is extremely contagious."+ "<br>"				+ "Symptoms include fever, cough, shortness of breath, and diarrhea. \r\n" + "<br>"				+"There�s currently no vaccine to prevent coronavirus disease (COVID-19).\r\n" + "<br>" 				+"You can protect yourself and help prevent spreading the virus to others if you "+ "<br>"				+ "STAY HOME or keep physical distance:\r\n" + "<br>"				+ "</p></html>" ;  		homeLabelText = new JLabel(myString);		homeLabelText.setBounds(150, 140, 410, 150);		homePanel.add(homeLabelText);		return homeLabelText; 		}	//=====================================================	public static void myFooter() { 					String date = new java.util.Date().toString(); 		footer = new JLabel(date);		Font font = new Font("Arial",Font.BOLD, 16);		footer.setFont(font);		footer.setForeground(Color.BLUE);		footer.setBounds(180, 310, 300, 20);		homePanel.add(footer);	}	//===================================================	public static void myHeader() {		headerText = new JLabel("Digital Laboratory");		Font font = new Font("Arial",Font.BOLD, 24);		headerText.setFont(font);		headerText.setForeground(Color.BLUE);				headerText.setBounds(200, 5, 300, 40);					homePanel.add(headerText);			 	}	//====================================================	public static void myLoginFooter() { 					String date = new java.util.Date().toString(); 		footer = new JLabel(date);		Font font = new Font("Arial",Font.BOLD, 16);		footer.setFont(font);		footer.setForeground(Color.BLUE);		footer.setBounds(200, 310, 300, 20);		loginPanel.add(footer);	}	//===================================================	public static void myLoginHeader() {		headerText = new JLabel("Digital Laboratory");		Font font = new Font("Arial",Font.BOLD, 24);		headerText.setFont(font);		headerText.setForeground(Color.BLUE);				headerText.setBounds(200, 5, 300, 40);					loginPanel.add(headerText);			 	}	//=================================================	//Login Panel Method	public static void loginLabel(){		userLabel = new JLabel("User Name");		passLabel = new JLabel("Password");					userLabel.setBounds(200, 85, 300, 40);		loginPanel.add(userLabel);		passLabel.setBounds(200, 125, 300, 40);		loginPanel.add(passLabel);				userField = new JTextField();		passField = new JPasswordField();		userField.setBounds(280, 95, 200, 30);		loginPanel.add(userField);				passField.setBounds(280, 135, 200, 30);		loginPanel.add(passField);	}//-------------------------------------------------------	public static void myLoginConfirm() {		loginConfirm = new JLabel("LOGIN SUCCESSFULL");		loginConfirm.setBounds(150,70, 400, 200);		Font font = new Font("Arial",Font.BOLD, 30);		loginConfirm.setFont(font);		loginConfirm.setForeground(Color.blue);		loginConfirmPanel.add(loginConfirm);	}//------------------------------------------------------	public static void myRegistration() {		registration = new JLabel("This page under construction.");		registration.setBounds(150,70,400,200);		registrationPanel.add(registration); 	}}****************************************************************************package Test;import javax.swing.JButton;import javax.swing.JPanel;public class C_All_Panel extends A_TestLoginMain{	static JButton btnClients,loginButton;			public static void myHomePanel() {		 		 homePanel = new JPanel();	     contentPane.add(homePanel);	     homePanel.setLayout(null);	    	     B_TestButton.myTestLoginButton();	     B_TestButton.myTestRegisterButton();	     B_TestLabel.myImage();	     B_TestLabel.myFooter();	     B_TestLabel.myHeader();	     B_TestLabel.myHomeLabelText();	     	}//--------------------------------------------	public static void myLoginPanel() {				loginPanel = new JPanel();          contentPane.add(loginPanel);         loginPanel.setLayout(null);                       B_TestLabel.myLoginImage();        B_TestLabel.myLoginFooter();        B_TestLabel.myLoginHeader();        B_TestLabel.loginLabel();                B_TestButton.myClearButton();        B_TestButton.mySubmitButton();       	}//-------------------------------------------	public static void myLonginConfirmPanel() {			loginConfirmPanel = new JPanel();          contentPane.add(loginConfirmPanel);         loginConfirmPanel.setLayout(null);                 B_TestLabel.myLoginConfirm();	}//-------------------------------------------	public static void myRegistrationPanel() {			registrationPanel = new JPanel();          contentPane.add(registrationPanel);         registrationPanel.setLayout(null);                B_TestLabel.myRegistration(); 	}}******************************************************************************package Test;import java.sql.Connection;import java.sql.DriverManager;import java.sql.ResultSet;import java.sql.SQLException;import java.sql.Statement;import java.util.ArrayList;import java.util.List;public class D_Database extends B_TestButton{	//Download and install SQLite workstation	//Environment setup for sqlite	//Download jar file for sqlite to external library in eclipse	// Undo command is Ctrl+Z 	//the shortcut for Redo is Ctrl+Y		static Connection con = null;	static ResultSet rs = null;	static Statement stmt = null;		public static void connectionDB() throws SQLException, ClassNotFoundException {						try {			Class.forName("org.sqlite.JDBC");			con = DriverManager.getConnection("jdbc:sqlite:C://sqlite3/Login.db");			}catch(Exception e) {			System.err.println( e.getClass().getName() + ": " + e.getMessage() );			}			System.out.println("Connection done with database");		}	//------Select BD------------------------------------------			public static List selectDB() throws SQLException, ClassNotFoundException {				connectionDB();//For connection database								String sql = "SELECT username, password from users  ;";				List list = new ArrayList();								stmt = con.createStatement();				rs = stmt.executeQuery(sql);				while(rs.next()) {					String user = rs.getString("username");					String pass = rs.getString("password");					list.add(user);					list.add(pass);									//	System.out.println(user + " -> "+ pass);					}				rs.close();				stmt.close();				con.close();			//	System.out.println("All data retrived");				return list;			} }