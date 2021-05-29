package com.techblog.entities;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper
{
	
	public static boolean deleteFile(String path){
		
		boolean b = false;
		
		try
		{
			File file = new File(path);
			b= file.delete();
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return b;
		
		
	}
	
	public static boolean  saveFile(InputStream io, String filePath)
	{
		
		boolean b =false;
		
		try
		{
						
			//read image
			byte[] bb = new byte[io.available()];
			io.read(bb);
			
			
			//write image
			FileOutputStream out = new FileOutputStream(filePath);
			out.write(bb);
			
			out.flush();
			out.close();
			
			b = true;
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return b;
	}
	

}
