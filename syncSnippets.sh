# 强制删除传递的参数文件夹，然后逐层创建文件夹
function mkDirAbsolutely {
    rm -rf $1
    mkdir -p $1
}

# 从云端下载代码块
function downloadCodesnippetsFromGit {
    git clone $1
}

# 先给 Xcode 的代码块的文件夹设置权限；
# 777 和 775 分别代表三种用户身份的文件权限。（文件所有者、文件所属组、其他用户）7=4+2+1 可读可写可执行；6=4+2可读可写；5=1+4；可读可执行
function moveCodeSnippetsToXcodeSnippetsFolder {
    chmod 775 ~/Library/Developer/Xcode/UserData/CodeSnippets/
    mv -f ./snippets/* ~/Library/Developer/Xcode/UserData/CodeSnippets/
}


# 强制删除文件夹
function deleteTheFolderAbsolutely {
    rm -fr $1 
}

:<<EOF
陛下请不要着急，小人正在为您从云端同步codesnippets到Xcode文件目录下的codesnippets文件夹
EOF

function syncXcodesnippetsFromOnlinestorage {
    #1
    mkDirAbsolutely TempCodeSinppets
    #2
    cd TempCodeSinppets
    #3
    downloadCodesnippetsFromGit git@github.com:XiaoWuTongZhi/WyhCodeSnippets.git
    #4
    cd WyhCodeSnippets
    #5
    mkDirAbsolutely ~/Library/Developer/Xcode/UserData/CodeSnippets/
    #6
    moveCodeSnippetsToXcodeSnippetsFolder
    #8
    cd ..
    #9
    cd ..
    #10
    deleteTheFolderAbsolutely TempCodeSinppets
}

syncXcodesnippetsFromOnlinestorage
