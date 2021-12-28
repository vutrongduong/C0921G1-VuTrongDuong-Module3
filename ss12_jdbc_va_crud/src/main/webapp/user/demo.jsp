<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            margin-top: 20px;
            background: #f8f8f8
        }
    </style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="row flex-lg-nowrap">

        <div class="col">

            <div class="row flex-lg-nowrap">
                <div class="col mb-3">
                    <div class="e-panel card">
                        <div class="card-body">
                            <div class="card-title">
                                <h6 class="mr-2"><span>Users</span><small class="px-1">Be a wise leader</small></h6>
                            </div>
                            <div class="e-table">
                                <div class="table-responsive table-lg mt-3">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td colspan="4">
                                                <form method="post" action="/users?">
                                                    <input type="hidden" name="action" value="search">
                                                    <input type="text" name="country" placeholder="country">
                                                    <input type="submit" value="Search">
                                                </form>
                                            </td>
                                            <td>
                                                <a href="/users?action=sort">Sắp xếp theo tên</a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Country</th>
                                            <th>Actions</th>
                                        </tr>
                                        <td class="align-middle">
                                            <div class="custom-control custom-control-inline custom-checkbox custom-control-nameless m-0 align-top">
                                                <input type="checkbox" class="custom-control-input" id="item-12">
                                                <label class="custom-control-label" for="item-12"></label>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <div class="bg-light d-inline-flex justify-content-center align-items-center align-top"
                                                 style="width: 35px; height: 35px; border-radius: 3px;"><i
                                                    class="fa fa-fw fa-photo" style="opacity: 0.8;"></i></div>
                                        </td>
                                        <td class="text-nowrap align-middle">Letizia Puncher</td>
                                        <td class="text-nowrap align-middle"><span>09 Dec 2017</span></td>
                                        <td class="text-center align-middle"><i
                                                class="fa fa-fw text-secondary cursor-pointer fa-toggle-off"></i>
                                        </td>
                                        <td class="text-center align-middle">
                                            <div class="btn-group align-top">
                                                <button class="btn btn-sm btn-outline-secondary badge" type="button"
                                                        data-toggle="modal" data-target="#user-form-modal">Edit
                                                </button>
                                                <button class="btn btn-sm btn-outline-secondary badge"
                                                        type="button"><i class="fa fa-trash"></i></button>
                                            </div>
                                        </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
