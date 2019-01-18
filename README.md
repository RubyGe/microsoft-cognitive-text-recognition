## Text in an asset search portal quick prototype

## B/E
1. Create a DB with image urls and cognitive text metadata fields, plus other metadata fields such as date created, file size, file type, etc.
2. Run a script that grabs the urls of assets, run them against the cognitive data service, parse json info cognitive text metadata
3. Update the database cognitive_text field with the metadata generated
3. Perform a search in the DB and test if the right assets show up

Test how effective the prototye is in performing certain types of tasks.

## F/E
1. Have an interface that shows the thumbnail of a list of assets in the directory
2. Have a search input box
3. Can perform search and return results


MVP - annotate data, search data

