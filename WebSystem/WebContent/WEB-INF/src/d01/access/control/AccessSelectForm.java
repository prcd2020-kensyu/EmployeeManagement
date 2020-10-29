package d01.access.control;

import org.apache.struts.action.ActionForm;


public class AccessSelectForm extends ActionForm {
	private int floor;
	private String empNo;
	private String empName;
	private String status = "0";

	public int getFloor(){
		return floor;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setFloor(int floor){
		this.floor = floor;
	}

	public String getEmpNo() {
		return empNo;
	}

	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}




}