
<%@ page import="com.cocoaconf.Blurbage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blurbage.label', default: 'Blurbage')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blurbage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blurbage" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blurbage">
			
				<g:if test="${blurbageInstance?.code}">
				<li class="fieldcontain">
					<span id="code-label" class="property-label"><g:message code="blurbage.code.label" default="Code" /></span>
					
						<span class="property-value" aria-labelledby="code-label"><g:fieldValue bean="${blurbageInstance}" field="code"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blurbageInstance?.contents}">
				<li class="fieldcontain">
					<span id="contents-label" class="property-label"><g:message code="blurbage.contents.label" default="Contents" /></span>
					
						<span class="property-value" aria-labelledby="contents-label"><g:fieldValue bean="${blurbageInstance}" field="contents"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${blurbageInstance?.id}" />
					<g:link class="edit" action="edit" id="${blurbageInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
