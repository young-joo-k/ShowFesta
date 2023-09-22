console.log("Reply Module.....");



var replyService = (function() {

    function add(reply, callback, error) {
        console.log("add reply.........");

        $.ajax({
            type: 'post',
            url: '/replies/new',
            data: JSON.stringify(reply),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error: function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    function getList(param, callback, error) {
        var b_num = param.b_num;
        var page = param.page || 1;

        $.getJSON("/replies/pages/" + b_num + "/" + page + ".json",
            function(data) {
                if (callback) {
                    callback(data);
                }
            }).fail(function(xhr, status, err) {
            if (error) {
                error();
            }
        });
    }
    
    function get(rno, callback, error) {
    $.get("/replies/" + rno + ".json", function(result) {
    if (callback) {
    callback(result);
    }
   }).fail(function(xhr, status, err) {
   if (error) {
   error();
   }
   });
   }
   

    return {
        add : add,
        getList : getList,
        get : get
    };
})();
