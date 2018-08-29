# Apertus Axiom Web Interface

This is another setup for the Apertus Axiom Interface. May target here is to use some abstraction to get a focus on the main function of the camera.
There are also some other focuses 

* there is only English as Default Language
* All Interface Layout / Functions / Configurations are in JSON Files

#### Target Features

* All Function are in a Database that can be searched (at the moment JSON File)
* Interface are Layoutet in Tabs
* Tabs can be Add or Deleted and Edited (not in first Version)
* Preset Storage


#### Folder Layout
/component  -> All view and widget components Templates are here
/css        -> CSS File Location
/js         -> External JS files and App.js
/img        -> Image Folder
/icon       -> when project is on first version all icons will be inside here

#### Structure (simple)
**Current State**
JSON FIle <> Custom DB Function <> Riot View Component

**Target**
DB.file <> PouchDB <> Custom DB Function <> Riot View Component


#### Used JS Libs
* Riot.js       (MVC Lib)
* PouchDB       (Database stores all Commands / Presets / Interface layout)
* Bootstrap     (GUI Components Stylesheet)


### Components

#### Views

Index HTML -> View TAG -> Widget Tag

## Data Structure

**NOTE** 
The Question will be does it makes sense to add a timecode for simple update with no DB could be possible. 
Does it also make sense to add a Camera ID into each parameter for makeing a Multicamera Setup simpler?

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


## Observable

**Triggers**
* loadPage      -> Loading Selected Page
* loadSetup     -> Loading Setup View

## Web Sockets

### Connections

There will be 2 Ports one for a open stream from the Camera to the Web Interface second a Communication port from Web Inetrface to Camera.
