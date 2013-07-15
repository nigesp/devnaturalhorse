<%--
  Created by IntelliJ IDEA.
  User: Nige
  Date: 2013/07/13
  Time: 5:30 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>The Natural Horse - Admin Products</title>
    <meta name="layout" content="admin">
</head>
<body>
    <div class="secondary-masthead">
        <div class="container">
            <ul class="breadcrumb">
                <li>
                    <a href="#">Admin</a> <span class="divider">/</span>
                </li>
                <li>
                    <a href="#">Shop</a> <span class="divider">/</span>
                </li>
                <li class="active">Products</li>
            </ul>
        </div>
    </div>

    <div class="main-area dashboard">
        <div class="container">

            %{--<div class="alert alert-info">
                <a class="close" data-dismiss="alert" href="#">x</a>
                <h4 class="alert-heading">Information</h4>
                The listing template can be used to list content that requires editing, such as pages, product catalogue, settings and members.
            </div>--}%

            %{--<div class="row">
                <div class="span12">
                    <div class="slate">

                        <form class="form-inline">
                            <input type="text" class="input-large" placeholder="Keyword...">
                            <select>
                                <option value=""> - From Date - </option>
                            </select>
                            <select>
                                <option value=""> - To Date - </option>
                            </select>
                            <select>
                                <option value=""> - Filter - </option>
                            </select>
                            <button type="submit" class="btn btn-primary">Filter Listings</button>
                        </form>

                    </div>
                </div>
            </div>--}%

            <div class="row">
                <div class="span12 listing-buttons">
                    %{--<button class="btn btn-info">Action</button>
                    <button class="btn btn-success">Action</button>--}%
                    <button class="btn btn-success btn-primary">Add New Product</button>
                </div>
                <div class="span12">
                    <div class="slate">
                        <div class="page-header">
                            <div class="btn-group pull-right">
                                <button class="btn dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-download-alt"></i> Export
                                    <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="">CSV</a></li>
                                    <li><a href="">Excel</a></li>
                                    <li><a href="">PDF</a></li>
                                </ul>
                            </div>
                            <h2>Products</h2>
                        </div>

                        %{--Labels that can be added to items:
                        <span class="label label-info">Item Status</span>
                        <span class="label label-warning">Item Status</span>
                        <span class="label label-important">Item Status</span>
                        <span class="label label-inverse">Item Status</span>
                        <span class="label label-success">Item Status</span>
                        <span class="label">Item Status</span>
                        --}%


                        <table class="orders-table table">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Supplier</th>
                                    <th>Available</th>
                                    <th class="actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <a href="form.html">Deep Sea Kelp</a> <br />
                                        <span class="meta">Added Today</span>
                                    </td>
                                    <td>
                                        <a href="">Honeyvale Herbs</a>
                                    </td>
                                    <td>
                                        <span>15</span>
                                    </td>
                                    <td class="actions">
                                        <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                        <a class="btn btn-small btn-primary" href="form.html">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="form.html">Ultimate Mix</a> <br />
                                        <span class="meta">03/07/2013</span>
                                    </td>
                                    <td>
                                        <a href="">Honeyvale Herbs</a>
                                    </td>
                                    <td>
                                        <span>9</span>
                                    </td>
                                    <td class="actions">
                                        <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                        <a class="btn btn-small btn-primary" href="form.html">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="form.html">Sport Horse Mix</a> <br />
                                        <span class="meta">24/06/2013</span>
                                    </td>
                                    <td>
                                        <a href="">The Herbal Horse</a>
                                    </td>
                                    <td>
                                        <span>7</span>
                                    </td>
                                    <td class="actions">
                                        <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                        <a class="btn btn-small btn-primary" href="form.html">View</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a href="form.html">Deep Sea Kelp</a> <br />
                                        <span class="meta">20/06/2013</span>
                                    </td>
                                    <td>
                                        <a href="">Honeyvale Herbs</a>
                                    </td>
                                    <td>
                                        <span>15</span>
                                    </td>
                                    <td class="actions">
                                        <a class="btn btn-small btn-danger" data-toggle="modal" href="#removeItem">Remove</a>
                                        <a class="btn btn-small btn-primary" href="form.html">View</a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="modal hide fade" id="removeItem">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">×</button>
                        <h3>Remove Item</h3>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you would like to remove this item?</p>
                    </div>
                    <div class="modal-footer">
                        <a href="#" class="btn" data-dismiss="modal">Close</a>
                        <a href="#" class="btn btn-danger">Remove</a>
                    </div>
                </div>

                <div class="span6">

                    <div class="pagination pull-left">
                        <ul>
                            <li><a href="#">Prev</a></li>
                            <li class="active">
                                <a href="#">1</a>
                            </li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">Next</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="span12 footer">

                    <p>&copy; Website Name 2012</p>

                </div>
            </div>
        </div>
    </div>
</body>
</html>