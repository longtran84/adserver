$(document).ready( function () {
    $('#avatarFileBtn').on('click', function(e){
        e.preventDefault();
        $('#avatarFile').click();
    });

    var readURL = function(files) {
        if (files && files[0]) {
            var _URL = window.URL || window.webkitURL;
            img = new Image();
            img.src = _URL.createObjectURL(files[0]);
            img.onload = function() {
                /*var validSizes = ['320x50','480x32','320x100','468x60','728x90','300x250','320x480','480x320'];
                var size = this.width + "x" +  this.height;
                if ($.inArray(size, validSizes) == -1) {
                    $('#modal-file-error').modal();
                    return;
                }*/
                $('#avatarPreview').attr('width', this.width + 'px');
                $('#avatarPreview').attr('height', this.height + 'px');
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#avatarPreview').attr('src', e.target.result);
                }

                reader.readAsDataURL(files[0]);
            }
        }
    }

    $('#avatarFile').on('change', function () {
        var files = this.files;
        if (!files.length) {
            return;
        }
        var validExtensions = ['jpg','png','gif'];
        var fileName = files[0].name;
        var fileNameExt = fileName.substr(fileName.lastIndexOf('.') + 1).toLowerCase();
        if (($.inArray(fileNameExt, validExtensions) == -1) || (this.files[0].size/1024 > 150)) {
            $('#modal-file-error').modal();
            return;
        }
        readURL(files);
        $('#imageName').val(fileName);
    });
});