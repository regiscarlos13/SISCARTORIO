  $(function () {

    var documento = $("#documento");
    var bo = $("#bo");
    var tco = $("#tco");
    var ip = $("#ip");
    var tipo = $("#tipo");
    var input_documento = $("#boc_documento")
    var comp = $("#comp");
    var bo_select = $("#boc_bo_id").select2();    
    var tco_select = $("#boc_tco_id").select2();    
    var inquery_select = $("#boc_inquery_id").select2();    



    documento.hide();
    tipo.hide();
    bo.hide();
    ip.hide();
    tco.hide();

    if ($("#boc_origem_convensão").is(':checked')) {
      tipo.show();
    } 
    if ($("#boc_origem_requisição").is(':checked')) {
      documento.show();
    } 

    if ($("#boc_tipo_bo").is(':checked')) {
      ip.show();
    } 

    if ($("#boc_tipo_boc").is(':checked')) {
      boc.show();

    } 

     if ($("#boc_tipo_inquerito").is(':checked')) {
      ip.show();

    } 



    $("input[name='boc[origem]']").click(function () {
      if ($("input[name='boc[origem]']:checked").val() == "CONVENSÃO"){
        documento.hide();
        input_documento.val('');
        tipo.show();
        comp.show();
      } else if ($("input[name='boc[origem]']:checked").val() == "REQUISIÇÃO") {
        documento.show();
        tipo.hide();
        comp.show();
        $("input[name='boc[tipo]'").prop('checked', false); 
        bo_select.val(null).trigger("change").parent().hide();
        boc_select.val(null).trigger("change").parent().hide();
        inquery_select.val(null).trigger("change").parent().hide();
      } 
    });


    $("input[name='boc[tipo]']").click(function () {
      if ($("input[name='boc[tipo]']:checked").val() == "BO"){

        bo.show();
        bo_select.val(null).trigger("change").parent().show();

        ip.hide();
        inquery_select.val(null).trigger("change").parent().hide();
        boc.hide();
        boc_select.val(null).trigger("change").parent().hide();  


      } else if ($("input[name='boc[tipo]']:checked").val() == "INQUERITO") {

        ip.show();
        inquery_select.val(null).trigger("change").parent().show();

        bo.hide();
        bo_select.val(null).trigger("change").parent().hide();
        boc.hide();
        boc_select.val(null).trigger("change").parent().hide();          


      } else if ($("input[name='boc[tipo]']:checked").val() == "boc") {

        boc.show();
        boc_select.val(null).trigger("change").parent().show();    

        ip.hide();
        inquery_select.val(null).trigger("change").parent().hide();
        bo.hide();
        bo_select.val(null).trigger("change").parent().hide();  

      }
    });
  });