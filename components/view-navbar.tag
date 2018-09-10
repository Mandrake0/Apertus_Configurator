<view-navbar>
<!-- Layout -->
<header class="sticky">
        <a class="logo"><img src="/img/apertus_Logo.svg" width="50" height="30" class="block" alt=""></a>
        <div each={item, i in pagelist} class="block">
            <a class="button" onclick={ setPage }>{ item.name }</a>
        </div>
        <!-- List View -->
        <div onclick={ setListView } class="block">
                <i class="material-icons">view_list</i>
        </div>
        <!-- App Settings -->
        <div onclick={ setConfiguration } class="block">
                <i class="material-icons">settings</i>
        </div>

</header>

<!-- Custom Style -->
<style>
    .block{
        margin: 5px;
        display: inline-block;
    }
</style>

<!-- Script -->
<script>
// local 
var self = this

// Mixin
this.mixin(SharedMixin)

// local Variable
this.pagelist = []

// On Load get first Page with the Components 
this.on('mount', function() {
    // Getting all pages from ObjectList
    self.pagelist = db.queryItems('type', 'page')
    self.update()
  })


// Set Page 
setPage(e){
    var i = e.item.i
    self.pagelist = db.queryItems('type', 'page')
    self.currentPage = self.pagelist[i]
    self.observable.trigger('loadPage', db.queryItems('_id', self.currentPage.components) )
    self.update() 
}
// Load Commads List (view-commands.tag)
setConfiguration(){
    self.observable.trigger('loadSetup')
}

// Set List View
setListView(){

    //self.listView = !self.listView 
    self.update()
}

</script>
</view-navbar>