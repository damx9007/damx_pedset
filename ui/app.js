$(document).ready(function(){

    function getPedsFromRageMP(){
        $.post('https://wiki.rage.mp/index.php?title=Peds', {url : url}, function(pedData) {
            document.getElementById('#pedList').innerHTML = pedData;
        })
    }

    function display(bool) {
        if (bool) {
            $('#container').show();
        } else {
            $('#container').hide();
        }
    }


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
        if (data.key == "Escape") {
            $.post('http://damx_pedset/exit', JSON.stringify({}));
            return
        }
    }






})





