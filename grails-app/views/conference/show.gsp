
<%@ page import="com.cocoaconf.Conference" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conference.label', default: 'Conference')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-conference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-conference" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list conference">
			
				<g:if test="${conferenceInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="conference.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${conferenceInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="conference.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${conferenceInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.venue}">
				<li class="fieldcontain">
					<span id="venue-label" class="property-label"><g:message code="conference.venue.label" default="Venue" /></span>
					
						<span class="property-value" aria-labelledby="venue-label"><g:link controller="venue" action="show" id="${conferenceInstance?.venue?.id}">${conferenceInstance?.venue?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="conference.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${conferenceInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.days}">
				<li class="fieldcontain">
					<span id="days-label" class="property-label"><g:message code="conference.days.label" default="Days" /></span>
					
						<g:each in="${conferenceInstance.days}" var="d">
						<span class="property-value" aria-labelledby="days-label"><g:link controller="conferenceDay" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.dates}">
				<li class="fieldcontain">
					<span id="dates-label" class="property-label"><g:message code="conference.dates.label" default="Dates" /></span>
					
						<span class="property-value" aria-labelledby="dates-label"><g:fieldValue bean="${conferenceInstance}" field="dates"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.displayName}">
				<li class="fieldcontain">
					<span id="displayName-label" class="property-label"><g:message code="conference.displayName.label" default="Display Name" /></span>
					
						<span class="property-value" aria-labelledby="displayName-label"><g:fieldValue bean="${conferenceInstance}" field="displayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.registrationBlurb}">
				<li class="fieldcontain">
					<span id="registrationBlurb-label" class="property-label"><g:message code="conference.registrationBlurb.label" default="Registration Blurb" /></span>
					
						<span class="property-value" aria-labelledby="registrationBlurb-label"><g:fieldValue bean="${conferenceInstance}" field="registrationBlurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.eventBriteBlurb}">
				<li class="fieldcontain">
					<span id="eventBriteBlurb-label" class="property-label"><g:message code="conference.eventBriteBlurb.label" default="Event Brite Blurb" /></span>
					
						<span class="property-value" aria-labelledby="eventBriteBlurb-label"><g:fieldValue bean="${conferenceInstance}" field="eventBriteBlurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.galleryBlurb}">
				<li class="fieldcontain">
					<span id="galleryBlurb-label" class="property-label"><g:message code="conference.galleryBlurb.label" default="Gallery Blurb" /></span>
					
						<span class="property-value" aria-labelledby="galleryBlurb-label"><g:fieldValue bean="${conferenceInstance}" field="galleryBlurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.partnerBlurb}">
				<li class="fieldcontain">
					<span id="partnerBlurb-label" class="property-label"><g:message code="conference.partnerBlurb.label" default="Partner Blurb" /></span>
					
						<span class="property-value" aria-labelledby="partnerBlurb-label"><g:fieldValue bean="${conferenceInstance}" field="partnerBlurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.featuredSpeakers}">
				<li class="fieldcontain">
					<span id="featuredSpeakers-label" class="property-label"><g:message code="conference.featuredSpeakers.label" default="Featured Speakers" /></span>
					
						<span class="property-value" aria-labelledby="featuredSpeakers-label"><g:fieldValue bean="${conferenceInstance}" field="featuredSpeakers"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.sponsorListBlurb}">
				<li class="fieldcontain">
					<span id="sponsorListBlurb-label" class="property-label"><g:message code="conference.sponsorListBlurb.label" default="Sponsor List Blurb" /></span>
					
						<span class="property-value" aria-labelledby="sponsorListBlurb-label"><g:fieldValue bean="${conferenceInstance}" field="sponsorListBlurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.slides}">
				<li class="fieldcontain">
					<span id="slides-label" class="property-label"><g:message code="conference.slides.label" default="Slides" /></span>
					
						<g:each in="${conferenceInstance.slides}" var="s">
						<span class="property-value" aria-labelledby="slides-label"><g:link controller="presentationFile" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="conference.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${conferenceInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.leads}">
				<li class="fieldcontain">
					<span id="leads-label" class="property-label"><g:message code="conference.leads.label" default="Leads" /></span>
					
						<g:each in="${conferenceInstance.leads}" var="l">
						<span class="property-value" aria-labelledby="leads-label"><g:link controller="interest" action="show" id="${l.id}">${l?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.blurb}">
				<li class="fieldcontain">
					<span id="blurb-label" class="property-label"><g:message code="conference.blurb.label" default="Blurb" /></span>
					
						<span class="property-value" aria-labelledby="blurb-label"><g:fieldValue bean="${conferenceInstance}" field="blurb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.city}">
				<li class="fieldcontain">
					<span id="city-label" class="property-label"><g:message code="conference.city.label" default="City" /></span>
					
						<span class="property-value" aria-labelledby="city-label"><g:fieldValue bean="${conferenceInstance}" field="city"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.partners}">
				<li class="fieldcontain">
					<span id="partners-label" class="property-label"><g:message code="conference.partners.label" default="Partners" /></span>
					
						<g:each in="${conferenceInstance.partners}" var="p">
						<span class="property-value" aria-labelledby="partners-label"><g:link controller="sponsorship" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.prizes}">
				<li class="fieldcontain">
					<span id="prizes-label" class="property-label"><g:message code="conference.prizes.label" default="Prizes" /></span>
					
						<g:each in="${conferenceInstance.prizes}" var="p">
						<span class="property-value" aria-labelledby="prizes-label"><g:link controller="prize" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.sessions}">
				<li class="fieldcontain">
					<span id="sessions-label" class="property-label"><g:message code="conference.sessions.label" default="Sessions" /></span>
					
						<g:each in="${conferenceInstance.sessions}" var="s">
						<span class="property-value" aria-labelledby="sessions-label"><g:link controller="session" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="conference.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:fieldValue bean="${conferenceInstance}" field="state"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${conferenceInstance?.tinyName}">
				<li class="fieldcontain">
					<span id="tinyName-label" class="property-label"><g:message code="conference.tinyName.label" default="Tiny Name" /></span>
					
						<span class="property-value" aria-labelledby="tinyName-label"><g:fieldValue bean="${conferenceInstance}" field="tinyName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${conferenceInstance?.id}" />
					<g:link class="edit" action="edit" id="${conferenceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
