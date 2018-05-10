package si.komp.quadcontroller;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends Activity {
	public final static String EXTRA_MESSAGE = "si.komp.quadcontroller.IP";

	static Context ctx;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		ctx = this;
		
		 final Button button = (Button) findViewById(R.id.connectButton);
		 button.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(ctx, ControllActivity.class);
				EditText editText = (EditText) findViewById(R.id.ipText);
				String message = editText.getText().toString();
				intent.putExtra(EXTRA_MESSAGE, message);
				
				startActivity(intent);
			}
		});
         
         
	}
	

	
}
