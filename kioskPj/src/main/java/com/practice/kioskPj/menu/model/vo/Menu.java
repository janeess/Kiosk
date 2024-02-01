package com.practice.kioskPj.menu.model.vo;


import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Menu {
	
	private int menuNum;
	private int shopNum;
	private String menuName;
	private String menuImageUrl;
	private int price;
	private String menuStatus;

}
