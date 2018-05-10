package si.komp.quadcontroller;

import org.freedesktop.gstreamer.GStreamer;

import android.util.Log;
import android.view.SurfaceHolder;

public class GStreamConnector implements SurfaceHolder.Callback{
	
    static {
        System.loadLibrary("gstreamer_android");
        System.loadLibrary("tutorial-3");
        nativeClassInit();
    }
    
    public native void nativeInit();     // Initialize native code, build pipeline, etc
    public native void nativeFinalize(); // Destroy pipeline and shutdown native code
    public native void nativePlay();     // Set pipeline to PLAYING
    public native void nativePause();    // Set pipeline to PAUSED
    public static native boolean nativeClassInit(); // Initialize native class: cache Method IDs for callbacks
    public native void nativeSurfaceInit(Object surface);
    public native void nativeSurfaceFinalize();
    public long native_custom_data;      // Native code will use this to keep private data
    public boolean is_playing_desired = true;   // Whether the user asked to go to PLAYING
   
    ControllActivity activity;
    
    public GStreamConnector(ControllActivity ctx) {
    	activity = ctx;
    	try {
			GStreamer.init(ctx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		nativeInit();
	}
    
    public void onDestroy() {
        nativeFinalize();
    }
    
    public void surfaceChanged(SurfaceHolder holder, int format, int width, int height) {
        nativeSurfaceInit (holder.getSurface());
    }

    public void surfaceCreated(SurfaceHolder holder) {
        Log.d("GStreamer", "Surface created: " + holder.getSurface());
    }

    public void surfaceDestroyed(SurfaceHolder holder) {
        Log.d("GStreamer", "Surface destroyed");
        nativeSurfaceFinalize ();
    }
    
    private void setMessage(final String message) {
		// Called from native code. This sets the content of the TextView from the UI thread.
	    }


	   private void onGStreamerInitialized () {
	        if (is_playing_desired) {
	        	nativePlay();
	        } else {
	        	nativePause();
	        }
	    }
	   
	   private void setCurrentPosition(final int position, final int duration) {
		   
	   }
	   
	   private void onMediaSizeChanged (int width, int height) {
		    final GStreamerSurfaceView gsv = (GStreamerSurfaceView) activity.fragments[0].getView().findViewById(R.id.gStreamerSurfaceView1);
		    gsv.media_width = width;
		    gsv.media_height = height;
		    activity.fragments[0].getActivity().runOnUiThread(new Runnable() {
		        public void run() {
		            gsv.requestLayout();
		        }
		    });
		}
}
