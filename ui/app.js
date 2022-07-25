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
		
		if (display) {
			getPEDS()
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
	
	
    function getPEDS () {
		const peds = $.getJSON('peds.json', function(data) {
			var p = [];
			
			$.each(data, function(key, val) {
				p.push('<li id='+ key + '>'+ val +'</li>');
			});
			
			$("<ul/>", {
				"class" : "list",
				html : p.join( "" )
			}).appendTo( "#pedList" );
		
		});
	

		
    }


})





