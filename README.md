##install depending library

``` bash
sudo apt-get build-dep vim
sudo apt-get install mercurial
```

##download gvim source code

``` bash
hg clone https://vim.googlecode.com/hg/ gvim
cd gvim 
#find tags 
hg tags 
hg update [tags]
```

##configuration

``` bash
./configure \  
	--enable-multibyte \  
	--enable-perlinterp=yes \  
	--enable-pythoninterp=yes \  
	--enable-tclinterp \  
	--enable-rubyinterp \  
	--enable-cscope \  
	--enable-sniff \  
	--enable-fontset \  
	--with-features=huge \  
	--enable-gui=gnome2 \
	--with-compiledby=gavin

make
sudo make install
```
##install ctags

``` bash
sudo apt-get install exuberant-ctags
```

##install cscope

##copy .vim and .vimrc to ~

##install plugin
```
:BundleInstall
```

enjoy it

Shortcuts
1.F5 checksyntax 运行checksyntax 
2.F7 open nerdtree 
3.F8 open tagbar
4.<leader>ig 
5.,ch highlight column
6.use Shift + right/left to switch buffer
7.ctrl + \ xptemplate
8.<leader>ff <leader>fb <leader>fd

plugin
1.NERD_tree
2.NERD_commenter
3.miniBufExploer
4.checksyntax
5.DoxygenToolkit
6.indent_guides
7.omnicppcomplete
8.supertab
9.tagbar
10.xpt
11.Fuzzyfinder

ctags
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
:set tags=./../tags  <------tags's path

cscope
find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files
cscope -b

