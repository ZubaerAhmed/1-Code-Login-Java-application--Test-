package Test;

import java.awt.CardLayout;
import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

public class A_TestLoginMain extends JFrame{

	    static JPanel contentPane;
	    static JPanel homePanel, registrationPanel;
		static JPanel loginPanel,loginConfirmPanel;
	    
	    public static void main(final String[] args) {
	        EventQueue.invokeLater(new Runnable() {
	            public void run() {
	                try {
	                    A_TestLoginMain frame = new A_TestLoginMain();
	                    frame.setVisible(true);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                }
	            } 
	        });
	    }
//------Constructor--------------------------------------------------------
	    public A_TestLoginMain() {
			setVisible(true);
			setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			setBounds(300,200,650,400);
			setTitle("Digital Laboratory"); 
//-----CONTAINER---------------------------------------	        
	        contentPane = new JPanel();
	        contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
	        setContentPane(contentPane);
	        contentPane.setLayout(new CardLayout(0, 0));
//------HOME Page---------------------------------------
	        C_All_Panel.myHomePanel();
//------LOGIN Page---------------------------------------
	        C_All_Panel.myLoginPanel();
//------Login confirm page-----------------------------
	        C_All_Panel.myLonginConfirmPanel();
//------------------------------------------------
	        C_All_Panel.myRegistrationPanel();

	        
	        
	    }
	
}
