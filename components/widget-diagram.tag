<widget-diagram>
<!-- Layout -->
<div class="card box">
    <div class="card-header">
            { title }
    </div>
    <div class="card-body">
        <div>
            <img src={ icon } width="48" height="48">
            <a class="size">{ value }</a>
        </div>
    </div>
</div>
<!-- Custom Style -->
<style>
    a.size {
        font-size: 24px;
    }
    div.box {
        margin: 5px;
        width:  9rem;
    }
</style>
<!-- Code -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

// Getting the Object Data 
this.dataObject = opts.data

// Set Values
this.title = this.dataObject.name
this.value = this.dataObject.value
this.icon = this.dataObject.defaultIcon
this.id = this.dataObject._id

/**
 * OBSERVABLE
 */

// On ID 
this.observable.on("ID_" + this.id, function(value){
    self.value = value.value
    // Compare value and get the correct icon 
    if (self.dataObject.selectionType === "range"){
        var i = 0
        self.dataObject.selection.range.forEach(element => {
            if (parseInt(self.value) >= element){
                i++
        }});
        self.icon = self.dataObject.selection.icon[i]
    }
    self.update()
})

</script>
</widget-diagram>
