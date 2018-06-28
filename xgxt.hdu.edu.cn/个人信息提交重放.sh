# 如果你用完了一次杭州电子科技大学学生工作管理系统（xgxt.hdu.edu.cn）里修改信息的机会
# 但是又不想找辅导员去修改的话，可以使用以下脚本。 
# 所有中文需要替换成对应的数据，然后 URL encode 一下。如果数据有特殊格式会标注出来。
# 你也可以在网页表单上拿到数据格式。
# 需要先登录系统。

curl 'http://xgxt.hdu.edu.cn/xuesheng/update' \
  -H 'Origin: http://xgxt.hdu.edu.cn/login' \
  -H 'Accept-Encoding: gzip, deflate' \
  -H 'Accept-Language: en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2' \
  -H 'User-Agent: Mozilla/5.0 (X11; CrOS x86_64 8530.96.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.154 Safari/537.36' \
  -H 'Content-Type: application/x-www-form-urlencoded' \
  -H 'Accept: */*' \
  -H 'Cookie: fid=xxx; JSESSIONID=yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy; route=zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz' \
  -H 'Proxy-Connection: keep-alive' \
  --data 'id=1234&xueyuanbh=学院编号 \
  &zhuanyebh=专业编号 \
  &banjibh=班级号 \
  &gongyul=楼号（形如“xx号楼”） \
  &qinshih=寝室号 \
  &chuanghao=床号 \
  &xuehao=学号 \
  &xingming=姓名 \
  &xingbie=性别（男性为1） \
  &chushengrq=出生日期（yyyy/mm/dd） \
  &shenfenzh=身份证号 \
  &minzubh=01 \
  &jiguan= \
  &zhengzhimmbh=03 \
  &zongjiaoxybh=19332 \
  &lianxifs=你的手机号 \
  &qq=你的QQ \
  &email=电子邮件 \
  &biyexuexiao= \
  &xingqu= \
  &techang= \
  &nianji=年级（入学年份yyyy） \
  &xuejizt=%E6%9C%89 \
  &ruxuesj=入学日期（yyyymm） \
  &xslbm=20 \
  &xuezhi=4.0 \
  &jiatingdz=原家庭地址&jiatingdh=原家庭电话&jiatingzip=原家庭邮编 \
  &nowjtdz=现家庭地址&nowjtdh=现家庭电话&nowjtzip=现家庭邮编 \
  &jtcycw1=家庭成员1姓名&jtcydw1=工作&jtcyzzmmbh1=01&jtcyzjxybh1=19332&jtcylxfs1=手机号 \
  &jtcycw2=&jtcydw2=&jtcyzzmmbh2=13&jtcyzjxybh2=19332&jtcylxfs2= \
  &jtcycw3=&jtcydw3=&jtcyzzmmbh3=&jtcyzjxybh3=&jtcylxfs3= \
  &jtcycw4=&jtcydw4=&jtcyzzmmbh4=&jtcyzjxybh4=&jtcylxfs4= \
  &jtcycw5=&jtcydw5=&jtcyzzmmbh5=&jtcyzjxybh5=&jtcylxfs5= \
  &zhidingrencw=紧急联系人姓名&zhidingrendw=紧急联系人单位&zhidingrenlxfs=紧急联系方式' \
  --compressed