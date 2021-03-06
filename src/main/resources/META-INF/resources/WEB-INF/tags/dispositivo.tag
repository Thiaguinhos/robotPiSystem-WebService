<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="dispositivo" required="true"
	type="br.com.thiago.robotPi.model.Dispositivo"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set value="${contextPath }/img/person.png" var="foto" />
<c:set value="${contextPath }/dispositivo" var="edit" />

<li class="collection-item avatar"><img src="${foto}" alt="" class="circle"> 
		<span class="title">${dispositivo.token}</span><p>${dispositivo.user.nome}</p>
		<i id="lixeira_deleta_dispositivo"
	class="secondary-content material-icons waves-effect waves-light"
	onclick="deleta_dispositivo('${dispositivo.token}')">delete</i> </li>
