package com.cocoaconf

import org.springframework.dao.DataIntegrityViolationException

class ConferenceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [conferenceInstanceList: Conference.list(params), conferenceInstanceTotal: Conference.count()]
    }

    def create() {
        [conferenceInstance: new Conference(params)]
    }

    def save() {
        def conferenceInstance = new Conference(params)
        if (!conferenceInstance.save(flush: true)) {
            render(view: "create", model: [conferenceInstance: conferenceInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'conference.label', default: 'Conference'), conferenceInstance.id])
        redirect(action: "show", id: conferenceInstance.id)
    }

    def show(Long id) {
        def conferenceInstance = Conference.get(id)
        if (!conferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "list")
            return
        }

        [conferenceInstance: conferenceInstance]
    }

    def edit(Long id) {
        def conferenceInstance = Conference.get(id)
        if (!conferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "list")
            return
        }

        [conferenceInstance: conferenceInstance]
    }

    def update(Long id, Long version) {
        def conferenceInstance = Conference.get(id)
        if (!conferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (conferenceInstance.version > version) {
                conferenceInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'conference.label', default: 'Conference')] as Object[],
                          "Another user has updated this Conference while you were editing")
                render(view: "edit", model: [conferenceInstance: conferenceInstance])
                return
            }
        }

        conferenceInstance.properties = params

        if (!conferenceInstance.save(flush: true)) {
            render(view: "edit", model: [conferenceInstance: conferenceInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'conference.label', default: 'Conference'), conferenceInstance.id])
        redirect(action: "show", id: conferenceInstance.id)
    }

    def delete(Long id) {
        def conferenceInstance = Conference.get(id)
        if (!conferenceInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "list")
            return
        }

        try {
            conferenceInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'conference.label', default: 'Conference'), id])
            redirect(action: "show", id: id)
        }
    }
}
