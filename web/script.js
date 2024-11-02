let data = {
    [1] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [2] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [3] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [4] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [5] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [6] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [7] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [8] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [9] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [10] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [11] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [12] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [13] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [14] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
    [15] : {
        "title": "Dear Book!",
        "content": "Write Something"
    },
}

currentPage = 1;
noteBookOpen = false;
window.addEventListener('message', function(event) {
    ed = event.data;
    if (ed.action === "openNotebook") {
        noteBookOpen = true;
        document.getElementById("body").style.display = "block";
        data = ed.data;
        $('#header-'+currentPage).val(data[currentPage].title);
        $('#text-'+currentPage).val(data[currentPage].content);
        $('#header-'+parseInt(currentPage+1)).val(data[currentPage+1].title);
        $('#text-'+parseInt(currentPage+1)).val(data[currentPage+1].content);
        document.getElementById("nheader").value = ed.mdata.title;
        document.getElementById("ndesc").value = ed.mdata.description;
	}
	document.onkeyup = function(data2) {
		if (data2.which == 27 && noteBookOpen) {
            noteBookOpen = false;
            document.getElementById("body").style.display = "none";
			var xhr = new XMLHttpRequest();
			xhr.open("POST", `https://${GetParentResourceName()}/callback`, true);
			xhr.setRequestHeader('Content-Type', 'application/json');
			xhr.send(JSON.stringify({action: "nuiFocus", metadata: data, nheader: document.getElementById("nheader").value, ndesc: document.getElementById("ndesc").value}));
		}
	}
});

$(document).ready(function(){
  


    $(document).keydown(function(event){
        // if(event.key === "Enter") {

            data[currentPage].title = $('#header-'+currentPage).val();
            data[currentPage].content = $('#text-'+currentPage).val();

            data[currentPage+1].title = $('#header-'+Number(currentPage+1)).val();
            data[currentPage+1].content = $('#text-'+parseInt(currentPage+1)).val();

        // }
    });
});

$(document).on('click', '.button', function (e) {
    $('.book').fadeOut(100);
    $('.papers').fadeIn(100);
})

$(document).on('click', '.next-text', function (e) {
    currentText = $('.pagetwo').text();
    currentPage = currentText.split('/')[0];
    currentPage = parseInt(currentPage);
    if(currentPage+1 < 15) {
        $('.pageone').text(parseInt(currentPage) + 1 + '/15');
        $('.pagetwo').text(parseInt(currentPage+1) + 1 + '/15');
    }else{
        $('.pageone').text('14/15');
        $('.pagetwo').text('15/15');
        currentPage = 14
        return
    }
    currentPage += 1;

    update(currentPage);
})  

$(document).on('click', '.back-text', function (e) {
    currentText = $('.page-number').text();
    currentPage = currentText.split('/')[0];
    currentPage = parseInt(currentPage);
    if(currentPage > 1) {
        currentPage -= 1;
        $('.pageone').text(parseInt(currentPage)  + '/15');
        $('.pagetwo').text(parseInt(currentPage+1)   + '/15');        
        update(currentPage);
    }else{
        $('.pageone').text('1/15');
        $('.pagetwo').text('2/15');
        currentPage = 1
        return
    }
})

function update(page) {

    $('.one-1').attr('id', "header-"+parseInt(page));
    $('.one-2').attr('id', "text-"+parseInt(page));

    $('.two-1').attr('id', "header-"+parseInt(page+1));
    $('.two-2').attr('id', "text-"+parseInt(page+1));

    $('#header-'+page).val(data[page].title);
    $('#text-'+page).val(data[page].content);

    $('#header-'+parseInt(page+1)).val(data[page+1].title);
    $('#text-'+parseInt(page+1)).val(data[page+1].content);


    data[page].title = $('#header-'+page).val();
    data[page].content = $('#text-'+page).val();

    data[page+1].title = $('#header-'+parseInt(page+1)).val();
    data[page+1].content = $('#text-'+parseInt(page+1)).val();

}