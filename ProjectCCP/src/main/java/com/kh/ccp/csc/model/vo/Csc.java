package com.kh.ccp.csc.model.vo;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@ToString
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Csc {

	private int notiCode;
	private String notiTitle;
	private String notiContent;
	private Date notiDate;
	private int notiCount;
	private String noStatus; 
	
} // class
