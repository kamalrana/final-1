<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page session="true" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Hello World with Spring 3 MVC</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
  <style>
p { color:red; }
</style>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
	<body>
		<h1>Registration Form</h1><br />
	<form:form commandName="USER" onSubmit="return validate(this.name,this.standard,this.age,this.phone,this.email);">

	<%-- onSubmit="return (validateNumber(this.phone, 'Please enter a phone number, numbers only', 5, 10) && 
	validateEmail(this.email, 'Please enter a correct email address or leave the field blank', false) && 
validateString(this.name, 'Please enter your name', 3, 15) && 
validateString(this.standard, 'Please correct education qualification', 3, 15) && 
validateNumber(this.age, 'Please enter age, numbers only', 2, 2)
&& check() && validate(this.name,this.standard,this.age,this.phone,this.email)
) ;"> --%>

<!--  && 
		validateString(this.firstName, 'Please enter your first name', 3, 15)
		&& validateString(this.lastName, 'Please enter your last name', 3, 15)) -->
		
		<table>
			<tr><td colspan="2"><form:errors path="age" cssStyle="color : red;"/></td></tr>
			<tr><td>Name : </td><td><form:input id="name" path="name" onmouseover="txtToolTip(this.id)"/></td>
			<td><p id="nameError" style="display: none">Please enter your Correct name text</p></td>
			</tr>
			<tr><td>Standard : </td><td><form:input id="Standard" path="standard" onmouseover="txtToolTip(this.id)"/></td>
			<td><p id="standardError" style="display: none">Please enter your Correct name text</p></td>
			</tr>
			<tr><td>Age : </td><td><form:input id="age" path="age" onmouseover="txtToolTip(this.id)" /></td>
			<td><p id="ageError" style="display: none">Please enter your age</p></td>
			</tr>
			<tr><td>Sex : </td><td><form:select id="sex" path="sex" onmouseover="txtToolTip(this.id)">
					<form:option value="Male"/>
					<form:option value="Female"/>
			<tr><td>Phone : </td><td><form:input path="phone" id="phone" onmouseover="txtToolTip(this.id)"/></td>
			<td><p id="phoneError" style="display: none">Please enter a phone number</p></td>
			</tr>
			<tr><td>Email : </td><td><form:input id="email" path="email" onmouseover="txtToolTip(this.id)"/></td>
			<td><p id="emailError" style="display: none">Please enter a correct email address or leave the field blank</p></td>
			</tr>
			</form:select></td></tr>
			<tr><td colspan="2"><input type="submit" value="Save Changes" /></td></tr>
		</table>
	</form:form>
</body>
	
<script type="text/javascript">
var valid=1;
function txtToolTip(txtname)
{
	if(document.getElementById('Standard')){
document.getElementById('Standard').title = 'like M.Tech,B.Tech,MCA,BCA. etc';
	}
	
	if(document.getElementById('name')){
		document.getElementById('name').title = 'like kamal kishor rana';
			}
	if(document.getElementById('age')){
		document.getElementById('age').title = 'enter only integer';
			}
	if(document.getElementById('sex')){
		document.getElementById('sex').title = 'Male or Female';
			}
	
	if(document.getElementById('email')){
		document.getElementById('email').title = 'like xyz@xyz.com';
			}
	
	if(document.getElementById('phone')){
		document.getElementById('phone').title = 'enter only phone number between 5-10 numbers';
			}
}
function validate(name,standard,age,phone,email){
	var isVisible = document.getElementById(name.id+'Error').offsetWidth > 0 || document.getElementById(name.id+'Error').offsetHeight > 0;
	alert('isvisible '+isVisible+"	"+name.id);
	if(name.id=='name')
	{
		alert('IN');
		if(!name.value || name.value.length < 3 || name.value.max > 15)
			{
			alert('in first if');
			$("#"+name.id+"Error").show("slow");
			return false;
			}
		if(isVisible)
			{
			alert('visible');
			$("#"+name.id+'Error').hide();}
		return false;
	}

		
}
function validateNumber(field, msg, min, max) {
	if (!min) { min = 0 }  
	if (!max) { max = 255 }  
	if (parseInt(field.value) != field.value ||  field.value.length < min || field.value.length > max) {
		valid=0;
		/* if(field.id=='phone')
		alert('field is :' +field.id); */
		
		if(field.id=='phone'){
	 	$("#phoneError").show("slow");
		}
	else
		{
		$("#ageError").show("slow");
		}
	/* field.focus();  
	field.select(); */ 
	return true;  
	}
	else{
		if(field.id=='phone'){
			 $("#phoneError").hide();
				}
			else
				{
				$("#ageError").hide();
				}
	}
	return true;  
	}

function validateString(field, msg, min, max) {  
	if (!min) { min = 1 }  
	if (!max) { max = 65535 }  
	if (!field.value || field.value.length < min || field.value.max > max) {  
		valid=0;
		if(field.id=='name'){
		 $("#nameError").show("slow");
		}
	else{
		 $("#standardError").show("slow");
	}
	field.focus();  
	field.select();  
	return true;  
	}  
	return true;  

	}
	
 function validateEmail(email, msg, optional)
 {
	 if (!email.value && optional) {
			return true;  
		}  
		//var re_mail = "/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z])+$/";
		var x=email.value;
var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
	valid=0;
  $("#emailError").show("slow");
  email.focus();  
	email.select();  
  return true;
  }
}
 function check(){
	 if(valid==0){
		 alert('in check');
		 return false;
	 }
 }
</script>
</html>

<%-- Spring provided ui taglibs for form elements.
<form:errors /> element shows form input errors and any other error associated with	the form data --%>