<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<spring:htmlEscape defaultHtmlEscape="true" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>MYWEBAPP|ErrorPage</title>
<style type="text/css">
/* Error Page Css starts here*/

 .error_page{padding:0;margin: 14% 0 0;position: relative;}
    .main_error{
          margin: 0px auto;
    background-color: rgb(255, 255, 255);
    color: #000;
    text-align: center;
    max-width: 400px;
    padding: 0px 0 20px;
    font-family: sans-serif;

      }
      .error_head{   height: 50px;
    background: rgb(40, 116, 215);
    margin: 0 0 30px;
    border-top-right-radius: 54px;
    }
     .main_error img{padding:0;margin: 0 auto;max-width: 90px;min-width: 90px;height: auto;}

    .main_error h3 {
    padding: 0 10px;
    font-size: 32px;
    line-height: initial;
    font-weight: 900;
    color: #f00;
    margin: 30px 0 15px;
}
   .main_error p {
    padding: 0 30px;
    margin: 0;
    font-size: 16px;
    color: #675959;
    line-height: initial;
}
.main_error button{    background: #d86c1f;
    color: #fff;
    font-size: 15px;
    line-height: initial;
    border: 1px solid #d86c1f;
    margin: 20px 0 0;
    padding: 5px 30px; 
    cursor: pointer;}
.main_error button:hover {
    background: #fff;
    color: #d86c1f;     
}

</style>
</head>
 <body  style="background:rgb(61, 132, 193)">


 <div class="container-fluid error_page">
        <div class="main_error"> 
          <div class="error_head"> </div>
          <%--   <img class="img-responsive"  src="<c:url value='resources/images/Error-1.png'/>" alt="error">  --%>
            <h3>Oops! Something went Wrong.</h3>
            <p> Application has encountered an error. Please Login again and try.</p>
           <a href="${pageContext.request.contextPath}/login"> <button class="btn">Login here</button></a>
        </div>

      </div>

    
</body>
</html> 
