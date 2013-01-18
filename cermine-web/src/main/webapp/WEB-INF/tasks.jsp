<%-- 
    Document   : result
    Created on : 2012-11-23, 14:07:20
    Author     : Aleksander Nowinski <a.nowinski@icm.edu.pl>
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CERMINE extraction task</title>
        <%@include file="html_meta.jsp" %>
        <meta http-equiv="refresh" content="30"> 
    </head>
    <body>
        <div id="wrapper">
            <%@include file="header.jsp" %>
            <article id="main">
                <h1>Submitted extractions:</h1>
                <c:choose>
                    <c:when test="${empty tasks}">
                        No taks submitted yet. Please <a href="index.html">submit one.</a>
                    </c:when>
                    <c:otherwise>
                        <table id="task_table">
                            <tr>
                                <th></th>
                                <th>Submitted</th>
                                <th>File</th>
                                <th>Status</th>
                                <th>Processing[s]</th>
                            </tr>
                            <c:forEach items="${tasks}" var="task" varStatus="status">
                                <tr class="${task.status.css}">
                                    <td>${status.index+1}</td>
                                    <td>${task.creationDate}</td>
                                    <td><a href="task.html?task=${task.id}">${task.fileName}</a></td>
                                    <td class="status">${task.status.text}</td>
                                    <td><c:if test="${task.finished}">${task.result.processingTimeSec}</c:if></td>
                                    </tr>
                            </c:forEach>
                        </table>
                    </c:otherwise>
                </c:choose>
            </article>
            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>