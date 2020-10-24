
#脚本自动化修改ipa的icon、启动图、APP名称(demo只修改icon，其他原理一样)

#修改icon思路，解压ipa文件，替换assets.car(更好的方式是解压assets.car文件，替换icon，再压缩)文件，修改info.plist对于参数。压缩成ipa文件。再对ipa重新签名。

#技术难点，好像也没啥难点，就是有点地方卡主很久了，不知道是不是xcode12或者ios 14系统的特性，修改直接修改icon不生效，需要替换资源文件assets.car才生效。（有了解的朋友可以私聊我，可能游戏使用unit3d开发，然后ipa是没有assets.car文件的，外面的icon优先级高）。证书什么的我就不上去了，想试试的可以用自己的证书和描述文件。

#参考文档https://docs.fastlane.tools/actions/sigh/
#参考重签工具fastlane https://github.com/fastlane/fastlane/tree/master/sigh

#以下重签方法任选一种
    #重签方法一
    #codesign -f -s "Apple Distribution: Hengsheng cheng (TB5KM6Y5DQ)" --entitlements ExportOptions.plist Payload/KKDemo.app
    #重签方法二
    #sigh resign
    #重签方法三
    #fastlane -> sigh
    #fastlane sigh resign ./path/app.ipa --signing_identity "iPhone Distribution: Felix Krause" -p "my.mobileprovision"

#需要测试的朋友修改这两个常量即可测试
#定义常量证书 ⚠️当前钥匙圈需要配置
export KSigningIdentity="4124664FFD30CAE0F7312380EEC3ED34675F6F4D"
#定义重签描述文件 ⚠️当前脚本目录下面要有
export KMobileprovision="comlwgzsqimkkxDev.mobileprovision"

#判断是否存在后缀名为cer的文件
function findSuffixFile(){
    for i in `ls -a *.$1`
    do
        echo "$1为后缀的文件存在"
        return 0
    done
    echo "$1为后缀的文件不存在"
    return 1
}

starttime=$(date +%Y-%m-%d\ %H:%M:%S)
echo "🚀 开始时间 $starttime 🚀"
#ipa路径
KIPAFilePath=$1
#要替换的文件路径，例如：icon、APP名字、启动图存放点路径
KIPANeedReplaceFilePath=$2
echo "目标ipa文件路径=$KIPAFilePath"

#常量ipa标准默认解压名字
export KIPAUnzipFileName="Payload"
#解压ipa文件
tar xvf $KIPAFilePath
cd $KIPAUnzipFileName
#判断是否存在后缀名为app的文件
if !(findSuffixFile 'app')
then
    echo "🚀 解压失败，请检查ipa解压情况 🚀"
    echo "🚀 结束时间 $endtime 🚀"
    exit
fi
echo "🚀 解压成功，替换资源文件操作 🚀"

#app 包名字
KIPAAppName=''
for i in `ls -a`
do
    KIPAAppName=$i
done
echo $KIPAAppName
cd $KIPAAppName
KPWD=`pwd`

#复制资源文件到ipa包中
cp -rf $KIPANeedReplaceFilePath/* $KPWD
#回到上层目录
cd ../..
echo `pwd`
#打包名字
KZIpName="$(date +%Y-%m-%d-%H-%M-%S)$KIPAFilePath"
echo $KZIpName
#压缩文件夹⚠️用tar命令发现压缩后体积变大，不明则厉
zip -r $KZIpName $KIPAUnzipFileName
#准备重签，sigh resign
#4124664FFD30CAE0F7312380EEC3ED34675F6F4D 签名为证书号码 与Apple Distribution: Hengsheng cheng (TB5KM6Y5DQ)意思相同
fastlane sigh resign $KZIpName --signing_identity $KSigningIdentity -p $KMobileprovision

endtime=$(date +%Y-%m-%d\ %H:%M:%S)
echo "🚀 开始时间 $starttime 🚀"
echo "🚀 结束时间 $endtime 🚀"



#作者：程恒盛(Hansen)
#手机：13767141841
#邮件：2534550460@qq.com
