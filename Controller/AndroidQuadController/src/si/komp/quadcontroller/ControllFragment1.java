package si.komp.quadcontroller;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SeekBar;
import android.widget.SeekBar.OnSeekBarChangeListener;

public class ControllFragment1 extends Fragment {
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
			rootView = inflater.inflate(R.layout.fragment_controll1, container, false);
			
			final SeekBar sb0 = (SeekBar)rootView.findViewById(R.id.seekBar01);
			final SeekBar sb1 = (SeekBar)rootView.findViewById(R.id.SeekBar02);
			final SeekBar sb2 = (SeekBar)rootView.findViewById(R.id.SeekBar03);
			final SeekBar sb3 = (SeekBar)rootView.findViewById(R.id.SeekBar04);
			final SeekBar sb4 = (SeekBar)rootView.findViewById(R.id.SeekBar05);
			final SeekBar sb5 = (SeekBar)rootView.findViewById(R.id.SeekBar06);
			final SeekBar sb6 = (SeekBar)rootView.findViewById(R.id.SeekBar07);
			final SeekBar sb7 = (SeekBar)rootView.findViewById(R.id.SeekBar08);
			
			
			sb0.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[0] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb1.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[1] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb2.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[2] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb3.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[3] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb4.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[4] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb5.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[5] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb6.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[6] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			sb7.setOnSeekBarChangeListener(new OnSeekBarChangeListener() {
				@Override
				public void onStopTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onStartTrackingTouch(SeekBar seekBar) {
					// TODO Auto-generated method stub
					
				}
				@Override
				public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
					if(fromUser){
						myAct.joystick[7] = (int) ControllActivity.map(progress, 0,100,1000,2000); 
						myAct.qConn.setValues(myAct.joystick);
					}
				}
			});
			
			
			
			Thread t = new Thread(new Runnable() {
			@Override
			public void run() {
				while(true){
					try {
						Thread.sleep(10);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
					if(myAct.qConn != null){
						int[] t = myAct.qConn.sendRequestForData(105, 16,1);
						
						if(t != null){
							int val0 = (t[1] << 8 | t[0]);
							int val1 = (t[3] << 8 | t[2]);
							int val2 = (t[5] << 8 | t[4]);
							int val3 = (t[7] << 8 | t[6]);
							int val4 = (t[9] << 8 | t[8]);
							int val5 = (t[11] << 8 | t[10]);
							int val6 = (t[13] << 8 | t[12]);
							int val7 = (t[15] << 8 | t[14]);

							sb0.setProgress((int) ControllActivity.map(val0, 1000, 2000, 0, 100));
							sb1.setProgress((int) ControllActivity.map(val1, 1000, 2000, 0, 100));
							sb2.setProgress((int) ControllActivity.map(val2, 1000, 2000, 0, 100));
							sb3.setProgress((int) ControllActivity.map(val3, 1000, 2000, 0, 100));
							sb4.setProgress((int) ControllActivity.map(val4, 1000, 2000, 0, 100));
							sb5.setProgress((int) ControllActivity.map(val5, 1000, 2000, 0, 100));
							sb6.setProgress((int) ControllActivity.map(val6, 1000, 2000, 0, 100));
							sb7.setProgress((int) ControllActivity.map(val7, 1000, 2000, 0, 100));
						}
					}
				}
			}
		});
			
			
		t.start();
		}

		
		return rootView;
			
	}
}