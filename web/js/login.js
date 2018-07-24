/* ====================== *
 *  Toggle Between        *
 *  Sign Up / Login       *
 * ====================== */
$(document).ready(function () {
    // alert(${msg});

    var formFlag = 0;
    $('#goRight').on('click', function () {
        formFlag = 1;
        $('#slideBox').animate({
            'marginLeft': '0'
        });
        $('.topLayer').animate({
            'marginLeft': '100%'
        });
        $('#left-letter').animate({
            'left': '-70%'
        });
    });
    $('#goLeft').on('click', function () {
        formFlag = 0;
        if (window.innerWidth > 769) {
            $('#slideBox').animate({
                'marginLeft': '50%'
            });
        }
        else {
            $('#slideBox').animate({
                'marginLeft': '20%'
            });
        }
        $('.topLayer').animate({
            'marginLeft': '0'
        });
        $('#left-letter').animate({
            'left': '-360px'
        });
    });
    $('#form-signup').submit(function() {
        if (formFlag == 0)
            return false;
        else
            return true;
    });
    $('#form-login').submit(function() {
        if (formFlag != 0)
            return false;
        else
            return true;
    });


    // email username-signup

});

/* ====================== *
 *  Initiate Canvas       *
 * ====================== */
paper.install(window);
paper.setup(document.getElementById("canvas"));

// Paper JS Variables
var canvasWidth,
    canvasHeight,
    canvasMiddleX,
    canvasMiddleY;

var shapeGroup = new Group();

var positionArray = [];

function getCanvasBounds() {
    // Get current canvas size
    canvasWidth = view.size.width;
    canvasHeight = view.size.height;
    canvasMiddleX = canvasWidth / 2;
    canvasMiddleY = canvasHeight / 2;
    // Set path position
    var position1 = {
        x: (canvasMiddleX / 2) + 100,
        y: 100,
    };

    var position2 = {
        x: 200,
        y: canvasMiddleY,
    };

    var position3 = {
        x: (canvasMiddleX - 50) + (canvasMiddleX / 2),
        y: 150,
    };

    var position4 = {
        x: 0,
        y: canvasMiddleY + 100,
    };

    var position5 = {
        x: canvasWidth - 130,
        y: canvasHeight - 75,
    };

    var position6 = {
        x: canvasMiddleX + 80,
        y: canvasHeight - 50,
    };

    var position7 = {
        x: canvasWidth + 60,
        y: canvasMiddleY - 50,
    };

    var position8 = {
        x: canvasMiddleX + 100,
        y: canvasMiddleY + 100,
    };

    positionArray = [position3, position2, position5, position4, position1, position6, position7, position8];
};


/* ====================== *
 * Create Shapes          *
 * ====================== */

function changeSucceedStyle(nameID, spanID) {
	spanID.firstChild.nodeValue = "*";
	spanID.style.fontSize = "larger";
	spanID.style.color = "rgba(41,178,165,1)";
	nameID.style.borderColor = "rgba(41,178,165,1)";
};

function changeFailedStyle(nameID, spanID) {
	spanID.firstChild.nodeValue = "*";
	spanID.style.fontSize = "larger";
	spanID.style.color = "red";
	nameID.style.borderColor = "red";
};

function changeFailingStyle(nameID, spanID) {
	spanID.style.fontSize = "small";
	spanID.style.color = "red";
	nameID.style.borderColor = "red";
};

function spanValue(spanID, spanValue) {
	switch(spanValue) {
		case "usernameSpan":
			spanID.firstChild.nodeValue = "（6-16位：英文.数字.下划线）";
			break;
		case "passwordSpan":
			spanID.firstChild.nodeValue = "（6-16位：非空字符）";
			break;
		case "repasswordSpan":
			spanID.firstChild.nodeValue = "（请确认密码）";
			break;
		case "repasswordSpan1":
			spanID.firstChild.nodeValue = "（两次密码不一致）";
			break;
		case "mailboxSpan":
			spanID.firstChild.nodeValue = "(email5~6位@mail.com)";
			break;
		case "usernameAgain":
			spanID.firstChild.nodeValue = "用户名已存在！";
	}
};

function mailbox() {
	var mailbox = document.getElementById("mailbox");
	var mailboxSpan = document.getElementById("mailboxSpan");
	var pattern = /^[0-9a-zA-Z_]{5,18}@[0-9a-z]+.com$/;
	mailbox.onfocus = function() {
		if(!pattern.test(mailbox.value)) {
			spanValue(mailboxSpan, "mailboxSpan");
			changeFailingStyle(mailbox, mailboxSpan);
		}
	}
	mailbox.onkeyup = function() {
		if(pattern.test(mailbox.value)) {
			changeSucceedStyle(mailbox, mailboxSpan);
		} else {
			spanValue(mailboxSpan, "mailboxSpan");
			changeFailingStyle(mailbox, mailboxSpan);
		}
	}
	mailbox.onblur = function() {
		if(pattern.test(mailbox.value)) {
			changeSucceedStyle(mailbox, mailboxSpan);
			mailboxnum = 1;
		} else {
			changeFailedStyle(mailbox, mailboxSpan);
			mailboxnum = 0;
		}
	}
};

