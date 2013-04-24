package br.com.rectius.crm.utils;

public class StringUtils {
	
	public static String lpadS(String valueToPad, String filler, int size) {  
        StringBuilder builder = new StringBuilder();  
                  
        while (builder.length() + valueToPad.length() < size) {  
            builder.append(filler);  
        }  
        builder.append(valueToPad);  
        return builder.toString();  
    }  
      
    public static String lpad(String valueToPad, char filler, int size) {  
        char[] array = new char[size];   
          
        int len = size - valueToPad.length();  
          
        for (int i=0; i<len; i++)  
            array[i] = filler;  
          
        valueToPad.getChars(0, valueToPad.length(), array, size - valueToPad.length());  
              
        return String.valueOf(array);  
    } 

}
