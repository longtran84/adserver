$(document).ready( function () {
	 var table = $('#usersTable').DataTable({
			sAjaxSource: "/users",
			sAjaxDataProp: "",
			order: [[ 0, "asc" ]],
         columns: [
             { data: "id" },
             { data: "username" },
             {
                 data: null,
                 className: "center",
                 defaultContent: '<a href="" class="editor_edit">Edit</a> / <a href="" class="editor_remove">Delete</a>'
             }
         ]
	 });
    // Edit record
    $('#usersTable tbody').on( 'click', 'a.editor_edit', function (e) {
        e.preventDefault();
        var data = table.row( $(this).parents('tr') ).data();
        alert( data.id +"'s salary is: "+ data.username );

    } );

    // Delete a record
    $('#usersTable tbody').on( 'click', 'a.editor_remove', function (e) {
        e.preventDefault();


    } );
});