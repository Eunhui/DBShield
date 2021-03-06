<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

$(document).ready(function(){
	$("#db_type").click(function(event) {
		if ($("#db_type").val() == "O") {
			$("#db_name").show();
		} else if($("#db_type").val() == "M"){
			$("#db_name").hide();
		}
	});
});

</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			
		</div>
		<div class="span8">
		<H3>DB 연결</H3>
				<form action="./globalPolicyPage.do" method="post" id="dbConnectionform" name="dbConnectionform">
					<table class="table table-condensed">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> DB Type</th>
								<td>
									
									<select class="ml10" id="db_type" name="db_type">
											<option value="M">MySQL</option>
											<option value="O">Oracle</option>
									</select>
								</td>
							</tr>
							<tr id="db_name" style="display:none">
								<th class="al"> DB 이름</th>
								<td><input type="text" name="db_name" value="orcl"/></td>
							</tr>
							<tr>
								<th class="al"> Host</th>
								<td><input type="text" name="host" value="localhost"/></td>
							</tr>
							<tr>
								<th class="al"> User</th>
								<td><input type="text" name="user" value="root"/></td>
							</tr>
							<tr>
								<th class="al"> Password</th>
								<td><input type="password" name="password" value="hitcom123"/></td>
							</tr>
							<tr>
								<th class="al"> Port</th>
								<td><input type="text" name="port" value="3306"/></td>
							</tr>
							<tr>
								<th class="al"></th>
								<td> <input type="submit" class="btn" value="연결" /></td>
							</tr>
						</tbody>
					</table>
				</form>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
