<widget-card>
<!-- Layout -->
<div onclick={ editValue } hide={ listView }>
<div class="card box">
    <div class="section">
        { title }
    </div>
    <div class="section">
        { value }
    </div>
</div>
</div>
<div show={ listView }>
    <button type="button" class="butt ">
        <b>{ title }</b> { value }
    </button>
</div>
<!-- Custom Style -->
<style>
    div.box {
        margin: 5px;
        width:  9rem;
    }
    .butt{
        margin: 5px;
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
this.id = this.dataObject._id

this.on('mount', function() {
    //console.log(this.title, this.value)
})

editValue(e){
    self.observable.trigger('loadEditWindow', self.dataObject)   // Passing the Component Dataset
}

/**
 * OBSERVABLE
 */

// On ID 
this.observable.on("ID_" + this.id, function(value){
    self.value = value.value
    self.update()
})

</script>
</widget-card>