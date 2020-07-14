//datatable
$(document).ready(function() {
    $('#myTable').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Proyectos",
            "infoEmpty": "Mostrando 0 to 0 of 0 Proyectos",
            "infoFiltered": "(Filtrado de _MAX_ total proyectos)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Proyectos",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });

    $('#tabla_autores').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Autores",
            "infoEmpty": "Mostrando 0 to 0 of 0 Autores",
            "infoFiltered": "(Filtrado de _MAX_ total Autores)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Autores",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });

    $('#tabla_instituciones').DataTable({
        language: {
            "decimal": "",
            "emptyTable": "No hay información",
            "info": "Mostrando _START_ a _END_ de _TOTAL_ Instituciones",
            "infoEmpty": "Mostrando 0 to 0 of 0 Instituciones",
            "infoFiltered": "(Filtrado de _MAX_ total Instituciones)",
            "infoPostFix": "",
            "thousands": ",",
            "lengthMenu": "Mostrar _MENU_ Instituciones",
            "loadingRecords": "Cargando...",
            "processing": "Procesando...",
            "search": "Buscar:",
            "zeroRecords": "Sin resultados encontrados",
            "paginate": {
                "first": "Primero",
                "last": "Ultimo",
                "next": "Siguiente",
                "previous": "Anterior"
            }
        }
    });

});

/*para mostrar mensajes en caso de que al iniciar sesion como administrador ocurran errores o no esten los datos correctamente*/
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


/*Mostrar mensajes cuando al iniciar sesion*/
try{
    var p = document.getElementById("message");
    var mensaje = p.innerHTML;
    if(mensaje.length > 0) toastr.error(mensaje);
}catch(err){
    console.log(err);
}

try{
    var p2 = document.getElementById("success");
    var success = p2.innerHTML;
    if(success.length > 0) toastr.success(success)

}catch(err){
    console.log(err);
}


$(document).ready(function() {
    'use strict';

    /***********************************************************
     * FLEXSLIDER
     ***********************************************************/
    $('.flexslider').flexslider({
        animation: "slide",
        controlNav: "thumbnails"
    });

    /***********************************************************
     * BXSLIDER
     ***********************************************************/
    $('.bxslider').bxSlider({
        minSlides: 1,
        maxSlides: 6,
        slideWidth: 170,
        slideMargin: 30,
        responsive: false
    });

    /***********************************************************
     * ACCORDION
     ***********************************************************/
    $('.panel-heading a[data-toggle="collapse"]').on('click', function() {
        if ($(this).closest('.panel-heading').hasClass('active')) {
            $(this).closest('.panel-heading').removeClass('active');
        } else {
            $('.panel-heading a[data-toggle="collapse"]').closest('.panel-heading').removeClass('active');
            $(this).closest('.panel-heading').addClass('active');
        }
    });


});

