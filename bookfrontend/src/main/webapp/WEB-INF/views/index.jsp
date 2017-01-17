<%@ taglib
    prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" 
%>
<html>
<body>
<jsp:include page="header.jsp"></jsp:include>
<c:out value="${ErrorMessage}"/>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
