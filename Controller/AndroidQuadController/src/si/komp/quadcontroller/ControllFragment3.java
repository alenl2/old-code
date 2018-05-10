package si.komp.quadcontroller;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.PolylineOptions;

import android.app.Activity;
import android.app.Fragment;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

public class ControllFragment3 extends Fragment {
	

	View rootView;
	GoogleMap map;
	Marker marker;
	ControllActivity myAct;
	
	@Override
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        myAct = (ControllActivity) activity;
    }
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
		if (rootView == null){
			rootView = inflater.inflate(R.layout.fragment_controll3, container, false);
			
			 // Get a handle to the Map Fragment
	        map = ((MapFragment) getFragmentManager().findFragmentById(R.id.fragment1)).getMap();
	        map.setMapType(GoogleMap.MAP_TYPE_HYBRID);
	        map.setMyLocationEnabled(true);
	        
	        /*
	        LatLng sydney = new LatLng(-33.867, 151.206);

	        
	       
	        
			// Polylines are useful for marking paths and routes on the map.
	        map.addPolyline(new PolylineOptions().geodesic(true)
	                .add(new LatLng(-33.866, 151.195))  // Sydney
	                .add(new LatLng(-18.142, 178.431))  // Fiji
	                .add(new LatLng(21.291, -157.821))  // Hawaii
	                .add(new LatLng(37.423, -122.091)));  // Mountain View
		
		*/
	    
	        final Handler hand = new Handler();
	        
	        Thread t = new Thread(new Runnable() {
				
				@Override
				public void run() {
					new DownloadPage().execute();
					hand.postDelayed(this, 1000);
				}
			});
	         t.start();
	         
		}
		return rootView;
	}
	
	class DownloadPage extends AsyncTask<Void, Void, LatLng> {
		@Override
		protected LatLng doInBackground(Void... params) {
			if(myAct.qConn != null){
				int[] t = myAct.qConn.sendRequestForData(106, 16, 2);
				
				if(t != null){
					Boolean hasFix = false;
					if(t[0] == 1){
						hasFix = true;
						
						int satNum = t[1];
						
						int IgpsLat = ((t[5] << 24) + (t[4] << 16) + (t[3] << 8) + (t[2] << 0));
						int IgpsLon = ((t[9] << 24) + (t[8] << 16) + (t[7] << 8) + (t[6] << 0));
						
						float gpsLat = IgpsLat / 10000000.0f; 
						float gpsLon = IgpsLon / 10000000.0f; 
						
						int altitude = (t[11] << 8 | t[10]);
						int speed = (t[13] << 8 | t[12]);
						
						int course = (t[15] << 8 | t[14]);
						
						LatLng quadPos = new LatLng(gpsLat, gpsLon);
						return quadPos;
					}
				}
			}
			return null;
		}
		
		@Override
		protected void onPostExecute(LatLng result) {
			if(result == null){
				return;
			}
			 

			 if(marker != null){
				 marker.remove();
			 } else {
				 map.moveCamera(CameraUpdateFactory.newLatLngZoom(result, 13));
			 }
		       marker = map.addMarker(new MarkerOptions()
		                .title("QuadPos :)")
		                .snippet("Here he is")
		                .position(result));
		        
			super.onPostExecute(result);
		}
	}
}


