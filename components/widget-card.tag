<widget-card>
<!-- Layout -->
<div onclick={ editValue } hide={ listView }>
<div class="card box">
    <div class="card-header">
        { title }
    </div>
    <div class="card-body">
        { value }
    </div>
</div>
</div>
<!-- Custom Style -->
<style>
    div.box {
        margin: 5px;
        width:  9rem;
    }
</style>
<!-- Code -->
<script>
// Observable 

// Getting the Object Data 
this.dataObject = opts.data
this.listView = opts.listview
console.log(opts)
// Set Values

this.title = this.dataObject.name
this.value = this.dataObject.value

editValue(e){
    console.log(e)
    
}

</script>
</widget-card>