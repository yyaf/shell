
if [ ! $1 ]
then
	echo "####### 请输入自己的项目 #######"
	exit;
fi

if [ ! $2 ]
then
	echo "####### 请输入commit值 #######"
	exit;
fi

# 给出一个默认的项目路径
path="/home/yyaf"

case "$1" in
	"TLCL")
	echo "TLCL_notes"
	path="/home/yyaf/TLCL_notes"
	;;
	"blog")
	echo "my_blog"
	path="/home/yyaf/my_blog"
	;;
esac

# 进入项目
cd $path
echo "####### 进入$1项目 #######"
ls
echo "开始执行命令"
git add .
git status
# 写个sleep 1s；是为了解决并发导致卡壳
sleep 1s
echo "####### 添加文件 #######"
git commit -m "$2"
echo "####### commit #######"
sleep 1s
echo "####### 开始推送 #######"

if [ ! $3 ]
then
  echo "####### 请输入自己提交代码的分支 #######"
  exit;
fi

git push origin "$3"
echo "####### 推送成功 #######"
