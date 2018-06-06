package com.system.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

public class ImgUtil {
	// 声明验证码图片的宽和高
	private static final int HEIGHT = 25;
	private static final int WIDTH = 62;
	// 用于产生随机数的对象
	private static Random random = new Random();
	// 生成字符串类型的验证码的方法
	public static String createCode(){
		// 将验证码上可以显示的内容，统一列出
		String src = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		char[] cs = new char[4];
		for (int i = 0; i < cs.length; i++) {
			// 产生一个随机的下标
			int index = random.nextInt(36);
			// 获取字符串中指定下标的字符
			cs[i] = src.charAt(index);
		}
		return new String(cs);
	}
	// 绘制图片验证码的方法
	public static BufferedImage createImage(String code){
		// 创建图片对象
		BufferedImage img = new BufferedImage(WIDTH, HEIGHT, BufferedImage.TYPE_INT_RGB);
		Graphics g = img.getGraphics();
		drawBg(g);
		drawCode(g,code);
		// 释放资源
		g.dispose();
		return img;
	}
	// 绘制背景和干扰线的方法
	private static void drawBg(Graphics g){
		// 设置颜色
		g.setColor(Color.LIGHT_GRAY);
//		g.setColor(new Color(200, 200, 0));
		// 绘制背景（绘制一个和图片一样大小的矩形）
		g.fillRect(0, 0, WIDTH, HEIGHT);
		
		// 绘制干扰线
		for (int i = 0; i < 10; i++) {
			// 随机产生颜色
			g.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
			g.drawLine(random.nextInt(WIDTH), random.nextInt(HEIGHT), random.nextInt(WIDTH),  random.nextInt(HEIGHT));
		}
	}
	// 将验证码绘制到图片上的方法
	private static void drawCode(Graphics g, String code) {
		g.setColor(Color.blue);
		g.setFont(new Font("黑体", Font.BOLD, 22));
		g.drawString(code, 9, 18);
	}
}
