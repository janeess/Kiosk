package com.practice.kioskPj.revenue.model.vo;

import java.text.DecimalFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Revenue {
	private int revenueNum;
	private int shopNum;
	private DecimalFormat salesAmount;
	private DecimalFormat feeAmount;
	private String period;

}
