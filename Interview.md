##  常见题目

### 阿里的面试经历
 先介绍了项目，然后问了一些项目中的问题，然后开始问基础
属性的关键字
浅拷贝和深拷贝的区别
Block的循环引用、如何解决、原理
三种Block
Block和delegate的比较
kvo的实现原理
Autorelease pool的实现原理
消息转发机制
线程死锁的四个条件
进程和线程的区别
持久化
事务的特征
中途还讨论了Masonry的约束应该写在哪里，我说应该写在layoutSubViews，他说会调用多次，然后争论了一会儿
总结起来：面试官喜欢抛出一个大点，看你能讲多广多深
#### 阿里二面 ：40mins
介绍项目
性能优化
YYModel和AF源码
如何自己设计json转model
架构
迷之算法题
总结：阿里的面试效率是真的不提了，二面和一面间隔时间可能相差了一个月吧，我已经从北京回到了学校开始上课了，而且这次面试感觉有点奇怪，最后那道迷之算法题我们也有讨论，实在没搞懂计算两点间的距离的算法还能怎样优化，面试结束后我问了面试官最优解是怎样的，面试官告诉我没有最优，只有更优（微笑脸）

#### 阿里三面：2h
一个安卓的面试官。。。。。
主要问了项目的一些东西 和给一些场景问我如何实现
自我介绍 介绍一些项目难点
主线程是相对于什么而言的
一张图片的内存占用大小是由什么决定的
索引的作用
索引的优缺点
在数组中找最小的k个数
淘宝下拉加载更多如何优化
淘宝页面发送HTTP请求的过程
介绍一下MVVM
知道哪些设计模式
总结：三面面试官主要就聊了一些具体场景问题和一些基础，基础我觉得没太大问题。面试过程中我讲到一些东西发现面试官听不懂，才知道面试官是做安卓的，问一些问题其实有点让我无语，但是总的来说还是回答过来了，感觉也没有太大问题，但是后面还是被挂了，很无奈。
### 分享下，百度、美团的面试总结吧！
 runtime相关问题 runtime是iOS开发最核心的知识了，如果下面的问题都解决了，那么对runtime的理解已经很深了。runtime已经开源了，这有一份别人调试好可运行的源码objc-runtime，也可以去官网找objc4
结构模型
1. 介绍下runtime的内存模型（isa、对象、类、metaclass、结构体的存储信息等） 
2. 为什么要设计metaclass 
3. class_copyIvarList & class_copyPropertyList区别 
4. class_rw_t 和 class_ro_t 的区别 
5. category如何被加载的,两个category的load方法的加载顺序，两个category的同名方法的加载顺序 
6. category & extension区别，能给NSObject添加Extension吗，结果如何 
7. 消息转发机制，消息转发机制和其他语言的消息机制优劣对比 
8. 在方法调用的时候，方法查询-> 动态解析-> 消息转发 之前做了什么 
9. IMP、SEL、Method的区别和使用场景 
10. load、initialize方法的区别什么？在继承关系中他们有什么区别 
11. 说说消息转发机制的优劣 
内存管理
1. weak的实现原理？SideTable的结构是什么样的 
2. 关联对象的应用？系统如何实现关联对象的 
3. 关联对象的如何进行内存管理的？关联对象如何实现weak属性 
4. Autoreleasepool的原理？所使用的的数据结构是什么 
5. ARC的实现原理？ARC下对retain & release做了哪些优化 
6. ARC下哪些情况会造成内存泄漏 
Runloop & KVO runloop runloop对于一个标准的iOS开发来说都不陌生，应该说熟悉runloop是标配，下面就随便列几个典型问题吧
1. app如何接收到触摸事件的 
2. 为什么只有主线程的runloop是开启的 
3. 为什么只在主线程刷新UI 
4. PerformSelector和runloop的关系 
5. 如何使线程保活 
KVO 同runloop一样，这也是标配的知识点了，同样列出几个典型问题
1. 实现原理 
2. 如何手动关闭kvo 
3. 通过KVC修改属性会触发KVO么 
4. 哪些情况下使用kvo会崩溃，怎么防护崩溃 
5. kvo的优缺点 
Block
1. block的内部实现，结构体是什么样的 
2. block是类吗，有哪些类型 
3. 一个int变量被 __block 修饰与否的区别？block的变量截获 
4. block在修改NSMutableArray，需不需要添加__block 
5. 怎么进行内存管理的 
6. block可以用strong修饰吗 
7. 解决循环引用时为什么要用__strong、__weak修饰 
8. block发生copy时机 
9. Block访问对象类型的auto变量时，在ARC和MRC下有什么区别 
多线程 主要以GCD为主
1. iOS开发中有多少类型的线程？分别对比 
2. GCD有哪些队列，默认提供哪些队列 
3. GCD有哪些方法api 
4. GCD主线程 & 主队列的关系 
5. 如何实现同步，有多少方式就说多少 
6. dispatch_once实现原理 
7. 什么情况下会死锁 
8. 有哪些类型的线程锁，分别介绍下作用和使用场景 
9. NSOperationQueue中的maxConcurrentOperationCount默认值 
10. NSTimer、CADisplayLink、dispatch_source_t 的优劣 
性能优化
1. 如何做启动优化，如何监控 
2. 如何做卡顿优化，如何监控 
3. 如何做耗电优化，如何监控 
4. 如何做网络优化，如何监控 
架构设计
1. AFN 
2. SDWebImage 
3. JSPatch、Aspects(虽然一个不可用、另一个不维护，但是这两个库都很精炼巧妙，很适合学习) 
4. Weex/RN, 笔者认为这种前端和客户端紧密联系的库是必须要知道其原理的 
5. CTMediator、其他router库，这些都是常见的路由库，开发中基本上都会用到 
6. 请圈友们在评论下面补充吧 
架构设计
1. 手动埋点、自动化埋点、可视化埋点 
2. MVC、MVP、MVVM设计模式 
3. 常见的设计模式 
4. 单例的弊端 
5. 常见的路由方案，以及优缺点对比 
6. 如果保证项目的稳定性 
7. 设计一个图片缓存框架(LRU) 
8. 如何设计一个git diff 
9. 设计一个线程池？画出你的架构图 
10. 你的app架构是什么，有什么优缺点、为什么这么做、怎么改进 
数据结构与算法 对于移动开发者来说，一般不会遇到非常难的算法，大多以数据结构为主，笔者列出一些必会的算法，当然有时间了可以去LeetCode上刷刷题
1. 八大排序算法 
2. 栈&队列 
3. 字符串处理 
4. 链表 
5. 二叉树相关操作 
6. 深搜广搜 
7. 基本的动态规划题、贪心算法、二分查找 