package si.komp.quadcontroller;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.Button;

public class ControllFragment2 extends Fragment {
	
	View rootView;
	ControllActivity myAct;
	
	@Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        myAct = (ControllActivity) activity;
    }
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		if(rootView == null){
			rootView = inflater.inflate(R.layout.fragment_controll2, container, false);
			
			Button calibAccBut = (Button) rootView.findViewById(R.id.buttonCalibAcc);
			calibAccBut.setOnClickListener(new OnClickListener() {
				@Override
				public void onClick(View v) {
					myAct.qConn.sendRequestForData(205, 0,3);
				}
			});
			
			Button calibGyroBut = (Button) rootView.findViewById(R.id.buttonCalibGyro);
			calibGyroBut.setOnClickListener(new OnClickListener() {
				@Override
				public void onClick(View v) {
					myAct.qConn.sendRequestForData(206, 0,4);
				}
			});
			
		}
		
		return rootView;
			
	}
}