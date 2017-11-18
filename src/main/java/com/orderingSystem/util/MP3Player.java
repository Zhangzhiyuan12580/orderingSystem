package com.orderingSystem.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;

import javazoom.jl.player.Player;

public class MP3Player {

	private String fileName;
	private Player player;
	
	public MP3Player(String fileName) {
		this.fileName = fileName;
	}
	
	public void play() {
		try {
			BufferedInputStream buffer = new BufferedInputStream(
					new FileInputStream(fileName));
			player = new Player(buffer);
			player.play();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("播放失败！");
		}
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Player getPlayer() {
		return player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}
}
