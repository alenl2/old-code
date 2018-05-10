package si.komp.quadcontroller;

public class QuadConnector {
	static {
		System.loadLibrary("QuadController");
	}
	public native int mains();
	public native void setValues(int[] data);
	public native void stopNet();
	public native int[] sendRequestForData(int command, int replyLen, int dataChannel);

}
