<%@ page import="com.cocoaconf.Conference" %>


<ckeditor:config toolbar="Basic" />

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'startDate', 'error')} ">
	<label for="startDate">
		<g:message code="conference.startDate.label" default="Start Date" />
		
	</label>
	<g:datePicker name="startDate" precision="day"  value="${conferenceInstance?.startDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'endDate', 'error')} ">
	<label for="endDate">
		<g:message code="conference.endDate.label" default="End Date" />
		
	</label>
	<g:datePicker name="endDate" precision="day"  value="${conferenceInstance?.endDate}" default="none" noSelection="['': '']" />
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'venue', 'error')} ">
	<label for="venue">
		<g:message code="conference.venue.label" default="Venue" />
		
	</label>
	<g:select id="venue" name="venue.id" from="${com.cocoaconf.Venue.list()}" optionKey="id" value="${conferenceInstance?.venue?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="conference.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="10000" value="${conferenceInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'days', 'error')} ">
	<label for="days">
		<g:message code="conference.days.label" default="Days" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.days?}" var="d">
    <li><g:link controller="conferenceDay" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="conferenceDay" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'conferenceDay.label', default: 'ConferenceDay')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'dates', 'error')} ">
	<label for="dates">
		<g:message code="conference.dates.label" default="Dates" />
		
	</label>
	<g:textField name="dates" value="${conferenceInstance?.dates}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'displayName', 'error')} ">
	<label for="displayName">
		<g:message code="conference.displayName.label" default="Display Name" />
		
	</label>
	<g:textField name="displayName" value="${conferenceInstance?.displayName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'registrationBlurb', 'error')} ">
	<label for="registrationBlurb">
		<g:message code="conference.registrationBlurb.label" default="Registration Blurb" />
		
	</label>
    <ckeditor:editor name="registrationBlurb" height="400px" width="75%">
        ${conferenceInstance.registrationBlurb}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'eventBriteBlurb', 'error')} ">
	<label for="eventBriteBlurb">
		<g:message code="conference.eventBriteBlurb.label" default="Event Brite Blurb" />
		
	</label>
	<g:textArea name="eventBriteBlurb" cols="40" rows="5" maxlength="100000" value="${conferenceInstance?.eventBriteBlurb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'galleryBlurb', 'error')} ">
	<label for="galleryBlurb">
		<g:message code="conference.galleryBlurb.label" default="Gallery Blurb" />
		
	</label>
    <ckeditor:editor name="galleryBlurb" height="400px" width="75%">
        ${conferenceInstance.galleryBlurb}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'partnerBlurb', 'error')} ">
	<label for="partnerBlurb">
		<g:message code="conference.partnerBlurb.label" default="Partner Blurb" />
		
	</label>
    <ckeditor:editor name="partnerBlurb" height="400px" width="75%">
        ${conferenceInstance.partnerBlurb}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'featuredSpeakers', 'error')} ">
	<label for="featuredSpeakers">
		<g:message code="conference.featuredSpeakers.label" default="Featured Speakers" />
		
	</label>
    <ckeditor:editor name="featuredSpeakers" height="400px" width="75%">
        ${conferenceInstance.featuredSpeakers}
    </ckeditor:editor>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'sponsorListBlurb', 'error')} ">
	<label for="sponsorListBlurb">
		<g:message code="conference.sponsorListBlurb.label" default="Sponsor List Blurb" />
		
	</label>
	<g:textArea name="sponsorListBlurb" cols="40" rows="5" maxlength="100000" value="${conferenceInstance?.sponsorListBlurb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'slides', 'error')} ">
	<label for="slides">
		<g:message code="conference.slides.label" default="Slides" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.slides?}" var="s">
    <li><g:link controller="presentationFile" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="presentationFile" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'presentationFile.label', default: 'PresentationFile')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'status', 'error')} ">
	<label for="status">
		<g:message code="conference.status.label" default="Status" />
		
	</label>
	<g:select name="status" from="${conferenceInstance.constraints.status.inList}" value="${conferenceInstance?.status}" valueMessagePrefix="conference.status" noSelection="['': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'leads', 'error')} ">
	<label for="leads">
		<g:message code="conference.leads.label" default="Leads" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.leads?}" var="l">
    <li><g:link controller="interest" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="interest" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'interest.label', default: 'Interest')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'blurb', 'error')} ">
	<label for="blurb">
		<g:message code="conference.blurb.label" default="Blurb" />
		
	</label>
	<g:textField name="blurb" value="${conferenceInstance?.blurb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'city', 'error')} ">
	<label for="city">
		<g:message code="conference.city.label" default="City" />
		
	</label>
	<g:textField name="city" value="${conferenceInstance?.city}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'partners', 'error')} ">
	<label for="partners">
		<g:message code="conference.partners.label" default="Partners" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.partners?}" var="p">
    <li><g:link controller="sponsorship" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="sponsorship" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'sponsorship.label', default: 'Sponsorship')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'prizes', 'error')} ">
	<label for="prizes">
		<g:message code="conference.prizes.label" default="Prizes" />
		
	</label>
	<g:select name="prizes" from="${com.cocoaconf.Prize.list()}" multiple="multiple" optionKey="id" size="5" value="${conferenceInstance?.prizes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'sessions', 'error')} ">
	<label for="sessions">
		<g:message code="conference.sessions.label" default="Sessions" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${conferenceInstance?.sessions?}" var="s">
    <li><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="session" action="create" params="['conference.id': conferenceInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'session.label', default: 'Session')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'state', 'error')} ">
	<label for="state">
		<g:message code="conference.state.label" default="State" />
		
	</label>
	<g:textField name="state" value="${conferenceInstance?.state}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: conferenceInstance, field: 'tinyName', 'error')} ">
	<label for="tinyName">
		<g:message code="conference.tinyName.label" default="Tiny Name" />
		
	</label>
	<g:textField name="tinyName" value="${conferenceInstance?.tinyName}"/>
</div>

