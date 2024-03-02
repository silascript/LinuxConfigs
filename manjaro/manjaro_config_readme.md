
# Majaro配置说明

---

## 各目录说明

### x11

`x11`目录是存放使用`x11`显示服务器模式的配置。

该模式核心使用`.profile`或`.xprofile`为主配置文件，这里使用的是`.xprofile`。但配置内容另放至到`.local_profile`文件，能够让`.xprofile`更简洁，并且可以方便其他需要`source`的配置文件使用，如`.zshrc`。


> [!info]
>
> 建议使用 [compatible](#compatible) 中的[v2](#v2)方案，即使用`.zprofile`代替`.xprofile`，这种方案在`x11`模式下是可以生效的。

---

### wayland

`wayland`目录是存放使用`wayland`显示服务器模式的配置。

该模式没法使用`.profile`或`.xprofile`文件，得使用`~/.config/environment.d/`目录下的`.conf`文件来配置。

`.conf`文件中的配置都是「键值对」。其中使用`${}`来进行变量引用，如`${HOME}`。

> [!info]
>
> 建议使用 [compatible](#compatible) 中的[v2](#v2)方案，即使用`.zprofile`代替`.xprofile`，这方案不使用再使用`~/.config/environment.d/`的配置文件了。


---

### compatible

`compatible`目录是为了兼容[wayland](#wayland)及[x11](#x11)两种模式而作的一种「妥协式」的配置方案。


方案又分两种：

#### v1

这种方式使用到了[wayland](#wayland)中 `environment.d`目录中的配置，所以使用时，`environment.d`目录拷到 `~/.config`目录下，再把`.local_sh_profile`、`.zshrc`、`.xprofile`文件拷到当前用户`HOME`目录下，重启系统，就能有`x11`和`wayland`都能「无痛」使用配置了。

`local_sh_profile`文件是存放「不便」放入`.conf`文件的配置，用于给`.zshrc`、`.xprofile`或`.bashrc`等`source`使用，算是对`.conf`这种配置方式的一种无奈的「补充」。 

这种方案在使用`x11`模式下，使用`.xprofile`配置文件。`wayland`模式使用`.zprofile`。

#### v2

这种方案，不再使用`environment.d`，也不使用`.xprofile`，只使用`.zprofile`，在现manjaro版本，`.zprofile`在`wayland`和`x11`都有在启动后加载并生效。这个方案简洁而有效，是现今兼容`wayland`和`x11`，最佳解决方案。

> [!info] 
> 
> 说能兼容`wayland`和`x11`，其实在`x11`模式下，对于`eval`语法存在问题，并不能生效，所以除了这点外，其他环境变量配置都在两种模式下都是生效的，并且不是只有Shell形式，在图形界面软件下是能正常找到相关环境变量的。



