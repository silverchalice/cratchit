package com.cocoaconf



import org.junit.*
import grails.test.mixin.*

@TestFor(BlurbageController)
@Mock(Blurbage)
class BlurbageControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/blurbage/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.blurbageInstanceList.size() == 0
        assert model.blurbageInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.blurbageInstance != null
    }

    void testSave() {
        controller.save()

        assert model.blurbageInstance != null
        assert view == '/blurbage/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/blurbage/show/1'
        assert controller.flash.message != null
        assert Blurbage.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/blurbage/list'

        populateValidParams(params)
        def blurbage = new Blurbage(params)

        assert blurbage.save() != null

        params.id = blurbage.id

        def model = controller.show()

        assert model.blurbageInstance == blurbage
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/blurbage/list'

        populateValidParams(params)
        def blurbage = new Blurbage(params)

        assert blurbage.save() != null

        params.id = blurbage.id

        def model = controller.edit()

        assert model.blurbageInstance == blurbage
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/blurbage/list'

        response.reset()

        populateValidParams(params)
        def blurbage = new Blurbage(params)

        assert blurbage.save() != null

        // test invalid parameters in update
        params.id = blurbage.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/blurbage/edit"
        assert model.blurbageInstance != null

        blurbage.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/blurbage/show/$blurbage.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        blurbage.clearErrors()

        populateValidParams(params)
        params.id = blurbage.id
        params.version = -1
        controller.update()

        assert view == "/blurbage/edit"
        assert model.blurbageInstance != null
        assert model.blurbageInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/blurbage/list'

        response.reset()

        populateValidParams(params)
        def blurbage = new Blurbage(params)

        assert blurbage.save() != null
        assert Blurbage.count() == 1

        params.id = blurbage.id

        controller.delete()

        assert Blurbage.count() == 0
        assert Blurbage.get(blurbage.id) == null
        assert response.redirectedUrl == '/blurbage/list'
    }
}
