<%@ page import="com.cocoaconf.Blurbage" %>



<div class="fieldcontain ${hasErrors(bean: blurbageInstance, field: 'code', 'error')} ">
	<label for="code">
		<g:message code="blurbage.code.label" default="Code" />
		
	</label>
	<g:textField name="code" value="${blurbageInstance?.code}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: blurbageInstance, field: 'contents', 'error')} ">
	<label for="contents">
		<g:message code="blurbage.contents.label" default="Contents" />
		
	</label>
	<g:textArea name="contents" cols="40" rows="5" maxlength="10000" value="${blurbageInstance?.contents}"/>
</div>

