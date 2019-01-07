package cargo.layout.support.web;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

public class CustomDecimalFormatter {

	
	public static String format(BigDecimal value, String pattern, char decimalSeparator, char groupingSeparator) {
		
		if(value == null){
			value=BigDecimal.ZERO;
		}
        DecimalFormatSymbols otherSymbols = new DecimalFormatSymbols(Locale.getDefault());
        
        otherSymbols.setDecimalSeparator(decimalSeparator);
        otherSymbols.setGroupingSeparator(groupingSeparator);
        DecimalFormat df = new DecimalFormat(pattern, otherSymbols);
        return df.format(value);
    }
}
