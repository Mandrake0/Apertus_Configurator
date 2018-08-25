<view-commands>
    <!-- Search Bar -->
    <!-- TODO Needs to be fixed -->
    <div class="input-group">
        <input type="text" class="form-search form-control" placeholder="Search">
        <div class="input-group-btn">
            <button class="form-submit btn btn-default" type="submit">
                <i class="material-icons">search</i>
            </button>
        </div>
    </div>
    <!-- List all Commands -->
    <div each={item, i in list}>
        <div>{ item.name } { item.type }</div>
    </div>
<!-- Custom Style -->
<style>
    .form-search {
        margin-top: 5px;
    }
    .form-submit {   
    margin-top: 5px;
    padding-top: 3px;
    padding-bottom: 3px;
    }
</style>
<!-- Code -->
<script>


this.list = [{"name":"page 01", "type":"page"},
            {"name":"ISO Offset", "type":"component"}
            ]


</script>

</view-commands>