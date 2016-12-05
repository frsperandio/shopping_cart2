<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ attribute name="valor" required="false" %>
<c:set var="now" value="<%=new java.util.Date()%>" />
(<fmt:formatDate type="both" value="${now}" />)