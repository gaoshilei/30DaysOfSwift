30天学30个Swift小程序

**序言**  

随着 WWDC2019 `Swift5.0`的发布，基于ABI的稳定，Swift 好像要起飞了。之前一直在默默关注着 Swift，大多数声音是 Swift 一年一个样，现在不是学的时候，不过另一个很奇怪的现象是大部分公司都开始使用 Swift，所以 Swift 的重要性对于 iOS 的重要性不言而喻。像我这样抱着 OC 不放的人也大有人在，积极拥抱变化才是王道。  

今天看到网上关于一篇文章 [《100 Days of Swift》](https://samvlu.com/index.html)，国内已经有很多人写过类似的文章了，[30天学习编写30个Swift小程序](https://juejin.im/post/5c618227518825625c270640)，[自学 iOS - 三十天三十个 Swift 项目
](https://www.jianshu.com/p/52032bc4cbe4)，正好可以按照这个思路来学一下 Swift。

可能你会质疑有没有必要重复写一个文章呢？我觉得是有必要的，一方面是为了监督自己学下去，另一方面也可以总结自己的心得和知识点收获。以后我每天会更新一个例子，学习的例子主要参考 《100 Days of Swift》中的，讲一讲在这个例子里面学到了哪些 Swift 知识点，希望自己可以坚持下去。

<!-- more -->


# Day1 - Timer Counter  

![Timer Counter](http://leonlei.top/Day%201%20-%20Timer%20Counter.gif)

知识点总结：  
1.属性观察者 willSet didSet  
2.var let 关键字的区别和使用  
3.@objc 修饰符使用  
4.Swift 中Timer使用

# Day2 - Iconfont  

![](http://leonlei.top/Day%202%20-%20Iconfont.gif)  

知识点总结：  
1.访问限制关键字 private、fileprivate、internal、public、open  

```
private 只能在当前文件的当前模块的作用域使用  
fileprivate 只能在当前文件内使用  
internal 是默认访问级别，所有没有单独列出的都是这个权限  
public 可以在外部文件访问，如果只需要访问就用它  
open 可以在外部文件访问，如果需要继承和重写就用它    
```

2.单例的使用，在 class 外面用 static let 修饰即可  
3.重写父类方法，类方法和实例方法的使用  
4.强制解包和去解包 ！ ？   

```
隐式解包: 就是在定义可选类型值的时候，加上 ！进行强制解包  
显示解包: 在使用的时候加 ！进行解包  
去解包: 用的时候加上 ？可定义 optional 进行解包  
```  
5.空合运算符 ？？，本质上是对三目运算符的一种简化  
6.convenience 和 required 关键字使用  

# Day3 - Find My Position  
![](http://leonlei.top/Day%203%20-%20Find%20My%20Position.gif)

知识点总结：  
1.使用 CoreLocation 获取用户当前的地理位置  
2.使用 URLRequest URLSession 调用腾讯地图open api 获取具体位置信息  
3.JSONSerialization序列化JSON字符串  

# Day4 - Pull To Refresh
![](http://leonlei.top/Day%204%20-%20Pull%20To%20Refresh.gif)  

知识点总结：  
1.tableView 使用  
2.Array的使用  
3.UIRefreshControl 的使用  

# Day5 -  Play Local Video 

![](http://leonlei.top/Day%205%20-%20Play%20Local%20Video.gif)

知识点总结：  
1.复习tablView和tablViewCell在Swift中的用法  
2.导入使用AVKit,熟悉AVAsset、AVPlayerItem、AVPlayer、AVPlayerViewController的使用  
3.extension为当前类创建扩展，可以用来分隔功能，实现相关协议  

# Day6 - Simple PhotoBrowser  
![](http://leonlei.top/Day%206%20-%20Simple%20PhotoBrowser.gif)  

知识点总结：  
1.自定义一个view,继承自UIView，添加imageView到scrollView上，监听zommForView方法，实现手势缩放图片  
2.designated initializers方法，关键点为三点 
> **primary initializers：**designated initializers 是一个类的主初始化器，理论上来说是一个类初始化的必经之路（注：不同的初始化路径可能调用不同的 designated initializers  
> **fully initializes all properties：**这点很明确，必须在 designated initializers 中完成所有成员属性的初始化；  
> **calls an appropriate superclass initializer：**需要调用合适的父类初始化器完成初始化，不能随意调用。   

3.通过scrollViewDidZoom代理方法设置缩小时图片居中  


