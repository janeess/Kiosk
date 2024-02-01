package com.practice.kioskPj.shop.model.vo;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor  
@NoArgsConstructor
@Data
public class Shop {
	
	private int shopNum; 
	private String shopId;
	private String shopPwd;
	private String shopName;
	private String shopRepresentative;
	private String shopPhone;
	private String shopEmail;
	private Timestamp contractPeriod;
	private Timestamp updateDate;
	private String shopLogoImage;
	private String userGrade;
	private String userStatus;
	
}
