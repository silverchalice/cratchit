
<%@ page import="com.cocoaconf.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-user" class="content scaffold-show" role="main">
			<h1>${userInstance.firstName} ${userInstance.lastName}</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list user">
			
				<g:if test="${userInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><strong><g:message code="user.email.label" default="Email" /></strong></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${userInstance}" field="email"/></span>
					
				</li>
				</g:if>

				<g:if test="${userInstance?.street}">
				<li class="fieldcontain">
					<span id="street-label" class="property-label"><strong><g:message code="user.street.label" default="Street" /></strong></span>
					
						<span class="property-value" aria-labelledby="street-label"><g:fieldValue bean="${userInstance}" field="street"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><strong><g:message code="user.city.label" default="City" /></strong></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${userInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><strong><g:message code="user.state.label" default="State" /></strong></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${userInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.zip}">
				<li class="fieldcontain">
					<span id="zip-label" class="property-label"><strong><g:message code="user.zip.label" default="Zip" /></strong></span>
					
						<span class="property-value" aria-labelledby="zip-label"><g:fieldValue bean="${userInstance}" field="zip"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userInstance?.passwordExpired}">
				<li class="fieldcontain">
					<span id="passwordExpired-label" class="property-label"><strong>Password expired</strong></span>
					
						<span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></span>
					
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="temporaryPassword-label" class="property-label"><strong>Currently using temporary password</strong></span>
					
						<span class="property-value" aria-labelledby="temporaryPassword-label"><g:formatBoolean boolean="${userInstance?.temporaryPassword}" true="Yes" false="No" /></span>
					
				</li>

				<li class="fieldcontain">
					<span id="accountExpired-label" class="property-label"><strong>Account expired</strong></span>
					
						<span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${userInstance?.accountExpired}" true="Yes" false="No" /></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="accountLocked-label" class="property-label"><strong>Account locked</strong></span>
					
						<span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${userInstance?.accountLocked}" true="Yes" false="No" /></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="enabled-label" class="property-label"><strong>Account enabled</strong></span>
					
						<span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${userInstance?.enabled}" true="Yes" false="No" /></span>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${userInstance?.id}" />
					<g:link class="edit" action="edit" id="${userInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
