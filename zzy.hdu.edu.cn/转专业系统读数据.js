/*
    杭电转专业系统数据查询
    A script which enables you to view how many people have applied to all majors in HDU's major change website (zzy.hdu.edu.cn). 
    Execute directly in Console from http://zzy.hdu.edu.cn/ .
    2016-01-20
 */

var hduzzy_genericErrorHandler = function(e) {
    if (e.status == 404) console.error("您未登录，请点击 http://cas.hdu.edu.cn/cas/login?service=http%3A%2F%2Fzzy.hdu.edu.cn%2F 登录后重试");
    else console.error("错误 " + e.status + "：" + e.statusText);
}

var getAllResults = function(callback) {
    $.get("http://zzy.hdu.edu.cn/optionalApplyMajorJSONArrAction?num=2", {},
        function(data) {
            var ret = [],
                requests = [];
            JSON.parse(data).map(function(i) {
                if (i.value != "")
                    requests.push($.post(
                        "http://zzy.hdu.edu.cn/chosenExecRecPlanInfoAction", {
                            "zydm": i.value
                        },
                        function(data) {
                            ret.push(JSON.parse(data).rows[0]);
                        }).fail(hduzzy_genericErrorHandler))
            });
            $.when.apply($, requests)
                .then(
                    function() {
                        ret.sort(function(a, b) {
                            return b.applyrs - a.applyrs;
                        });
                        callback(ret);
                    });
        }).fail(hduzzy_genericErrorHandler);
};

String.prototype.rpadding || (String.prototype.rpadding = function(len, char) {
    char = typeof char !== 'undefined' ? char : ' ';
    return (this + Array(len + 1).join(char)).slice(0, len);
});

(function() {
    console.log(
        '%c' 
        + '转专业查询 for HDU\n' 
        + 'Doc: https://github.com/Jamesits/HDU-Scripts/blob/master/zzy.hdu.edu.cn/\n' 
        + Array(41).join('*') + '\n',
        "background: #FFF; color: #0AA"
    );
    getAllResults(function(ret) {
        ret.forEach(function(data, index) {
            applyer_count = parseInt(data.applyrs);
            uplimit = parseInt(data.uplimit.split("/")[1]);
            colorstring = index % 2 ? "background: #DDD; " : "background: #FFF; ";
            colorstring += applyer_count < uplimit ? "color: #090" : "color: #900";
            console.log(
                '%c' + ("报名人数：" + applyer_count + " / " + uplimit).rpadding(16) 
                + "专业：" + data.zymc + "（" + data.zydm + "）@ " + data.ssxy,
                colorstring
            );
        });
    });
    return "正在获取数据……";
})();
