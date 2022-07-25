$(document).ready(function(){

    function display(bool) {
        if (bool) {
            $('#container').show();
        } else {
            $('#container').hide();
        }
    }
    display(false)

    // ESEMÉNY FIGYELÉS 
    window.addEventListener('message', function(e){
        let data = e.data;

        if (data.type === "ui") {
            if (data.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })

    document.onkeyup = (data) => {
        if (data.keyCode == "Escape") {
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





