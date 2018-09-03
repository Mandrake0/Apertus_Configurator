<widget-modal>
    <!-- Layout -->

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
        <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">{ dataObject.name }</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
            </button>
        </div>
        <div class="modal-body">
            <div class="form-group">
                <label for="formSelection">Set { dataObject.name } Value:</label>
                <select onchange={ selectedOnChange } class="form-control" id="formSelection">
                        <option selected>{ dataObject.value }</option>
                        <option disabled>----------------</option>
                        <option each={ item, i in selection} >
                            { item }
                        </option>
                </select>
            </div>
        </div>
        <div class="modal-footer">
            <button onclick={ setToDefault } type="button" class="btn btn-light">Set to Default</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button onclick={ updateValue } type="button" class="btn btn-primary" data-dismiss="modal">Save changes</button>
        </div>
        </div>
    </div>
    </div>

<!-- Custom Style -->
<style>

</style>
<!-- Code -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

// Current DataObject
this.dataObject = []
this.selection = []

// Setting the Value to the Default Value defined by the defaultValue Attribute
setToDefault(){
    self.dataObject.value = self.dataObject.defaultValue
    self.update()
}

selectedOnChange (e){
    self.dataObject.value = e.srcElement.value
    self.update()
}

updateValue(){
    // 
    self.observable.trigger("ID_" + self.dataObject._id, self.dataObject)
    //db.updateItem(self.dataObject)
}

/**
 * OBSERVABLE
 */

this.observable.on('loadEditWindow', function(value){
    self.dataObject = value
    self.selection = value.selection.split(",")
    self.update()
})

</script>
</widget-modal>