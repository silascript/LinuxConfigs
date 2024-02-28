
# Majaro配置说明

---

## 各目录说明

### x11

`x11`目录是存放使用`x11`显示服务器模式的配置。

该模式核心使用`.profile`或`.xprofile`为主配置文件，这里使用的是`.xprofile`。但配置内容另放至到`.local_profile`文件，能够让`.xprofile`更简洁，并且可以方便其他需要`source`的配置文件使用，如`.zshrc`。


---

### wayland

`wayland`目录是存放使用`wayland`显示服务器模式的配置。

该模式没法使用`.profile`或`.xprofile`文件，得使用`~/.config/environment.d/`目录下的`.conf`文件来配置。

`.conf`文件中的配置都是「键值对」。其中使用`${}`来进行变量引用，如`${HOME}`。


---

### compatible

`compatible`目录是为了兼容[wayland](#wayland)及[x11](#x11)两种模式而作的一种「妥协式」的配置方案。

而在`compatible`配置目录中，`local_sh_profile`文件是存放「不便」放入`.conf`文件的配置，用于给`.zshrc`、`.xprofile`或`.bashrc`等`source`使用，算是对`.conf`这种配置方式的一种无奈的「补充」。

这种方式使用到了[wayland](#wayland)中`environment.d`目录中的配置，所以使用时，先将`wayland`目录中的`environment.d`拷到`~/.config`目录下，再把`.local_sh_profile`、`.zshrc`、`.xprofile`文件拷到当前用户`HOME`目录下，重启系统，就能有`x11`和`wayland`都能「无痛」使用配置了。



