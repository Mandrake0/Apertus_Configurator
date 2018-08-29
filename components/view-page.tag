<view-page hide={ disable }>
<!-- Layout -->
    <!-- Load Components // Note: the full Object gets sendet to the Widget -->
    <div>
        <div each={ data, i in components }>
            <widget-card data={ data } ></widget-card>
        </div>
    </div>

<!-- Custom Style -->
<style>

</style>

<!-- Script -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

// local Variable
this.components = []
this.disable = false

// On Load get first Page with the Components 
this.on('mount', function() {
    // Getting all components from the First page
    var pagelist = db.queryItems('type', 'page')
    self.observable.trigger('loadPage',db.queryItems('_id', pagelist[0].components) )
    self.update()
})

/**
 * OBSERVABLE
 */

// Load Page Components
this.observable.on('loadPage', function(setPageValue){
    self.disable = false
    console.log("get Command: setPage")
    console.log(setPageValue)
    self.components = setPageValue
    self.update()
})

this.observable.on('loadSetup', function(setPageValue){
    self.disable = true
    self.update()
})


</script>
</view-page>