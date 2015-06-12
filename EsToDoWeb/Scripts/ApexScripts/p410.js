$(document).ready(function () {
    setInputElementsWidth();
});

function setInputElementsWidth() {
    $("#TreatmTable input").each(function () {
       $(this).width( $(this).closest('td').width());
    });

    $("#TreatmTable select").each(function () {
        $(this).width($(this).closest('td').width());
    });
}