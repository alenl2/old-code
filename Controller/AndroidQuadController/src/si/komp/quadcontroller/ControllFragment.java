package si.komp.quadcontroller;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.Button;

public class ControllFragment extends Fragment {
	
    
	View rootView = null;
	Button streamConnectButton;
	ControllActivity myAct;
	
	@Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        myAct = (ControllActivity) activity;
    }
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		if(rootView == null){
			rootView = inflater.inflate(R.layout.fragment_controll, container, false);
		}

		SurfaceView sv = (SurfaceView) rootView.findViewById(R.id.gStreamerSurfaceView1);
        SurfaceHolder sh = sv.getHolder();
        sh.addCallback(myAct.gConn);
        
        streamConnectButton = (Button) rootView.findViewById(R.id.streamConnectButton);
        streamConnectButton.setOnClickListener(new OnClickListener() {
			@Override
			public void onClick(View v) {
				if(myAct.gConn.is_playing_desired){
					myAct.gConn.nativePause();
					myAct.gConn.is_playing_desired = false;
					streamConnectButton.setText("Connect");
				} else {
					myAct.gConn.nativePlay();
					myAct.gConn.is_playing_desired = true;
					streamConnectButton.setText("Disconnect");
				}
			}
		});
        
		return rootView;
			
	}

}