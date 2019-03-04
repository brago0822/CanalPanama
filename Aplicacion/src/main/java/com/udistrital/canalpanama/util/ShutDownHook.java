package com.udistrital.canalpanama.util;

public class ShutDownHook extends Thread{
	public void run()
    {
		System.out.println("close event");
    }
}
