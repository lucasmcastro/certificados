if ($("#dataTable").length > 0) {
  function add_import_table(imported_attributes, certifiable_end_index) {
    $('document').ready(function () {
      $("#dataTable").handsontable({
        rows: 1,
        cols: imported_attributes.length,
        minSpareCols: 1,
        minSpareRows: 1,
        colHeaders: imported_attributes
      });
      var data = [];
      $("#dataTable").handsontable("loadData", data);
      $("button.submit").on('click', function () {
        setTimeout(function () {
          // Timeout is needed because Handsontable normally deselects
          // current cell when you click outside the table
          // get pasted data
          var dados = $("#dataTable").handsontable('getDataReference');
          var NUM_LINES = dados.length-1; // Remove Spare Row
          // Fill forms with aquired data
          for(var i=0;i<NUM_LINES;i++){
            for(var j=0;j<imported_attributes.length;j++){
              if(j <= certifiable_end_index) {
                $("#import_data").append("<input type='hidden' value='"+dados[i][j]+"' name='certifiable_attributes[]["+imported_attributes[j]+"]' />");
              } else {
                $("#import_data").append("<input type='hidden' value='"+dados[i][j]+"' name='certifiable_attributes[][certificate_attributes]["+imported_attributes[j]+"]' />");
              }
            }
          }
          $("#import_data").submit();
        }, 10);
      });
    });
  }

  var attr = $("#dataTable").data('attributes').split(",");
  var end = $("#dataTable").data('end');
  add_import_table(attr, end);
}

