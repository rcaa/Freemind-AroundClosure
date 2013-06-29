package freemind.icons;

import freemind.util.Driver;
import freemind.util.Util;

public aspect IconsDynamic {

	Object around() : adviceexecution() && within(freemind.icons.IconsFeature){
		Object ret = null;
		if (Driver.isActivated("icons")) {
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
