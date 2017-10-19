$(document).ready( function () {
    moment.locale('vi');
    var publishDate = $('#publishDate').text();
    var publishDateFormat = moment(publishDate).format('dddd, DD/MM/YYYY | HH:mm');
    var firstChar = publishDateFormat.substring( 0, 1 );
    firstChar = firstChar.toUpperCase();
    var tail = publishDateFormat.substring( 1 );
    publishDateFormat = firstChar + tail;
    $('#publishDate').text(publishDateFormat);
});