  $(function () {

    var documento = $("#documento");
    var bo = $("#bo");
    var boc = $("#boc");
    var ip = $("#ip");
    var tipo = $("#tipo");
    var input_documento = $("#tco_documento")
    var comp = $("#comp");
    var bo_select = $("#tco_bo_id").select2();    
    var boc_select = $("#tco_boc_id").select2();    
    var inquery_select = $("#tco_inquery_id").select2();    



    documento.hide();
    tipo.hide();
    bo.hide();
    ip.hide();
    boc.hide();

    if ($("#tco_origem_convensão").is(':checked')) {
      tipo.show();
    } 
    if ($("#tco_origem_requisição").is(':checked')) {
      documento.show();
    } 

    if ($("#tco_tipo_bo").is(':checked')) {
      ip.show();
    } 

    if ($("#tco_tipo_boc").is(':checked')) {
      boc.show();

    } 

     if ($("#tco_tipo_inquerito").is(':checked')) {
      ip.show();

    } 





    $("input[name='tco[origem]']").click(function () {
      if ($("input[name='tco[origem]']:checked").val() == "CONVENSÃO"){
        documento.hide();
        input_documento.val('');
        tipo.show();
        comp.show();
      } else if ($("input[name='tco[origem]']:checked").val() == "REQUISIÇÃO") {
        documento.show();
        tipo.hide();
        comp.show();
        $("input[name='tco[tipo]'").prop('checked', false); 
        bo_select.val(null).trigger("change").parent().hide();
        boc_select.val(null).trigger("change").parent().hide();
        inquery_select.val(null).trigger("change").parent().hide();
      } 
    });


    $("input[name='tco[tipo]']").click(function () {
      if ($("input[name='tco[tipo]']:checked").val() == "BO"){

        bo.show();
        bo_select.val(null).trigger("change").parent().show();

        ip.hide();
        inquery_select.val(null).trigger("change").parent().hide();
        boc.hide();
        boc_select.val(null).trigger("change").parent().hide();  


      } else if ($("input[name='tco[tipo]']:checked").val() == "INQUERITO") {

        ip.show();
        inquery_select.val(null).trigger("change").parent().show();

        bo.hide();
        bo_select.val(null).trigger("change").parent().hide();
        boc.hide();
        boc_select.val(null).trigger("change").parent().hide();          


      } else if ($("input[name='tco[tipo]']:checked").val() == "BOC") {

        boc.show();
        boc_select.val(null).trigger("change").parent().show();    

        ip.hide();
        inquery_select.val(null).trigger("change").parent().hide();
        bo.hide();
        bo_select.val(null).trigger("change").parent().hide();  

      }
    });















  });

