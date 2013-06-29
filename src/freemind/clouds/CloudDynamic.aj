package freemind.clouds;

import freemind.util.Driver;
import freemind.util.Util;

public aspect CloudDynamic {

	Object around() : adviceexecution() && within(freemind.clouds.CloudFeature){
		Object ret = null;
		if (Driver.isActivated("cloud")) {
			ret = proceed();
		} else {
			try {
				ret = Util.proceedAroundCall(thisJoinPoint);
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		return ret;
	}
}
