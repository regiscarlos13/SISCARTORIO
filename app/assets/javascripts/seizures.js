$(function () {

    var inquerity = $("#seizure_inquery_id").select2();
    var boc = $("#seizure_boc_id").select2();
    var tco = $("#seizure_tco_id").select2();
    var bo = $("#seizure_bo_id").select2();



    $("input[name='seizure[procedimento]']").click(function () {
      if ($("input[name='seizure[procedimento]']:checked").val() == "IP"){

        inquerity.parent().show();
        tco.val(null).trigger("change").parent().hide();
        boc.val(null).trigger("change").parent().hide();
        bo.val(null).trigger("change").parent().hide();
        } else if ($("input[name='seizure[procedimento]']:checked").val() == "Tco") {

            tco.parent().show();
            inquerity.val(null).trigger("change").parent().hide();
            bo.val(null).trigger("change").parent().hide();
            boc.val(null).trigger("change").parent().hide();


        } else if ($("input[name='seizure[procedimento]']:checked").val() == "Boc") {

            boc.parent().show();
            inquerity.val(null).trigger("change").parent().hide();
            bo.val(null).trigger("change").parent().hide();
            tco.val(null).trigger("change").parent().hide();


        } else if ($("input[name='seizure[procedimento]']:checked").val() == "Bo") {

            bo.parent().show();
            inquerity.val(null).trigger("change").parent().hide();
            tco.val(null).trigger("change").parent().hide();
            boc.val(null).trigger("change").parent().hide();

        }

    });

    if ($("#seizure_veiculo").is(':checked')) {
        $("#veiculos").show();
    } else  {
        $("#veiculos").hide();

    } 

    $("#seizure_veiculo").change(function() {
      if ($("#seizure_veiculo").is(':checked')) {
        $("#veiculos").show();

    } else {

        $("#veiculos").hide();
        $('#seizure_chassi').val('');
        $('#seizure_placa').val('');
        $('#seizure_tipo_veiculo').val(null).trigger("change");
        $('#seizure_cor').val(null).trigger("change");
    }
    });

    if ($("#seizure_procedimento_ip").is(':checked')) {
        inquerity.parent().show();
        tco.val(null).trigger("change").parent().hide();
        boc.val(null).trigger("change").parent().hide();
        bo.val(null).trigger("change").parent().hide();
      } else  if ($("#seizure_procedimento_tco").is(':checked')) {
        tco.parent().show();
        inquerity.val(null).trigger("change").parent().hide();
        boc.val(null).trigger("change").parent().hide();
        bo.val(null).trigger("change").parent().hide();
      } else  if ($("#seizure_procedimento_boc").is(':checked')) {
        boc.parent().show();
        inquerity.val(null).trigger("change").parent().hide();
        tco.val(null).trigger("change").parent().hide();
        bo.val(null).trigger("change").parent().hide(); 
    } else  if ($("#seizure_procedimento_bo").is(':checked')) {
        bo.parent().show();
        inquerity.val(null).trigger("change").parent().hide();
        tco.val(null).trigger("change").parent().hide();
        boc.val(null).trigger("change").parent().hide(); 
    }



});
