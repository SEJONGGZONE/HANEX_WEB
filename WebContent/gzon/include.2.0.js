var cur_token = "1Bb6wI6DnVL8S8LQAbvAO+pSnKXCf7HwQ7GEn+FnrJk=";
var refresh_token = "1Bb6wI6DnVL8S8LQAbvAO+pSnKXCf7HwQ7GEn+FnrJk=";

var UNIQUE_STRING = getUinqueString();
function getUinqueString() {
  var today = new Date();
  var dd = String(today.getDate()).padStart(2, "0");
  var mm = String(today.getMonth() + 1).padStart(2, "0"); //January is 0!
  var yyyy = today.getFullYear();
  var hh = today.getHours();
  var mm = today.getMinutes();
  var ss = today.getSeconds();
  var mi = today.getMilliseconds();

  return mm + dd + yyyy + hh + mm + ss + mi;
}

// document.write('<link rel="stylesheet" type="text/css" href="vendor/slick/slick.min.css"/>');
// document.write('<link rel="stylesheet" type="text/css" href="vendor/slick/slick-theme.min.css"/>');
// document.write('<link href="vendor/icons/icofont.min.css" rel="stylesheet" type="text/css">');
// document.write('<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">');
// document.write('<link href="css/style.css" rel="stylesheet">');
// document.write('<link href="vendor/sidebar/demo.css" rel="stylesheet"></link>');

document.write('<link rel="stylesheet" href="/css/xeicon.css">');
document.write('<link rel="stylesheet" href="/css/common.css">');
document.write('<link rel="stylesheet" href="/css/style.css">');

document.write('<link rel="preconnect" href="https://fonts.googleapis.com">');
document.write('<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>');
document.write('<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Outfit:wght@100..900&display=swap" rel="stylesheet">');

document.write('<script src="/js/jquery.3.6.4.min.js"></script>');

/*--------------------------------------------------------------------------------------
지존소프트
--------------------------------------------------------------------------------------*/
// gzone_utils part..
document.write(
  '<script src="/gzon/comm.2.0.js?' +
    UNIQUE_STRING +
    '"></script>'
);
document.write(
  '<script src="/gzon/util.2.0.js?' +
    UNIQUE_STRING +
    '"></script>'
);
document.write(
  '<script src="/gzon/sys.2.0.js?' +
    UNIQUE_STRING +
    '"></script>'
);
document.write(
  '<script src="/gzon/user.2.0.js?' +
    UNIQUE_STRING +
    '"></script>'
);


/*--------------------------------------------------------------------------------------
퍼블리셔 제공
--------------------------------------------------------------------------------------*/
document.write(
  '<script src="/js/common.js?' +
    UNIQUE_STRING +
    '"></script>'
);


/*--------------------------------------------------------------------------------------
기타
--------------------------------------------------------------------------------------*/
/*
var path = window.location.pathname;
if (path == "/") {
	path = "index";
} else {
	//path = path.replace(".html","");
	path = path.replace("/","");
}
document.write(
  '<script src="/js/'+path+'.js?' +
    UNIQUE_STRING +
    '"></script>'
);
*/