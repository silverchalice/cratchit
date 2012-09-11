
<%@ page import="com.cocoaconf.Blurbage" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blurbage.label', default: 'Blurbage')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blurbage" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blurbage" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="code" title="${message(code: 'blurbage.code.label', default: 'Code')}" />
					
						<g:sortableColumn property="contents" title="${message(code: 'blurbage.contents.label', default: 'Contents')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blurbageInstanceList}" status="i" var="blurbageInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blurbageInstance.id}">${fieldValue(bean: blurbageInstance, field: "code")}</g:link></td>
					
						<td>${fieldValue(bean: blurbageInstance, field: "contents")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blurbageInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
