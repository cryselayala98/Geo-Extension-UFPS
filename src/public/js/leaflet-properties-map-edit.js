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


/* evento agregar marcadores a un mapa */

mymap.on('contextmenu', function(e) {

    var site = prompt("Digite una descripción del sitio", "Cúcuta");
    var URLactual = window.location.pathname;
    var arr = URLactual.split('/');
    //console.log(arr);

    $.ajax({
            url: '/links/' + arr[2] + '/agregar_georreferencia/' + e.latlng.lat + '/' + e.latlng.lng + '/' + site,
            type: 'GET'
        })
        .done(function(result) {
            console.log("result");
            var nueva_ubicacion = L.marker([e.latlng.lat, e.latlng.lng], {
                    title: site,
                    draggable: true,
                    icon: greenIcon
                }).bindPopup("<i>" + site + "</i>")
                .addTo(mymap);
        });

});


/* cargar todas las ubicaciones relacionadas a un proyecto en especifico tomando como parametro el valor del 
 del id_proyecto en el formulario de editar_proyecto*/
$(document).ready(function() {

var URLactual = window.location.pathname;
var arr = URLactual.split('/');
const id_project = arr[2]; //id_project

//console.log(id_project);
$.ajax({
        url: '/'+ id_project + '/search_geo',
        type: 'GET' 
    })
    .done(function(result) {
          
        var i;
        for (i = 0; i < result.geo_ref.length; i++) {
            /* agregar marcador */
            //console.log(result.geo_ref[i].latitud + " " + result.geo_ref[i].longitud);
            var m = L.marker([result.geo_ref[i].latitud, result.geo_ref[i].longitud], { 
                title: result.geo_ref[i].descripcion,
                draggable: true,
                icon: greenIcon
            }).bindPopup("<i>" + result.geo_ref[i].descripcion + "</i>")
            .addTo(mymap);   
        }
     });

});

