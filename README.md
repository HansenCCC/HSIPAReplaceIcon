# HSIPAReplaceIcon
脚本自动化批量修改ipa的icon、启动图、APP名称等(demo只修改icon，其他原理一样)、重签ipa


<img src="https://raw.githubusercontent.com/HansenCCC/HSIPAReplaceIcon/main/WechatIMG38.jpeg"  width="400">


<img src="https://raw.githubusercontent.com/HansenCCC/HSIPAReplaceIcon/main/WechatIMG14.jpeg"  width="400">



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
技术思路：解压ipa文件，替换assets.car(更好的方式是解压assets.car文件，替换icon，再压缩，这样速度更快)文件，修改info.plist对于参数。压缩成ipa文件。再对ipa重新签名。

技术难点：好像也没啥难点，就是有点地方卡主很久了，不知道是不是xcode12或者ios 14系统的特性，修改直接修改icon不生效，需要替换资源文件assets.car才生效。（有了解的朋友可以私聊我，可能游戏使用unit3d开发，然后ipa是没有assets.car文件的，外面的icon优先级高）。证书什么的我就不上去了，想试试的可以用自己的证书和描述文件。


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
