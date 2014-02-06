<%@ page import="dev.thenaturalhorse.co.za.ProductCategory" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="admin">
		<title>Admin - Supplier Order</title>
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
                    <li>
                        <a href="/adminSupplier/show/${supplierOrderInstance?.supplier?.id}">${supplierOrderInstance?.supplier?.name}</a> <span class="divider">/</span>
                    </li>
                    <li class="active">Supplier Order Edit</li>
                </ul>
            </div>
        </div>
        <div class="main-area dashboard">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <div class="page-header">
                            <h1>Edit - Supplier Order #${supplierOrderInstance?.id}</h1>
                        </div>
                    </div>
                </div>
                <div class="span12">
                    <div class="slate">
                        <g:form class="form-horizontal" action="${actionName}" >
                            <fieldset>
                                <g:render template="/admin/supplierOrder/form-add-product"/>
                                <g:submitButton name="add" class="btn btn-info" value="Add To Supplier Order" />
                            </fieldset>
                        </g:form>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>
