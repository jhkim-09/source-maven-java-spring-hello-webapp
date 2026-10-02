<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<html>
<head>
<title>Project Fighting</title>
</head>
<body>
<h1>${msg}</h1>
<h2>Today is <fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></h2>
<h3>Version: 1.0</h3>
</body>
</html>
