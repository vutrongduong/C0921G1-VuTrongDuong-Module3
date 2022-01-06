<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/edit.css">
</head>
<body>
<form method="post">
    <div class="container mt-5 mb-5 d-flex justify-content-center">
        <div class="col-md-5 pr-lg-5 ms-5 mb-md-0">
            <img src="https://bootstrapious.com/i/snippets/sn-registeration/illustration.svg" alt=""
                 class="img-fluid mb-3 d-none d-md-block">
        </div>
        <div class="card px-1 py-4">
            <div class="card-body">
                <div>
                    <h3>Sửa thông tin bệnh án</h3>
                    <h5 style="color: red">${thongBao}</h5>
                    <h6 style="color: #41cba9">${troVe}</h6>
                </div>
                <input type="hidden" name="id" value="${idBenhNhan}">
                <input type="hidden" name="idBenhAn" value="${benhAn.id}">
                <div class="row form-group">
                    <label class="col-form-label col-4">Mã bệnh án</label>
                    <div class="col-8 mt-2">
                        <input readonly class="form-control" name="idTemp" type="text" value="${idBenhAn}">
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-form-label col-4">Mã bệnh nhân</label>
                    <div class="col-8 mt-2">
                        <input readonly class="form-control" name="idBenhNhan" type="text"
                               value="${benhAn.benhNhan.id}">
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-form-label col-4">Tên bệnh nhân</label>
                    <div class="col-8 mt-2">
                        <input class="form-control" name="ten" type="text" value="${benhAn.benhNhan.ten}">
                        <p style="color:red;">${ten}</p>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-form-label col-4">Ngày nhập viện</label>
                    <div class="col-8 mt-2">
                        <input class="form-control" name="ngayNhapVien" type="date" value="${benhAn.ngayNhapVien}">
                        <p style="color:red;">${ngay}</p>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-form-label col-4">Ngày ra viện</label>
                    <div class="col-8 mt-2">
                        <input class="form-control" name="ngayRaVien" type="date" value="${benhAn.ngayRaVien}">
                        <p style="color:red;">${ngay}</p>
                    </div>
                </div>
                <div class="row form-group">
                    <label class="col-form-label col-4">Lý do nhập viện</label>
                    <div class="col-8 mt-2">
                        <input class="form-control" name="lyDo" type="text" value="${benhAn.lyDo}">
                        <p style="color:red;">${lyDo}</p>
                    </div>
                </div>
                <div class="row form-group mt-lg-3">
                    <div class="col-lg-3"><a class="btn btn btn-warning btn-block confirm-button" data-bs-toggle="modal"
                                             data-bs-target="#staticBackdrop">Trở
                        về</a>
                        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                             tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Xác nhận</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Bạn chắc chắn muốn trở về danh sách
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Không
                                        </button>
                                        <a type="button" href="/benhAn" class="btn btn-primary">Có</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 ">
                        <button type="submit" class="btn btn btn-success btn-block confirm-button">Sửa</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="container-fluid">
        <
    </div>
</form>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>