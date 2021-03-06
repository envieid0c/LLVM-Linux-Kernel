KernelViz

This is a call graph visualization tool for a collection of dot
files. The dot files are generated by LLVM with a simple patch
that allows an option to generated the files during compliation.

The tool uses NodeJS and a browser (tested with Firefox and 
Chrome).

The following NodeJS modules are needed:

  npm install string
  npm install node-dir
  npm install graphlib
  npm install graphlib-dot
  npm install object-keys
  npm install path

The client side does the layout and rendering. It uses the
following libraries:

http://d3js.org/d3.v3.js
http://cpettitt.github.io/project/dagre-d3/latest/dagre-d3.js
http://lorenzoongithub.github.io/completely/complete.ly.1.0.1.min.js


RUNNING KernelVIZ

Once you have a dir tree of dot files and a build directory of
object files, edit and run the setup script.

  vim setup.sh

Update the directory paths as needed.

  ./setup.sh

You can then start the server:

nodejs KernelViz.js

To view the module graphs, open either Chrome or Firefox to:

  http://localhost:8001/index.html

Select the file to display from the drop down list.
Use the mouse wheel to zoom in or out.
Double click anywhere to set the zoom center and zoom in.
Click on a node to toggle information about that node.

There is a color key for the color of the nodes.

For external nodes that are defined in modules compiled by clang, there should be
a link to the dot file defining the function when the function node is selected in
the graph. Clicking the link will take you to the new graph. There is no "back"
functionality implemented yet.

Select Dir View:

This is a top level graph of the kernel showing the interactions between the
subsystems. Click on a node to see its incoming and outgoing links.

