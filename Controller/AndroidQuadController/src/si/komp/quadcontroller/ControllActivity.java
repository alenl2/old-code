package si.komp.quadcontroller;

import java.util.Arrays;
import java.util.Locale;

import android.app.Activity;
import android.app.Fragment;
import android.app.FragmentManager;
import android.support.v13.app.FragmentPagerAdapter;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.util.Log;

import android.view.InputDevice;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.WindowManager;

public class ControllActivity extends Activity {
	
	SectionsPagerAdapter mSectionsPagerAdapter;
	ViewPager mViewPager;

	Boolean sendData = true;
	public int[] joystick = new int[8];
	public QuadConnector qConn;
	public GStreamConnector gConn;
	public Fragment[] fragments = new Fragment[4];
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_controll);

		mSectionsPagerAdapter = new SectionsPagerAdapter(getFragmentManager());
		mViewPager = (ViewPager) findViewById(R.id.pager);
		mViewPager.setAdapter(mSectionsPagerAdapter);
        
		qConn = new QuadConnector();
		gConn = new GStreamConnector(this);
		
		for (int i = 0; i < joystick.length; i++) {
			if(joystick[i] == 0){
				joystick[i] = 1500;
			}
		}
		qConn.setValues(joystick);
		
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_DISMISS_KEYGUARD);
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);

		sendData = true;
		Thread socketT = new Thread(new Runnable() {
			@Override
			public void run() {
				while (sendData) {
					qConn.mains();
				}
			}
		});
		socketT.start();
	}
	   
	   protected void onDestroy() {
		   gConn.onDestroy();
		   sendData = false;
		   qConn.stopNet();
	       super.onDestroy();
	    }
	
	public static float map(float value, float oldMin, float oldMax, float newMin, float newMax) {
		return (((value - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin;
	}

	@Override
	public boolean onKeyDown(int keyCode, KeyEvent event) {
		if ((event.getSource() & InputDevice.SOURCE_GAMEPAD) == InputDevice.SOURCE_GAMEPAD) {
			if (event.getRepeatCount() == 0) {
				switch (keyCode) {
				case KeyEvent.KEYCODE_BUTTON_A:
					joystick[7] = 2000;
					break;
				case KeyEvent.KEYCODE_BUTTON_B:
					joystick[6] = 2000;
					break;
				case KeyEvent.KEYCODE_BUTTON_X:
					joystick[7] = 1500;
					break;
				case KeyEvent.KEYCODE_BUTTON_Y:
					joystick[6] = 1500;
					break;
				case KeyEvent.KEYCODE_BUTTON_R1:
					joystick[5] = 2000;
					break;
				case KeyEvent.KEYCODE_BUTTON_L1:
					joystick[5] = 1500;
					break;
				case KeyEvent.KEYCODE_BUTTON_START:
					joystick[4] = 2000;
					break;
				case KeyEvent.KEYCODE_BUTTON_SELECT:
					joystick[4] = 1500;
					break;
				case KeyEvent.KEYCODE_BUTTON_THUMBL:
					break;
				case KeyEvent.KEYCODE_BUTTON_THUMBR:
					break;
				}
			}
			qConn.setValues(joystick);
			Log.v("Quad", Arrays.toString(joystick));
			return true;
		}
		return super.onKeyDown(keyCode, event);
	}

	@Override
	public boolean onKeyUp(int keyCode, KeyEvent event) {
		return super.onKeyUp(keyCode, event);
	}

	@Override
	public boolean onGenericMotionEvent(MotionEvent event) {

		if ((event.getSource() & InputDevice.SOURCE_DPAD) != InputDevice.SOURCE_DPAD || ((event.getSource() & InputDevice.SOURCE_JOYSTICK) == InputDevice.SOURCE_JOYSTICK && event.getAction() == MotionEvent.ACTION_MOVE)) {
			
			float hatx = getCenteredAxis(event, MotionEvent.AXIS_HAT_X);
			float haty = getCenteredAxis(event, MotionEvent.AXIS_HAT_Y);

			float x1 = getCenteredAxis(event, MotionEvent.AXIS_X);
			float y1 = getCenteredAxis(event, MotionEvent.AXIS_Y);

			float y2 = getCenteredAxis(event, MotionEvent.AXIS_RZ);
			float x2 = getCenteredAxis(event, MotionEvent.AXIS_Z);

			float b1 = getCenteredAxis(event, MotionEvent.AXIS_GAS); //cold be trigger for xbox controller
			float b2 = getCenteredAxis(event, MotionEvent.AXIS_BRAKE);

			joystick[0] = (int) (((x2 + 1) * 500) + 1000);
			joystick[1] = (int) ((Math.abs(y2 - 1) * 500) + 1000);

			joystick[2] = (int) (((x1 + 1) * 500) + 1000);
			joystick[3] = (int) ((((b1 + 1) * 500)) + ((((b2 + 1) * 500))));

			qConn.setValues(joystick);
			Log.v("Quad", Arrays.toString(joystick));
			return true;
		}
		return super.onGenericMotionEvent(event);
	}

	private static float getCenteredAxis(MotionEvent event, int axis) {
		final InputDevice.MotionRange range = event.getDevice().getMotionRange(axis, event.getSource());
		if (range != null) {
			final float flat = range.getFlat();
			float value = event.getAxisValue(axis);
			if (Math.abs(value) > flat/2) {
				return value;
			}
		}
		return 0;
	}


	public class SectionsPagerAdapter extends FragmentPagerAdapter {

		public SectionsPagerAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int position) {
			switch(position){
				case 0: 			
					fragments[position] = new ControllFragment();
					break;
				case 1: 			
					fragments[position] = new ControllFragment1();
					break;
				case 2: 			
					fragments[position] = new ControllFragment2();
					break;
				case 3: 			
					fragments[position] = new ControllFragment3();
					break;
			}
			return fragments[position];
		}

		@Override
		public int getCount() {
			return fragments.length;
		}

		@Override
		public CharSequence getPageTitle(int position) {
			Locale l = Locale.getDefault();
			switch (position) {
				case 0:
					return getString(R.string.title_section1).toUpperCase(l);
				case 1:
					return getString(R.string.title_section2).toUpperCase(l);
				case 2:
					return getString(R.string.title_section3).toUpperCase(l);
				case 3:
					return getString(R.string.title_section4).toUpperCase(l);
			}
			return null;
		}
	}

}
