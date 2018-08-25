# Apertus Axiom Web Interface

This is another setup for the Apertus Axiom Interface. May target here is to use some abstraction to get a focus on the main function of the camera.

#### Target Features

* All Function are in a Database that can be searched
* Interface are Layoutet in Tabs
* Tabs can be Add or Deleted and Edited
* Preset Storage


#### Folder Layout
/component  -> All view and widget components Templates are here
/css        -> CSS File Location
/js         -> External JS files and App.js
/img        -> Image Folder
/icon       -> when project is on first version all icons will be inside here

#### Structure (simple)
DB.file <> PouchDB <> Custom DB Function <> Controller <> Riot Component


#### Used JS Libs
* Riot.js       (MVC Lib)
* PouchDB       (Database stores all Commands / Presets / Interface layout)
* Bootstrap     (GUI Components Stylesheet)


### Components

#### Views

Index HTML -> View TAG -> Widget Tag

## Data Structure

### Function

* _id               -> internal id
* type              -> Defined Type will be used for the Widget
* name              -> Name of the Function
* class             -> for what is it (imagesensor / hardware / imageprocessing / ...)
* value             -> Current set Value
* defaultValue      -> default defined Value for Reseting
* selection         -> Range / Array / ???
* command           -> websocket command

#### Data Structure
{
    "_id":"value",
    "type":"value",
    "name":"value",
    "class":"value",
    "value":"value",
    "defaultValue":"value",
    "selection":"value",
    "command":"value"
}

### Page

* _id               -> internal id
* type              -> Definition that this dataset is a page
* name              -> Name of the Page
* _pos              -> internal position value
* components        -> Array of Components

#### Data Structure
{
    "_id":"value",
    "type":"value",
    "name":"value",
    "_pos":"value",
    "components": ["comp01_id", "comp02_id"]
}
