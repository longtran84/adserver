<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<div class="modal fade" id="modal-choose-advertiser">
    <div class="modal-dialog" style="width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Chọn nhà quảng cáo</h4>
            </div>
            <div class="modal-body">
                <div class="table-responsive">
                    <table id="advertisersTable" class="table table-bordered table-hover dataTable" width="100%">
                        <!-- Header Table -->
                        <thead>
                        <tr>
                            <th>Email</th>
                            <th>Họ tên</th>
                            <th>Tên công ty</th>
                            <th>Điện thoại</th>
                            <th>Lựa chọn</th>
                        </tr>
                        </thead>
                        <!-- Footer Table -->
                        <tfoot>
                        <tr>
                            <th>Email</th>
                            <th>Họ tên</th>
                            <th>Tên công ty</th>
                            <th>Điện thoại</th>
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