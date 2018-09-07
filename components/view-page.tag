<view-page hide={ disable }>
<!-- Layout -->
    <!-- Load Components // Note: the full Object gets sendet to the Widget -->
    <div>
        <div each={ data, i in components }>
            <widget-card if={data.class == 'component'} data={ data } ></widget-card>
            <widget-diagram if={data.class == 'diagram'} data={ data }></widget-diagram>
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
    self.components = setPageValue
    self.update()
})

this.observable.on('loadSetup', function(setPageValue){
    self.disable = true
    self.update()
})


</script>
</view-page>