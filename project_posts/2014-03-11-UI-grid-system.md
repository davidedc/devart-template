UI Grid System
------------

Since Processing doesn't have a layout framework (as notoriously the graphics model in Processing is "immediate" i.e. there is no retained memory structure to match the graphic elements on screen except for the raster memory), a little pre-planning is needed to figure out how to position the elements.

Aligning the UI to a simple grid system with the fewest possible "off-alignment" widgets is going to help a lot. Such a grid system will allow us to position the widgets based on a few measures based on the grid element. The grid is made of 15x20 square elements, and widgets align with "4ths" of the unit.

For the time being we are not planning to have any automatic re-flowing. We can just shrink the interface to fit any screen (although that would cause significant problems with smaller screens and different screen proportions). For the time being, the experience is going to be optimal for a limited range of sizes/proportions.

![grid system](https://raw.github.com/davidedc/devart-template/master/project_images/grid-system.png)