  $(function () {
    
    var data_relatorio = $("#inquery_reported_date");
    var indiciado = $("#indiciado");
    var origem = $("#origem");
    var tipo = $("#tipo");
    var documento = $("#documento");
    var comp = $("#comp");
    var comp1 = $("#comp1");
    var bo = $("#bo");
    var boc = $("#boc");
    var tco = $("#tco");
    var bo_select = $("#inquery_bo_id").select2();    
    var boc_select = $("#inquery_boc_id").select2();    
    var tco_select = $("#inquery_tco_id").select2();    


    data_relatorio.hide();
    indiciado.hide();
    origem.hide();
    tipo.hide();
    documento.hide();
    comp.hide();
    comp1.hide();
    bo.hide();
    tco.hide();
    boc.hide();



    if ($("#inquery_tp_portaria").is(':checked')) {

      origem.show();
      tipo.show();
      documento.show();
    } else  {

      origem.hide();
      tipo.hide();
      documento.hide();
    } 


    if ($("#inquery_origem_convensão").is(':checked')) {

      tipo.show();
    } else  {
      tipo.hide();
    } 

     if ($("#inquery_tipo_bo").is(':checked')) {
      bo.show();
      documento.hide();
    } else  {
      bo.hide();
    } 

     if ($("#inquery_tipo_boc").is(':checked')) {
      boc.show();
      documento.hide();
    } else  {
      boc.hide();
    } 
    if ($("#inquery_tipo_tco").is(':checked')) {
      tco.show();
      documento.hide();
    } else  {
      tco.hide();
    } 





    $("input[name='inquery[tp]']").click(function () {
      if ($("input[name='inquery[tp]']:checked").val() == "PORTARIA"){

        origem.show();
        comp.show();
        comp1.show();


      } else if ($("input[name='inquery[tp]']:checked").val() == "FLAGRANTE") {

       origem.hide();
       tipo.hide();
       documento.hide();
       comp.hide();
       comp1.hide();
       tco.hide();
       boc.hide();
       bo.hide();

       $("#inquery_documento").val('');
       $("input[name='inquery[tipo]'").prop('checked', false); 
       $("input[name='inquery[origem]'").prop('checked', false); 
       bo_select.val(null).trigger("change").parent().hide();

     } 
   });


    $("input[name='inquery[origem]']").click(function () {
      if ($("input[name='inquery[origem]']:checked").val() == "CONVENSÃO"){

       tipo.show();
       comp.show();
       comp1.hide();
       documento.hide();
       tco.hide();
       boc.hide();
       bo.hide();


      } else if ($("input[name='inquery[origem]']:checked").val() == "REQUISIÇÃO") {

       $("input[name='inquery[tipo]'").prop('checked', false); 
        tipo.hide();
        documento.show();
        comp.show();
        comp1.hide();
        tco.hide();
        boc.hide();
        bo.hide();



     } 
   });


    $("input[name='inquery[tipo]']").click(function () {
      if ($("input[name='inquery[tipo]']:checked").val() == "BO"){

        comp1.hide();
        comp.hide();
        bo.show();
        tco_select.val(null).trigger("change").parent().hide();
        boc_select.val(null).trigger("change").parent().hide();
        bo_select.val(null).trigger("change").parent().show();
        tco.hide();
        boc.hide();
        

      } else if ($("input[name='inquery[tipo]']:checked").val() == "TCO") {

        comp1.hide();
        comp.hide();
        tco.show();
        boc.hide();
        bo.hide();

        bo_select.val(null).trigger("change").parent().hide();
        boc_select.val(null).trigger("change").parent().hide();
        tco_select.val(null).trigger("change").parent().show();

     } else if ($("input[name='inquery[tipo]']:checked").val() == "BOC") {

        comp1.hide();
        comp.hide();
        tco.hide();
        boc.show();
        bo.hide();
        bo_select.val(null).trigger("change").parent().hide();
        tco_select.val(null).trigger("change").parent().hide();
        boc_select.val(null).trigger("change").parent().show();

     }
   });










    if ($("#inquery_reported").is(':checked')) {
      data_relatorio.show();
      indiciado.show();

    } else {
      data_relatorio.hide();
      indiciado.hide();

    } 

    $("#inquery_reported").change(function() {
      if ($("#inquery_reported").is(':checked')) {
       data_relatorio.show();
       indiciado.show();

     } else {
      data_relatorio.hide();
      data_relatorio.val('');
      indiciado.hide();
      $("input[name='inquery[indiciado]'").prop('checked', false); 


    }
  });
  });
