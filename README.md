30天学30个Swift小程序

**序言**  

随着 WWDC2019 `Swift5.0`的发布，基于ABI的稳定，Swift 好像要起飞了。之前一直在默默关注着 Swift，大多数声音是 Swift 一年一个样，现在不是学的时候，不过另一个很奇怪的现象是大部分公司都开始使用 Swift，所以 Swift 的重要性对于 iOS 的重要性不言而喻。像我这样抱着 OC 不放的人也大有人在，积极拥抱变化才是王道。  

今天看到网上关于一篇文章 [《100 Days of Swift》](https://samvlu.com/index.html)，国内已经有很多人写过类似的文章了，[30天学习编写30个Swift小程序](https://juejin.im/post/5c618227518825625c270640)，[自学 iOS - 三十天三十个 Swift 项目
](https://www.jianshu.com/p/52032bc4cbe4)，正好可以按照这个思路来学一下 Swift。

可能你会质疑有没有必要重复写一个文章呢？我觉得是有必要的，一方面是为了监督自己学下去，另一方面也可以总结自己的心得和知识点收获。以后我每天会更新一个例子，学习的例子主要参考以上文章，讲一讲在这个例子里面学到了哪些 Swift 知识点，希望自己可以坚持下去。

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
4.添加tapGesture，通过双击缩放图片  

# Day7 - Color Gradient   
![](http://leonlei.top/Day%207%20-%20Color%20Gradient.gif)

知识点总结：  
一天的时间是24小时，渐变色分为12段，每天温度最高是12点，然后温度逐渐下降，图层的渐变效果根据当前的温度来设定，温度根据当前的时间来设定，通过手势滑动可以设置当前的时间。  
1.使用CAGradientLayer实现图层的渐变效果  
2.给UIColor添加extension方便生成颜色  
3.通过重写touchesBegan、touchesMoved方法来监听手势变化  

# Day8 - Carousel Effect  

![](http://leonlei.top/Day%208%20-%20Carousel%20Effect.gif)  
知识点总结：  
1.照片横屏滑动的旋转木马效果，复习使用 UICollectionView 来实现，cell的标题view上添加UIEffectView 实现毛玻璃效果  
2.swift 中使用lazy关键字实现延时加载，lazy还可以配合map filter 这类接受闭包运行的方法一起运行    
3.cell的layer设置设置圆角并且ClipToBounds会触发离屏渲染，大量cell的时候要避免这样使用  
4.`Masnory`的Swift版本`SnapKit`使用

# Day9 - Emoji Slot Machine  
![](http://leonlei.top/Day%209%20-%20Emoji%20Slot%20Machine.gif)  
知识点总结：  
1.使用Emoji和UIPickerView实现了小时候玩的老虎机效果，打开VIP开关可以每次都命中  
2.在这个小demo中学习了延迟asyncAfter的使用，逃逸闭包（@escaping）和非逃逸闭包区别     
3.使用arc4random()随机函数乱排Component，对比三行的Emoji值，如果一样则显示Congratulation

# Day10 - TableView Gradient
![](http://leonlei.top/Day%2010%20-%20TableView%20Gradient.gif)  

知识点总结：  
1.针对每个cell设置渐变色  
2.将颜色均分成cell的个数+1，然后让每个cell的的颜色从top到bottom进行渐变  

# Day11 - Animate tableViewCell  
![](http://leonlei.top/Day11%20-%20animate%20TableViewCell.gif)  
知识点总结：  
1.效果类似于之前百度外卖商品列表的cell动画，整体思路通过CGAffineTransform来实现    
2.还是用上一个项目的渐变效果，在viewWillAppear的时候给cell加上位移动画，首先设置cell的纵向偏移，然后再用UIView动画将cell位置归位，注意要打个时差，不然效果就不好看了  
3.设置动画的时候需要刷新tableView数据，不然没有效果    

# Day 12 - Login Animation
![](http://leonlei.top/Day12%20-%20login%20Animation.gif)  

知识点总结：  
1.使用usingSpringWithDamping完成弹跳效果  
2.使用CGAffineTransform完成控件的位移效果  

# Day 13 - Splash Video  

![](http://leonlei.top/Day13%20-%20Splash%20Video.gif)  

知识点总结：  
1.使用AVPlayerController和AVPlayer来实现  
2.需要设置AVPlayerController的showsPlaybackControls为false，不然视频的控件就让用户看到了  
3.设置播放结束的通知监听  

```  
NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(item:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: videoPlayer.player?.currentItem) 
``` 
等到播放结束时，重新播放  

```
videoPlayer.player?.seek(to: .zero)
videoPlayer.player?.play()
```

