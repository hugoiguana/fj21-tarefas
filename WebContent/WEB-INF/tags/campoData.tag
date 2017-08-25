<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="id" required="true" %>
<%@ attribute name="value" required="false"%>

<input type="text" id="${id}" name="${id}" value="${value}"/>

<%-- <input type="text" id="${id}" name="${id}" value="<fmt:formatDate value="${value}" pattern="dd/MM/yyyy" />"/> --%>


<script>
	$("#${id}").datepicker({dateFormat: 'dd/mm/yy'});
</script>
