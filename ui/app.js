$(document).ready(function(){

    function display(bool) {
        if (bool) {
            $('#container').show();
        } else {
            $('#container').hide();
        }
    }
    display(true)


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
        if (data.keyCode == 27) {
            $.post('https://damx_pedset/exit', JSON.stringify({}));
            return
        }
    }
	
	$('#closePedSpawner').click(function(){
		$.post('https://damx_pedset/exit', JSON.stringify({}));
	})

    
        var pedListTemplate = '';
        
        for(var ped of peds){
            pedListTemplate = pedListTemplate + `
                <div class='card'>
                    <div class='card-header text-center' style="font-size:12px; font-weight: bold">${ped.model}</div>
                    <div class='card-body text-center d-flex flex-column justify-content-between'>
                        <img class='image-responsive img-thumbnail' style='height:50%' src='https://docs.fivem.net/peds/${ped.model}.webp' alt='${ped.hash}'>
                        <button class='btn btn-primary' id="setPed" data-model="${ped.model}">Ped Beállítása</button>
                    </div>

                </div>
            `;

        }


        console.log(pedListTemplate);

        $('#contain').html(pedListTemplate);

})





