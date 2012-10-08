$('document').ready(function () {
  $("#dataTable").handsontable({
    rows: 1,
    cols: 6,
    minSpareCols: 1,
    minSpareRows: 1,
    colHeaders: ['name','email','phone','resume','lecture','event']
  });
  var data = [];
  $("#dataTable").handsontable("loadData", data);

  $("button.submit").on('click', function () {
    setTimeout(function () {
      //timeout is needed because Handsontable normally deselects
      //current cell when you click outside the table
      //get pasted data
      dados = $("#dataTable").handsontable('getDataReference');
      column_order = ['name','email','phone','resume','lecture','event']
      //define loop ranges
      LECTURE_INDEX_END = 3;
      NUM_COLUMNS = 6;
      NUM_LINES = dados.length-1;
      //fill forms with pasted data
      for(i=0;i<NUM_LINES;i++){
        for(j=0;j<NUM_COLUMNS;j++){
          if(j <= LECTURE_INDEX_END) {
            $("#import_data").append("<input type='hidden' value='"+dados[i][j]+"' name='lecturers_attributes[]["+column_order[j]+"]' />");
          } else {
            $("#import_data").append("<input type='hidden' value='"+dados[i][j]+"' name='lecturers_attributes[][certificate_attributes]["+column_order[j]+"]' />");
          }
        }
      }
      $("#import_data").submit();
    }, 10);
  });
});
