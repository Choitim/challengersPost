package valueObject;

public class PersonalRateVO extends ParentVO {
	// fields
	private String name, major, num, rate;
	// getters
	public String getName() {return name;}
	public String getMajor() {return major;}
	public String getNum() {return num;}
	public String getRate() {return rate;}
	// setters
	public void setName(String name) {this.name = name;}
	public void setMajor(String major) {this.major = major;}
	public void setNum(String num) {this.num = num;}
	public void setRate(String rate) {this.rate = rate;}
}
