package com.cocoaconf

import org.springframework.dao.DataIntegrityViolationException

class BlurbageController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [blurbageInstanceList: Blurbage.list(params), blurbageInstanceTotal: Blurbage.count()]
    }

    def create() {
        [blurbageInstance: new Blurbage(params)]
    }

    def save() {
        def blurbageInstance = new Blurbage(params)
        if (!blurbageInstance.save(flush: true)) {
            render(view: "create", model: [blurbageInstance: blurbageInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), blurbageInstance.id])
        redirect(action: "show", id: blurbageInstance.id)
    }

    def show(Long id) {
        def blurbageInstance = Blurbage.get(id)
        if (!blurbageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "list")
            return
        }

        [blurbageInstance: blurbageInstance]
    }

    def edit(Long id) {
        def blurbageInstance = Blurbage.get(id)
        if (!blurbageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "list")
            return
        }

        [blurbageInstance: blurbageInstance]
    }

    def update(Long id, Long version) {
        def blurbageInstance = Blurbage.get(id)
        if (!blurbageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (blurbageInstance.version > version) {
                blurbageInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'blurbage.label', default: 'Blurbage')] as Object[],
                          "Another user has updated this Blurbage while you were editing")
                render(view: "edit", model: [blurbageInstance: blurbageInstance])
                return
            }
        }

        blurbageInstance.properties = params

        if (!blurbageInstance.save(flush: true)) {
            render(view: "edit", model: [blurbageInstance: blurbageInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), blurbageInstance.id])
        redirect(action: "show", id: blurbageInstance.id)
    }

    def delete(Long id) {
        def blurbageInstance = Blurbage.get(id)
        if (!blurbageInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "list")
            return
        }

        try {
            blurbageInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'blurbage.label', default: 'Blurbage'), id])
            redirect(action: "show", id: id)
        }
    }
}
