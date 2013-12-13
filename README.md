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

##link .vim and .vimrc to ~

``` bash
ln -s g-vim/.vim ~/.vim
ln -s g-vim/.vimrc ~/.vimrc
```

##download submodule
``` bash
git submodule init
git submodule update
```

##install plugin
``` bash
:BundleInstall
```

enjoy it

Shortcuts

1. F9 tagbar
2. ,p ctrlp 
3. ctrl + h/j/k/l windows switch
4. ,,+w  ,,+f[e]  easymotion
5. ,cc ,cu comment

ctags

``` bash
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
:set tags=./../tags  <------tags's path
```

cscope

``` bash
find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files
cscope -b
```