<%@ page import="com.cocoaconf.User" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>Upload User List</title>
	</head>
	<body>
		<a href="#create-user" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list">All Users</g:link></li>
			</ul>
		</div>
		<div id="create-user" class="content scaffold-create" role="main">
			<h1>Upload User List</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm action="processi" >
                <fieldset class="form">
                    <div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} ">
                        <label for="users">
                            &nbsp;
                        </label>
                        <input type="file" id="users" name="users" />
                    </div>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="Upload" />
				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
