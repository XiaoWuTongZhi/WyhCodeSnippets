COLOR_ERR="\033[1;31m"    #出错提示
COLOR_SUCC="\033[0;32m"  #成功提示
COLOR_QS="\033[1;37m"  #问题颜色
COLOR_AW="\033[0;37m"  #答案提示
COLOR_END="\033[1;34m"     #颜色结束符

# 根据给出的路径逐层创建文件夹
function makeDir {
    mkdir -p $1
}

# 强制删除文件夹
function deleteTheFolderAbsolutely {
    rm -fr $1 
}

# 打印操作
function printStep {
echo -e "$COLOR_SUCC #陛下请稍等，正在执行操作【$1# $COLOR_END"
}

:<<*
将本地的Xcode代码模版和自定义的几个类文件模版同步到云端
*
function uploadLocalCodeSnippetsAndFileTemplates {
    # 文件夹授权
    chmod 775 ~/Library/Developer/Xcode/UserData/CodeSnippets/
    # 新建临时文件夹
    makeDir snippets
    # 将系统目录下的代码块拷贝到新建的文件夹中
    cp -rf ~/Library/Developer/Xcode/UserData/CodeSnippets/* ./snippets/
    # 本地强制提交云端
    git add .
    printStep "git add ."
    echo -e "$COLOR_QS 陛下，请输入commit log $COLOR_END"
    read commitLog

    # commit log 提交
    printStep "git commit -m ${commitLog}"
    git commit -m "${commitLog}"
    
    # 远端强制提交
    printStep "git push -f origin master"
    git push -f origin master
}

uploadLocalCodeSnippetsAndFileTemplates
