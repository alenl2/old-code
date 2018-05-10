package si.komp.quadcontroller;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;

public class MainActivity extends Activity {
	
	static {
        System.loadLibrary("QuadController");
  }
	public static int joystick = 0;
	
	public static native String mains();
	
	public static String TAG = "CONTROLLER";
	Thread socketT = null;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);

		socketT = new Thread(new Runnable() {
			@Override
			public void run(){
				mains();
			}
		});
		socketT.start();
	}
	
	
	
	@Override
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if ((event.getSource() & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD) {
            if (event.getRepeatCount() == 0) {
            	Log.v(TAG, String.format("ButtonDown: %d", keyCode));
            }
        }
        return true;
    }
	
	@Override
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        if ((event.getSource() & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD) {
            if (event.getRepeatCount() == 0) {
            	Log.v(TAG, String.format("ButtonUp: %d", keyCode));
            }
        }
        return true;
    }
	
	@Override
	public boolean onGenericMotionEvent(MotionEvent event) {
	    
	    if ((event.getSource() & InputDevice.SOURCE_DPAD)!= InputDevice.SOURCE_DPAD || ((event.getSource() & InputDevice.SOURCE_JOYSTICK) == InputDevice.SOURCE_JOYSTICK && event.getAction() == MotionEvent.ACTION_MOVE)){
	    	
	    	float hatx = getCenteredAxis(event,MotionEvent.AXIS_HAT_X);
	        float haty = getCenteredAxis(event,MotionEvent.AXIS_HAT_Y);
	         
    		float x1 = getCenteredAxis(event,MotionEvent.AXIS_X);
    	    float y1 = getCenteredAxis(event,MotionEvent.AXIS_Y);
    	    
    	    float y2 = getCenteredAxis(event,MotionEvent.AXIS_RZ);
    	    float x2 = getCenteredAxis(event,MotionEvent.AXIS_Z);
    	    
    	    float b1 = getCenteredAxis(event, MotionEvent.AXIS_LTRIGGER);
    	    float b2 = getCenteredAxis(event, MotionEvent.AXIS_RTRIGGER);
            
    	    
    	    joystick = (int)(x1*100);
    	    Log.v(TAG, String.format("HatX %f", hatx));
    	    Log.v(TAG, String.format("HatY %f", haty));
    	    
    	    Log.v(TAG, String.format("x1 %f", x1));
    	    Log.v(TAG, String.format("y1 %f", y1));
    	    
    	    Log.v(TAG, String.format("x2 %f", x2));
    	    Log.v(TAG, String.format("y2 %f", y2));
    	    
    	    Log.v(TAG, String.format("b1 %f", b1));
    	    Log.v(TAG, String.format("b2 %f", b2));
            return true;
        }
	    return true;
	}
	
	
	private static float getCenteredAxis(MotionEvent event, int axis) {
	    final InputDevice.MotionRange range = event.getDevice().getMotionRange(axis, event.getSource());
	    if (range != null) {
	        final float flat = range.getFlat();
	        final float value = event.getAxisValue(axis);
	        
	        if (Math.abs(value) > flat) {
	            return value;
	        }
	    }
	    return 0;
	}
}
