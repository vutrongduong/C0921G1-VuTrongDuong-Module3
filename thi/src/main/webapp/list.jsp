<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="css/list.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-lg-6">
                    <h2>Danh sách <b>bệnh án</b></h2>
                </div>
                <div class="col-lg-6">
                    <a href="/benhAn?action=add" class="btn btn-success add-new" data-toggle="modal"><i
                            class="material-icons">&#xE147;</i>
                        <span>Thêm bệnh án</span></a>
                </div>
            </div>
        </div>
        <table id="table" class="table table-striped table-bordered" style="width: 100%">
            <thead>
            <tr>
                <th>STT</th>
                <th>Mã bệnh án</th>
                <th>Mã bệnh nhân</th>
                <th>Tên bệnh nhân</th>
                <th>Ngày nhập viện</th>
                <th>Ngày ra viện</th>
                <th>Lý do nhập viện</th>
                <th>Tác vụ</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="benhAn" items="${benhAnList}" varStatus="count">
                <td>${count.count}</td>
                <td><c:out value="${benhAn.id}"/></td>
                <td><c:out value="${benhAn.benhNhan.id}"/></td>
                <td><c:out value="${benhAn.benhNhan.ten}"/></td>
                <td><c:out value="${benhAn.ngayNhapVien}"/></td>
                <td><c:out value="${benhAn.ngayRaVien}"/></td>
                <td><c:out value="${benhAn. lyDo}"/></td>
                <td>
                    <a href="/benhAn?action=edit&benhAnId=${benhAn.id}" class="edit" title="Edit"
                       data-toggle="tooltip">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd"
                                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </a>
                    <a href="#deleteCustomerModal${benhAn.id}" data-bs-toggle="modal" title="Delete"
                       data-bs-target="#deleteCustomerModal${benhAn.id}" class="delete">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1H2.5zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zM8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5zm3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0z"/>
                        </svg>
                    </a>
                </td>
                </tr>
                <div class="modal fade" id="deleteCustomerModal${benhAn.id}" tabindex="-1"
                     aria-labelledby="exampleModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn có muốn xóa thông tin bệnh án <span class="text-warning">${benhAn.id}</span> hay không</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <a class="btn btn-danger" href="/benhAn?action=delete&benhAnId=${benhAn.id}">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<script src="../jquery/jquery-3.5.1.min.js"></script>
<script src="../datatables/js/jquery.dataTables.min.js"></script>
<script src="../datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#table').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>