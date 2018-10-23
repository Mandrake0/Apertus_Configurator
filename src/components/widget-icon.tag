<widget-icon>
<!-- Layout -->
<div class="card-widget box">
        <div class="center">
            <h5>{ title }</h5>
    </div>
    <div class="">
        <div>
            <i class="material-icons md-48">{ icon }</i>
            <span class="size">{ value }</span>
        </div>
    </div>
</div>
<!-- Custom Style -->
<style>
    .center {
        text-align: center;
    }
    .align {
        vertical-align: middle;
        margin: 2px;
    }
    .size {
        font-size: 22px;
    }
    div.box {
        margin: 5px;
        width:  9rem;
        height: 100px;
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
</widget-icon>
