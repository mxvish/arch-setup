import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class cd implements ActionListener{
	static JFrame frame;
	static JPanel panel;
	static JLabel userLabel;
	static JLabel count;
	static JLabel quote;
	static boolean isNotFirst = false;
	static cd constructor;
    static int num = 0;
    static int fontSize = 24;

	public void show() {
		frame = new JFrame("awt & swing 15 min timer");
		frame.setSize(480, 270);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setVisible(true);

		panel = new JPanel();
		panel.setBackground(Color.black);
		frame.add(panel);
		panel.setLayout(null);

		count = new JLabel("Total: " + Integer.toString(num) + " times.");
		count.setFont(new Font("Arial", Font.PLAIN, fontSize));
		count.setForeground(Color.white);
		count.setBounds(100, 70, 450, 30);
		panel.add(count);
	
		quote = new JLabel("What good will I do from now?");
		quote.setFont(new Font("Arial", Font.PLAIN, fontSize));
		quote.setForeground(Color.white);
		quote.setBounds(100, 100, 450, 30);
		panel.add(quote);
	
		JButton button = new JButton("Start");
		button.setBounds(175, 130, 145, 40);
		button.setFont(new Font("Arial", Font.PLAIN, fontSize));
		button.setForeground(Color.white);
		button.setBackground(Color.black);
		button.addActionListener(new cd());
		panel.add(button);

		if(isNotFirst) {
			userLabel = new JLabel("Nice work! ^ ^");
			userLabel.setFont(new Font("Arial", Font.PLAIN, fontSize));
			userLabel.setForeground(Color.white);
			userLabel.setBounds(100, 40, 275, 30);
			panel.add(userLabel);
		}
	}
	
	public void actionPerformed(ActionEvent e) {
		frame.setVisible(false);
		try{
			Thread.sleep(1000*900);
			isNotFirst = true;
            num++;
			constructor.show();
		} catch(Exception ex){
			ex.printStackTrace();
		}
	}

	public static void main(String[] args) {
		constructor = new cd();
		constructor.show();
    }
}
