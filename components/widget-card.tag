<widget-card>
<!-- Layout -->
<div onclick={ editValue } hide={ listView } data-toggle="modal" data-target="#exampleModal">
<div class="card box">
    <div class="card-header">
        { title }
    </div>
    <div class="card-body">
        { value }
    </div>
</div>
</div>
<div show={ listView }>
    <button type="button" class="butt btn btn-outline-dark btn-lg btn-block">
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

this.on('mount', function() {
    console.log(this.title, this.value)
})

editValue(e){
    self.observable.trigger('loadEditWindow', self.dataObject)   // Passing the Component Dataset
}

</script>
</widget-card>