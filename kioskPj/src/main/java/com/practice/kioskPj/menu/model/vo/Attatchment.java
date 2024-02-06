package com.practice.kioskPj.menu.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Attatchment {
	
	private int fileNo;
	private int shopNum;
	private int MenuNum;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileStatus;

}