function username() {
	var username = document.getElementById("username");
	var usernameSpan = document.getElementById("usernameSpan");
	var pattern = /^[0-9a-zA-Z_]{6,16}$/;
	var userAgain = 0;
	username.onfocus = function() {
		if(!pattern.test(username.value)) {
			spanValue(usernameSpan, "usernameSpan");
			changeFailingStyle(username, usernameSpan);
		} else {
			if(userAgain == 0) {
				spanValue(usernameSpan, "usernameAgain");
				changeFailingStyle(username, usernameSpan);
			}
		}
	}
	username.onkeyup = function() {
		if(pattern.test(username.value)) {
			changeSucceedStyle(username, usernameSpan);
			/*if(!checkUsername(username.value + "username")) {
				spanValue(usernameSpan, "usernameAgain"); 
				changeFailingStyle(username, usernameSpan); 
				userAgain = 0; 
			} else {
				userAgain = 1; 
			}*/
		} else {
			spanValue(usernameSpan, "usernameSpan");
			changeFailingStyle(username, usernameSpan);
		}
	};
	username.onblur = function() {
		if(pattern.test(username.value) /*&& userAgain*/ ) {
			changeSucceedStyle(username, usernameSpan);
			usernamenum = 1;
		} else {
			changeFailedStyle(username, usernameSpan);
			usernamenum = 0;
		}
	}
};

function password() {
	var password = document.getElementById("password");
	var passwordSpan = document.getElementById("passwordSpan");
	var pattern = /^\S{6,16}$/;
	var repassword = document.getElementById("repassword");
	password.onfocus = function() {
		if(!pattern.test(password.value)) {
			spanValue(passwordSpan, "passwordSpan");
			changeFailingStyle(password, passwordSpan);
		}
	}
	password.onkeyup = function() {
		if(pattern.test(password.value)) {
			changeSucceedStyle(password, passwordSpan);
			if(repassword.value != "") {
				repassword.onfocus();
			}
		} else {
			spanValue(passwordSpan, "passwordSpan");
			changeFailingStyle(password, passwordSpan);
			if(repassword.value != "") {
				repassword.onfocus();
			}
		}
	}

	password.onblur = function() {
		if(repassword.value == "") {
			if(pattern.test(password.value)) {
				changeSucceedStyle(password, passwordSpan);
				passwordnum = 1;
			} else {
				changeFailedStyle(password, passwordSpan);
				passwordnum = 0;
			}
		} else {
			if(password.value != repassword.value) {
				repassword.onfocus();
				//repassword.style.borderColor = "red";
				repasswordnum = 0;
			}
		}

	}

};

function repassword() {
	var password = document.getElementById("password");
	var repassword = document.getElementById("repassword");
	var repasswordSpan = document.getElementById("repasswordSpan");

	repassword.onfocus = function() {
		if(!(password.value == repassword.value && password.value != "")) {
			spanValue(repasswordSpan, "repasswordSpan");
			changeFailingStyle(repassword, repasswordSpan);
		} else {
			changeSucceedStyle(repassword, repasswordSpan);
		}
	}
	repassword.onkeyup = function() {
		if(password.value == repassword.value && password.value != "") {
			changeSucceedStyle(repassword, repasswordSpan);
		} else {
			spanValue(repasswordSpan, "repasswordSpan1");
			changeFailingStyle(repassword, repasswordSpan);
		}
	}
	repassword.onblur = function() {
		if(password.value == repassword.value && password.value != "") {
			changeSucceedStyle(repassword, repasswordSpan);
			repasswordnum = 1;
		} else {
			spanValue(repasswordSpan, "repasswordSpan");
			changeFailedStyle(repassword, repasswordSpan);
			repasswordnum = 0;
		}
	}
};



function initializeShapes() {
    // Get Canvas Bounds
    getCanvasBounds();

    var shapePathData = [
        'M231,352l445-156L600,0L452,54L331,3L0,48L231,352',
        'M0,0l64,219L29,343l535,30L478,37l-133,4L0,0z',
        'M0,65l16,138l96,107l270-2L470,0L337,4L0,65z',
        'M333,0L0,94l64,219L29,437l570-151l-196-42L333,0',
        'M331.9,3.6l-331,45l231,304l445-156l-76-196l-148,54L331.9,3.6z',
        'M389,352l92-113l195-43l0,0l0,0L445,48l-80,1L122.7,0L0,275.2L162,297L389,352',
        'M 50 100 L 300 150 L 550 50 L 750 300 L 500 250 L 300 450 L 50 100',
        'M 700 350 L 500 350 L 700 500 L 400 400 L 200 450 L 250 350 L 100 300 L 150 50 L 350 100 L 250 150 L 450 150 L 400 50 L 550 150 L 350 250 L 650 150 L 650 50 L 700 150 L 600 250 L 750 250 L 650 300 L 700 350 '
    ];

    for (var i = 0; i <= shapePathData.length; i++) {
        // Create shape
        var headerShape = new Path({
            strokeColor: 'rgba(255, 255, 255, 0.5)',
            strokeWidth: 2,
            parent: shapeGroup,
        });
        // Set path data
        headerShape.pathData = shapePathData[i];
        headerShape.scale(2);
        // Set path position
        headerShape.position = positionArray[i];
    }
};

initializeShapes();

/* ====================== *
 * Animation              *
 * ====================== */
view.onFrame = function paperOnFrame(event) {
    if (event.count % 4 === 0) {
        // Slows down frame rate
        for (var i = 0; i < shapeGroup.children.length; i++) {
            if (i % 2 === 0) {
                shapeGroup.children[i].rotate(-0.1);
            } else {
                shapeGroup.children[i].rotate(0.1);
            }
        }
    }
};

view.onResize = function paperOnResize() {
    getCanvasBounds();

    for (var i = 0; i < shapeGroup.children.length; i++) {
        shapeGroup.children[i].position = positionArray[i];
    }

    if (canvasWidth < 700) {
        shapeGroup.children[3].opacity = 0;
        shapeGroup.children[2].opacity = 0;
        shapeGroup.children[5].opacity = 0;
    } else {
        shapeGroup.children[3].opacity = 1;
        shapeGroup.children[2].opacity = 1;
        shapeGroup.children[5].opacity = 1;
    }
};
window.onload = function() {
	username();
	password();
	repassword();
	mailbox();
};