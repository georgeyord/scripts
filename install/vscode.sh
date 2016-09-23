#!/bin/bash

echo -e "\n*** Install and configure VisualStudio Code and extensions"

ensureAppExists "npm"
saveLocallyFromUrl http://go.microsoft.com/fwlink/?LinkID=760868 /tmp/vscode.deb

dpkg -i /tmp/vscode.deb
ensureAppExists "code"

npm install -g typings
ensureAppExists "typings"

su $DEFAULT_USER -c "code --install-extension DotJoshJohnson.xml"
su $DEFAULT_USER -c "code --install-extension HookyQR.beautify"
su $DEFAULT_USER -c "code --install-extension Kasik96.format-indent"
su $DEFAULT_USER -c "code --install-extension PeterJausovec.vscode-docker"
su $DEFAULT_USER -c "code --install-extension Shan.code-settings-sync"
su $DEFAULT_USER -c "code --install-extension TwentyChung.jsx"
su $DEFAULT_USER -c "code --install-extension Zignd.html-css-class-completion"
su $DEFAULT_USER -c "code --install-extension abusaidm.html-snippets"
su $DEFAULT_USER -c "code --install-extension alefragnani.project-manager"
su $DEFAULT_USER -c "code --install-extension christian-kohler.path-intellisense"
su $DEFAULT_USER -c "code --install-extension dbaeumer.vscode-eslint"
su $DEFAULT_USER -c "code --install-extension dbankier.vscode-instant-markdown"
su $DEFAULT_USER -c "code --install-extension donjayamanne.githistory"
su $DEFAULT_USER -c "code --install-extension felixfbecker.php-debug"
su $DEFAULT_USER -c "code --install-extension humao.rest-client"
su $DEFAULT_USER -c "code --install-extension ikappas.phpcs"
su $DEFAULT_USER -c "code --install-extension lonefy.vscode-JS-CSS-HTML-formatter"
su $DEFAULT_USER -c "code --install-extension mohsen1.prettify-json"
su $DEFAULT_USER -c "code --install-extension msjsdiag.debugger-for-chrome"
su $DEFAULT_USER -c "code --install-extension qinjia.view-in-browser"
su $DEFAULT_USER -c "code --install-extension rebornix.Ruby"
su $DEFAULT_USER -c "code --install-extension robertohuertasm.vscode-icons"
su $DEFAULT_USER -c "code --install-extension robinbentley.sass-indented"
su $DEFAULT_USER -c "code --install-extension vsmobile.vscode-react-native"
su $DEFAULT_USER -c "code --install-extension waderyan.gitblame"
su $DEFAULT_USER -c "code --install-extension xabikos.JavaScriptSnippets"

# typings install dt~backbone --global
# typings install lodash --save
