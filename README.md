# HSIPAReplaceIcon
[![Build Status](https://img.shields.io/badge/Github-HSIPAReplaceIcon-brightgreen.svg)](https://github.com/HansenCCC/HSIPAReplaceIcon)
[![Build Status](https://img.shields.io/badge/platform-ios-orange.svg)](https://github.com/HansenCCC/HSIPAReplaceIcon)
[![Build Status](https://img.shields.io/badge/HansenCCC-Github-blue.svg)](https://github.com/HansenCCC)
[![Build Status](https://img.shields.io/badge/HansenCCC-知乎-lightgrey.svg)](https://www.zhihu.com/people/EngCCC)

脚本自动化批量修改ipa的icon、启动图、APP名称等(demo只修改icon，其他原理一样)、重签ipa


<img src="https://pic3.zhimg.com/80/v2-4b6246b3f4706cfc88043c61595a5446.jpg"  width="400">


<img src="https://pic3.zhimg.com/80/v2-37f35176bd4aa305e8b141cef6c7c05e_720w.jpg"  width="400">



## 运行环境
### 编译系统：苹果Mac
### 编译系统版本：MacOS Catalina 10.15.7
### 需要终端环境：：fastlane、ruby、cocoapods 需要安装APP：Xcode12
***


## 使用文档
1、cd到当前文档路径

2、终端输入 sh do.sh 
```
 赋值make_ios_replaceIcon.sh 常量 KSigningIdentity（证书名字）
 赋值make_ios_replaceIcon.sh 常量 KMobileprovision（描述文件）
```
（channel是用来模拟器多渠道）

## 思路
技术思路：解压ipa文件，替换assets.car文件(更好的方式是解压assets.car文件，替换icon，再压缩，这样速度更快)，修改info.plist对于参数。压缩成ipa文件。再对ipa重新签名。

技术难点：好像也没啥难点，就是有个地方卡了一会，不知道是不是xcode12或者ios 14系统的特性，直接修改icon不生效，需要替换资源文件assets.car才生效。（有了解的朋友可以私聊我，可能游戏使用unit3d开发，然后ipa是没有assets.car文件的，外面的icon优先级高）。证书什么的我就不上去了，想试试的可以用自己的证书和描述文件。


```
以下重签方法任选一种
    1、重签方法一
    codesign -f -s "Apple Distribution: Hengsheng cheng (TB5KM6Y5DQ)" --entitlements ExportOptions.plist Payload/KKDemo.app
    2、重签方法二
    sigh resign
    3、重签方法三
    fastlane -> sigh
    fastlane sigh resign ./path/app.ipa --signing_identity "iPhone Distribution: Felix Krause" -p "my.mobileprovision"    
```

## 参考文档
#### 参考文档https://docs.fastlane.tools/actions/sigh/
#### 参考重签工具fastlane https://github.com/fastlane/fastlane/tree/master/sigh


## 我
#### Created by 程恒盛 on 2020/10/25.
#### Copyright © 2020 力王. All rights reserved.
#### QQ:2534550460@qq.com  GitHub:https://github.com/HansenCCC  tel:13767141841
#### copy请标明出处，感谢

------------

## 你还对这些感兴趣吗

1、[iOS实现HTML H5秒开、拦截请求替换资源、优化HTML加载速度][1]

2、[超级签名中最重要的一步：跳过双重认证，自动化脚本添加udid并下载描述文件（证书和bundleid不存在时，会自动创建）][2]

3、[脚本自动化批量修改ipa的icon、启动图、APP名称等(demo只修改icon，其他原理一样)、重签ipa][3]

4、[QMKKXProduct iOS技术分享][4]


  [1]: https://github.com/HansenCCC/KKQuickDraw
  [2]: https://github.com/HansenCCC/HSAddUdids
  [3]: https://github.com/HansenCCC/HSIPAReplaceIcon
  [4]: https://github.com/HansenCCC/QMKKXProduct
