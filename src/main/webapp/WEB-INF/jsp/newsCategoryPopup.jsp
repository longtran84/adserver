<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="modal fade" id="modal-choose-category">
    <div class="modal-dialog" style="width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Chọn chuyên mục</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="categoriesTable" class="table table-bordered table-hover dataTable" role="grid">
                        <!-- Header Table -->
                        <thead>
                        <tr>
                            <th>Mã chuyên mục</th>
                            <th>Tên chuyên mục</th>
                            <th>Ảnh</th>
                            <th>Trạng thái</th>
                            <th>Lựa chọn</th>
                        </tr>
                        </thead>
                        <!-- Footer Table -->
                        <tfoot>
                        <tr>
                            <th>Mã chuyên mục</th>
                            <th>Tên chuyên mục</th>
                            <th>Ảnh</th>
                            <th>Trạng thái</th>
                            <th>Lựa chọn</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Đóng</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>