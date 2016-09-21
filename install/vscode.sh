#!/bin/bash

echo -e "\n*** Install and configure VisualStudio Code and extensions"

ensureAppExists "npm"
saveLocallyFromUrl http://go.microsoft.com/fwlink/?LinkID=760868 /tmp/vscode.deb

dpkg -i /tmp/vscode.deb
ensureAppExists "code"

npm install -g typings

code --install-extension DotJoshJohnson.xml
code --install-extension HookyQR.beautify
code --install-extension Kasik96.format-indent
code --install-extension PeterJausovec.vscode-docker
code --install-extension Shan.code-settings-sync
code --install-extension TwentyChung.jsx
code --install-extension Zignd.html-css-class-completion
code --install-extension abusaidm.html-snippets
code --install-extension alefragnani.project-manager
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dbankier.vscode-instant-markdown
code --install-extension donjayamanne.githistory
code --install-extension felixfbecker.php-debug
code --install-extension humao.rest-client
code --install-extension ikappas.phpcs
code --install-extension lonefy.vscode-JS-CSS-HTML-formatter
code --install-extension mohsen1.prettify-json
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension qinjia.view-in-browser
code --install-extension rebornix.Ruby
code --install-extension robertohuertasm.vscode-icons
code --install-extension robinbentley.sass-indented
code --install-extension vsmobile.vscode-react-native
code --install-extension waderyan.gitblame
code --install-extension xabikos.JavaScriptSnippets

# typings install dt~backbone --global
# typings install lodash --save
