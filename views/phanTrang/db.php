<?php

class DBController{
	private $host = "localhost";
	private $user = "root";
	private $password = "";
	private $database = "qlbh";
	private $cn;
	
	function __construct(){
		$this->cn = $this->connectDB();
	}
	
	function connectDB(){
		$cn = mysqli_connect($this->host,$this->user,$this->password,$this->database);
		$cn->query("SET NAMES 'utf8'");
		return $cn;
	}
	
	function runQuery($query){
		$result = mysqli_query($this->cn,$query);
		
		while($row = $result->fetch_assoc()){
			$resultset[] = $row;
		}
		
		if(!empty($resultset)){
			return $resultset;
		}
	}
	
	function numRows($query){
		$result = mysqli_query($this->cn,$query);
		$row_cnt = mysqli_num_rows($result);
		return $row_cnt;
	}
}