package com.cocoaconf

import org.springframework.dao.DataIntegrityViolationException

class UserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def springSecurityService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    def create() {
        [userInstance: new User(params)]
    }

    def save() {
        def userInstance = new User(params)
        userInstance.with {
            username = params.email
            password = springSecurityService.encodePassword("cocoaconf")
            temporaryPassword = true
            enabled = true
            accountExpired = false
            accountLocked = false
            passwordExpired = false
        }
        if (!userInstance.save(flush: true)) {
            render(view: "create", model: [userInstance: userInstance])
            return
        }

        flash.message = "Account created for user ${userInstance.firstName} ${userInstance.lastName}"
        redirect(action: "show", id: userInstance.id)
    }

    def show(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def edit(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        [userInstance: userInstance]
    }

    def update(Long id, Long version) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (userInstance.version > version) {
                userInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'user.label', default: 'User')] as Object[],
                          "Another user has updated this User while you were editing")
                render(view: "edit", model: [userInstance: userInstance])
                return
            }
        }

        userInstance.properties = params

        if (!userInstance.save(flush: true)) {
            render(view: "edit", model: [userInstance: userInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])
        redirect(action: "show", id: userInstance.id)
    }

    def delete(Long id) {
        def userInstance = User.get(id)
        if (!userInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
            return
        }

        try {
            userInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
            redirect(action: "show", id: id)
        }
    }

    def upload() {}

    def processi() {
        def uploadedFile = request.getFile("users")
        if(!uploadedFile.empty){
            if(!uploadedFile.originalFilename.endsWith(".txt")){
                flash.message = "Please upload a text file."
                redirect(action: "upload")
                return
            } else {
                def failures = 0
                def nonFailures = 0

                uploadedFile.transferTo(new File('users.txt'))
                def users = new File('users.txt')

                users.eachLine { line ->
                    def fields = line.tokenize("|")
                    def user = new User(username: fields[2], email: fields[2], firstName: fields[0],
                             lastName: fields[1], password: springSecurityService.encodePassword("cocoaconf"),
                             temporaryPassword: true, enabled: true, accountExpired: false, accountLocked: false,
                             passwordExpired: false)
                    if(!user.save()){
                        failures++
                    } else {
                        nonFailures++
                    }
                }

                users.delete()

                flash.message = "Yay. ($failures failed, $nonFailures succeeded)"
                redirect(action: "upload")
            }
        } else {
            flash.message = "You did not upload a file."
            redirect(action: "upload")
        }
    }

}
