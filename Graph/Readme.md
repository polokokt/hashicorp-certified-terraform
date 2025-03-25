`terraform graph`   - Commmand will generate text interpretation of the terraform resources structure.

There is also possibility to install `graphviz` tool localy and use below commands (first one or second depend what output format you want):
`terraform graph | dot -Tsvg > graph.svg`  - The oiutput can be save as file and then open in the web broser.
`terraform graph -type=plan | dot -Tpng >graph.png`  -