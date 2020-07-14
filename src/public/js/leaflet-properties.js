var markers = new Array();

try {
    /* configurando el mapa */
    var mymap = L.map('map').setView([7.899045, -72.488951], 14);

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        accessToken: 'pk.eyJ1IjoiY3Jpc2VsYXlhbGE5OCIsImEiOiJjazNvdnJ4aWUwOGdhM2RuZW1vdHFqa25nIn0.srjy6MW-S3nWJhNWPPNMzQ'
    }).addTo(mymap);
} catch (err) {
    console.log(err);
}

var greenIcon = L.icon({
    iconUrl: 'https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678111-map-marker-512.png',

    iconSize: [38, 38] // size of the icon
});



/* consultar proyectos en el mapa */

$('#query').click(function(event) {
    event.preventDefault();

    $.ajax({
        data: $("#consultar_proyectos").serialize(),
        url: '/consultar_geo_proyectos',
        type: 'POST'
    })
    .done(function(result) {
        //configurar el anuncio

        toastr.options.closeButton = true;
        toastr.options.debug = false;
        toastr.options.newestOnTop = true;
        toastr.options.progressBar = true;
        toastr.options.positionClass = "toast-bottom-center";
        toastr.options.preventDuplicates = false;
        toastr.options.onclick = null;
        toastr.options.showDuration = "300";
        toastr.options.hideDuration = "1000";
        toastr.options.timeOut = "5000";
        toastr.options.extendedTimeOut = "1000";
        toastr.options.showEasing = "swing";
        toastr.options.hideEasing = "linear";
        toastr.options.showMethod = "fadeIn";
        toastr.options.hideMethod = "fadeOut";


        toastr.error('Se encontraron ' + result.proyectos.length + ' resultados.');
        var i;
        /*eliminando markers antiguos*/
        for(i = 0; i<markers.length; i++){
            mymap.removeLayer(markers[i]);
        }

        /*agregar markers al mapita*/
        for (i = 0; i < result.proyectos.length; i++) {

            var texto = '<strong>PROYECTO: </strong><a href="/' + result.proyectos[i].codigo_proyecto + '/ver_detalle">' + '<p>' + result.proyectos[i].nombre_proyecto + '</p>' + '</a>';
            if(result.proyectos[i].programa_académico != '--' && result.proyectos[i].programa_académico != undefined){
                texto+= '<br><strong>Programa académico: </strong>' + result.proyectos[i].programa_académico;
            }

            if(result.proyectos[i].grupo_investigacion != '--' && result.proyectos[i].grupo_investigacion != undefined){
                texto+= '<br><strong>Programa académico: </strong>' + result.proyectos[i].grupo_investigacion;
            }

            texto+= '<br><strong>Año: </strong>' + result.proyectos[i].year + '<br><strong>Estado: </strong>'+ result.proyectos[i].estado;

            texto+= '<br><strong>Descripción de la ubicación</strong>: ' + result.proyectos[i].geo_descripcion;
            var m = L.marker([result.proyectos[i].latitud, result.proyectos[i].longitud], { icon: greenIcon }).addTo(mymap).bindPopup(texto);
            markers.push(m);
        }
    });

});