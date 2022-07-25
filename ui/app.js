$(document).ready(function(){

    function display(bool) {
        if (bool) {
            $('#container').show();
        } else {
            $('#container').hide();
        }
    }
    display(false)


	$('#closePedSpawner').click(function(){
        $.post('http://damx_pedset', JSON.stringify({}));
    })
 

    // ESEMÉNY FIGYELÉS 
    window.addEventListener('message', function(e){
        let item = e.data;

        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = function(data) {
        if (data.which == 27) {
            $.post('http://damx_pedset/exit', JSON.stringify({}));
            return
        }
    }

    window.onload = function getPeds() {
        let htmlTemplate = ``
        
        fetch('peds.json')
            .then(response => response.json())
            .then(json => $('#pedList').innerHTML = json )
    }



})





