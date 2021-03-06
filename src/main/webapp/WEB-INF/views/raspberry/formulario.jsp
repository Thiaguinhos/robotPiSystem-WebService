<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="html" tagdir="/WEB-INF/tags/"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set value='${contextPath }/raspberry' var="actionUrl" />

<html:header title="Cadastro"></html:header>

<form:form action="${actionUrl}" commandName="raspberry" class="col s12">
	<c:if test="${raspberry.id != null }">
		<form:input type="hidden" path="id" value="${raspberry.id }"></form:input>
	</c:if>
	<div class="row">
		<html:input-metade label="Nome" name="nome" />
		<form:input path="empresa" type="hidden" label="Empresa" name="raspberry.empresa"/>
	</div>
	
	<div class="row">
        <div class="input-field col s6">
          <input disabled value="${raspberry.empresa.nome}" id="disabled" type="text" class="validate">
          <label for="disabled">Empresa</label>
        </div>
        <div class="input-field col s6">
          <input disabled value="${raspberry.endereco}" id="disabled" type="text" class="validate">
          <label for="disabled">Endereco</label>
        </div>
      </div>
	
	<form:button class="btn waves-effect waves-light">Cadastrar</form:button>
</form:form>
</div>



<html:footer></html:footer>