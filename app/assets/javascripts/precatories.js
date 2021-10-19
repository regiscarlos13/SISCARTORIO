  $(function () {
    var data_cumprida = $("#precatory_conclusion_date");

    data_cumprida.hide()
    $('.add_fields').show()

    if ($("#precatory_conclusion").is(':checked')) {
    data_cumprida.show();
    $('.add_fields').hide();
    } else {
      data_cumprida.hide();
    $('.add_fields').show();
    } 

    $("#precatory_conclusion").change(function() {
      if ($("#precatory_conclusion").is(':checked')) {
       data_cumprida.show();
    $('.add_fields').hide();
     } else {
      $('.add_fields').show();
      data_cumprida.hide();
      data_cumprida.val('');
    }
  });
  });
